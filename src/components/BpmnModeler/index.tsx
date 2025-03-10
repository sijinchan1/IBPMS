import { useEffect, useRef, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import BpmnModeler from 'bpmn-js/lib/Modeler';
import { Button, Modal, Layout, message } from 'antd';
import 'bpmn-js/dist/assets/diagram-js.css';
import 'bpmn-js/dist/assets/bpmn-font/css/bpmn.css';
import 'bpmn-js/dist/assets/bpmn-js.css';
import './index.css';
import CreateProcessDialog from '../CreateProcessDialog';
import LabelRecommendation from './LabelRecommendation';

// 导入必要的模块
import PaletteModule from 'bpmn-js/lib/features/palette';
import ContextPadModule from 'bpmn-js/lib/features/context-pad';

const { Header, Sider, Content } = Layout;

const emptyBpmn = `<?xml version="1.0" encoding="UTF-8"?>
<bpmn:definitions xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:bpmn="http://www.omg.org/spec/BPMN/20100524/MODEL"
  xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI"
  xmlns:dc="http://www.omg.org/spec/DD/20100524/DC"
  xmlns:di="http://www.omg.org/spec/DD/20100524/DI"
  id="Definitions_1"
  targetNamespace="http://bpmn.io/schema/bpmn">
  <bpmn:process id="Process_1" isExecutable="false">
    <bpmn:startEvent id="StartEvent_1" />
  </bpmn:process>
  <bpmndi:BPMNDiagram id="BPMNDiagram_1">
    <bpmndi:BPMNPlane id="BPMNPlane_1" bpmnElement="Process_1">
      <bpmndi:BPMNShape id="_BPMNShape_StartEvent_2" bpmnElement="StartEvent_1">
        <dc:Bounds x="152" y="102" width="36" height="36" />
      </bpmndi:BPMNShape>
    </bpmndi:BPMNPlane>
  </bpmndi:BPMNDiagram>
</bpmn:definitions>`;

interface FileNode {
  name: string;
  type: 'file' | 'directory';
  children?: FileNode[];
  path: string;
  unsaved?: boolean;
}

const mockData: FileNode[] = [
  {
    name: '我的业务流程',
    type: 'directory',
    path: '/example',
    children: [
      {
        name: '采购流程.bpmn',
        type: 'file',
        path: '/example/purchase.bpmn'
      },
      {
        name: '审批流程.bpmn',
        type: 'file',
        path: '/example/approval.bpmn'
      }
    ]
  }
];

const BpmnEditor: React.FC = () => {
  const containerRef = useRef<HTMLDivElement>(null);
  const modelerRef = useRef<BpmnModeler | null>(null);
  const navigate = useNavigate();
  const [currentFile, setCurrentFile] = useState<string>('');
  const [unsavedFiles, setUnsavedFiles] = useState<Set<string>>(new Set());
  const [expandedFolders, setExpandedFolders] = useState<Set<string>>(new Set());
  const [isCreateDialogVisible, setIsCreateDialogVisible] = useState(false);
  const [recommendationState, setRecommendationState] = useState({
    visible: false,
    position: { x: 0, y: 0 },
    element: null as any
  });

  const handleFileSelect = async (path: string) => {
    if (currentFile && unsavedFiles.has(currentFile)) {
      Modal.confirm({
        title: '提示',
        content: '当前流程尚未保存，是否保存更改？',
        okText: '保存',
        cancelText: '不保存',
        onOk: async () => {
          await handleSaveFile();
          setCurrentFile(path);
          loadBpmnFile(path);
        },
        onCancel: () => {
          setCurrentFile(path);
          loadBpmnFile(path);
        }
      });
    } else {
      setCurrentFile(path);
      loadBpmnFile(path);
    }
  };

  const loadBpmnFile = async (path: string) => {
    const modeler = modelerRef.current;
    if (modeler) {
      try {
        // 从本地文件系统读取BPMN文件
        const response = await fetch(path);
        if (!response.ok) {
          throw new Error('无法读取文件');
        }
        const bpmnXML = await response.text();
        
        // 导入BPMN XML到画布
        await modeler.importXML(bpmnXML);
        
        // 调整画布缩放
        const canvas = modeler.get('canvas');
        canvas.zoom('fit-viewport');
        
        message.success('流程图加载成功');
      } catch (err) {
        console.error('加载BPMN出错:', err);
        message.error('流程图加载失败');
      }
    }
  };

  const handleSaveFile = async () => {
    const modeler = modelerRef.current;
    if (modeler && currentFile) {
      try {
        const { xml } = await modeler.saveXML({ format: true });
        const blob = new Blob([xml], { type: 'application/xml' });
        const url = window.URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = currentFile.split('/').pop() || 'process.bpmn';
        document.body.appendChild(a);
        a.click();
        window.URL.revokeObjectURL(url);
        document.body.removeChild(a);
        
        // 移除未保存标记
        setUnsavedFiles(prev => {
          const next = new Set(prev);
          next.delete(currentFile);
          return next;
        });
      } catch (err) {
        console.error('保存BPMN出错:', err);
      }
    }
  };

  useEffect(() => {
    if (!containerRef.current) return;

    const modeler = new BpmnModeler({
      container: containerRef.current
    });

    modelerRef.current = modeler;
    modeler.importXML(emptyBpmn);

    // 添加元素选择事件监听
    const eventBus = modeler.get('eventBus');
    const selection = modeler.get('selection');

    eventBus.on('element.click', (e) => {
      const { element } = e;
      if (element && !element.labelTarget) {
        selection.select(element);
      }
    });

    // 添加双击事件监听
    eventBus.on('element.dblclick', (e) => {
      const { element } = e;
      if (element && !element.labelTarget) {
        setRecommendationState({
          visible: true,
          position: { x: e.originalEvent.clientX, y: e.originalEvent.clientY },
          element: element
        });
      }
    });

    return () => {
      modeler.destroy();
    };
  }, []);

  useEffect(() => {
    if (!modelerRef.current) return;

    const modeler = modelerRef.current;
    const eventBus = modeler.get('eventBus');

    const handleChanged = () => {
      if (currentFile) {
        setUnsavedFiles(prev => new Set(prev).add(currentFile));
      }
    };

    eventBus.on('commandStack.changed', handleChanged);

    return () => {
      eventBus.off('commandStack.changed', handleChanged);
    };
  }, [currentFile]);

  const toggleFolder = (path: string) => {
    const newExpanded = new Set(expandedFolders);
    if (newExpanded.has(path)) {
      newExpanded.delete(path);
    } else {
      newExpanded.add(path);
    }
    setExpandedFolders(newExpanded);
  };

  const handleCreateNewProcess = () => {
    setIsCreateDialogVisible(true);
  };

  const handleCreateProcess = (name: string, description: string) => {
    const newFileName = `${name}.bpmn`;
    const newFile: FileNode = {
      name: newFileName,
      type: 'file',
      path: `/example/${newFileName}`
    };

    mockData[0].children?.push(newFile);
    setExpandedFolders(new Set(['/example']));
    handleFileSelect(newFile.path);
    setIsCreateDialogVisible(false);
  };

  const handleLoadProcess = (process: { name: string }) => {
    const newFileName = `${process.name}.bpmn`;
    const newFile: FileNode = {
      name: newFileName,
      type: 'file',
      path: `/example/${newFileName}`
    };

    mockData[0].children?.push(newFile);
    setExpandedFolders(new Set(['/example']));
    handleFileSelect(newFile.path);
    setIsCreateDialogVisible(false);
  };

  const handleFileClick = (node: FileNode, event: React.MouseEvent) => {
    if (node.type === 'directory') {
      toggleFolder(node.path);
    } else if (event.detail === 2) { // 双击事件
      handleFileSelect(node.path);
    }
  };

  const renderFileTree = (nodes: FileNode[], level: number = 0) => {
    return nodes.map((node) => (
      <div key={node.path} style={{ paddingLeft: `${level * 20}px` }}>
        <div
          key={node.path}
          className={`file-explorer-item ${node.type === 'directory' ? 'directory' : 'file'} ${currentFile === node.path ? 'active' : ''} ${node.expanded ? 'expanded' : ''}`}
          onClick={() => handleFileClick(node)}
          >
            {node.type === 'directory' && (
              <span className="toggle-icon" onClick={(e) => {
                e.stopPropagation();
                handleToggleDirectory(node);
              }}>
                ▶
              </span>
            )}
            <span className="icon">{node.type === 'directory' ? '📁' : '📄'}</span>
            <span className={`name ${node.unsaved ? 'unsaved' : ''}`}>{node.name}</span>
            {node.children && node.expanded && (
              <div className="children">
                {node.children.map((child) => renderFileTree(child))}
              </div>
            )}
          </div>
        {node.type === 'directory' &&
          expandedFolders.has(node.path) &&
          node.children &&
          renderFileTree(node.children, level + 1)}
      </div>
    ));
  };

  const handleClose = () => {
    setRecommendationState(prev => ({ ...prev, visible: false }));
  };

  return (
    <Layout className="bpmn-container">
      <Header className="header">
        <div className="logo-section">
          <img src="/ai-tech.svg" alt="Logo" className="logo" />
          <h1 className="title">业务流程建模</h1>
        </div>
        <Button className="back-button" onClick={() => navigate('/')}>返回首页</Button>
      </Header>
      <Layout className="content">
        <Sider width={300} className="sider">
          <div className="file-explorer">
            <div className="file-explorer-header">
              <h3>资源管理器</h3>
              <button className="create-process-btn" onClick={handleCreateNewProcess}>
                新建流程
              </button>
              <div className="file-explorer-buttons">
                <div className="button-row">
                  <button className="file-button" onClick={handleOpenFile}>
                    打开
                  </button>
                  <button className="file-button" onClick={handleSaveFile}>
                    保存
                  </button>
                </div>
              </div>
            </div>
            <div className="file-explorer-content">{renderFileTree(mockData)}</div>
            <CreateProcessDialog
              visible={isCreateDialogVisible}
              onClose={() => setIsCreateDialogVisible(false)}
              onCreateProcess={handleCreateProcess}
              onLoadProcess={handleLoadProcess}
            />
            </div>
          </Sider>
          <Content className="canvas-container">
            <div ref={containerRef} className="canvas" />
            <LabelRecommendation
              visible={recommendationState.visible}
              position={recommendationState.position}
              onSelect={(label) => {
                if (recommendationState.element) {
                  const modeling = modelerRef.current?.get('modeling');
                  modeling?.updateLabel(recommendationState.element, label);
                }
                handleClose();
              }}
              onClose={handleClose}
            />
          </Content>
      </Layout>
    </Layout>
  );
};

export default BpmnEditor;

const handleOpenFile = async () => {
  const input = document.createElement('input');
  input.type = 'file';
  input.accept = '.bpmn';
  
  input.onchange = async (e) => {
    const file = (e.target as HTMLInputElement).files?.[0];
    if (file) {
      try {
        const content = await file.text();
        const modeler = modelerRef.current;
        if (modeler) {
          await modeler.importXML(content);
          const canvas = modeler.get('canvas');
          canvas.zoom('fit-viewport');
          message.success('流程图加载成功');
          
          // 添加到文件列表
          const newFile: FileNode = {
            name: file.name,
            type: 'file',
            path: `/example/${file.name}`
          };
          mockData[0].children?.push(newFile);
          setCurrentFile(newFile.path);
        }
      } catch (err) {
        console.error('加载BPMN出错:', err);
        message.error('流程图加载失败');
      }
    }
  };
  
  input.click();
};