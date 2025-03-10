import { FC, useEffect, useState } from 'react';
import { Tree, Empty } from 'antd';
import { FolderOutlined, FileOutlined } from '@ant-design/icons';
import type { DataNode } from 'antd/es/tree';

interface FileExplorerProps {
  onFileSelect: (filePath: string) => void;
  currentFile?: string;
}

interface FileNode {
  title: string;
  key: string;
  isLeaf: boolean;
  children?: FileNode[];
}

const FileExplorer: FC<FileExplorerProps> = ({ onFileSelect, currentFile }) => {
  const [treeData, setTreeData] = useState<DataNode[]>([]);

  useEffect(() => {
    const loadProcessFiles = async () => {
      try {
        // 从后端API获取processes目录下的文件列表
        const response = await fetch('/api/files/processes');
        const files = await response.json();

        // 将文件列表转换为树形结构
        const processedData: DataNode[] = [{
          title: 'processes',
          key: 'processes',
          children: files.map((file: string) => ({
            title: file,
            key: `processes/${file}`,
            isLeaf: true,
            icon: <FileOutlined />
          }))
        }];

        setTreeData(processedData);
      } catch (error) {
        console.error('加载文件列表失败:', error);
      }
    };

    loadProcessFiles();
  }, []);

  const handleSelect = (selectedKeys: string[]) => {
    if (selectedKeys.length > 0 && selectedKeys[0] !== 'processes') {
      onFileSelect(selectedKeys[0]);
    }
  };

  return (
    <div style={{ height: '100%', overflow: 'auto', padding: '12px' }}>
      {treeData.length > 0 ? (
        <Tree
          showIcon
          defaultExpandAll
          selectedKeys={currentFile ? [currentFile] : []}
          treeData={treeData}
          onSelect={handleSelect}
          icon={<FolderOutlined />}
        />
      ) : (
        <Empty
          image={Empty.PRESENTED_IMAGE_SIMPLE}
          description="暂无文件"
        />
      )}
    </div>
  );
};

export default FileExplorer;