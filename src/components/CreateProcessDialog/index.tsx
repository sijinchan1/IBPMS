import { FC, useState, useEffect } from 'react';
import './index.css';

interface CreateProcessDialogProps {
  visible: boolean;
  onClose: () => void;
  onCreateProcess: (name: string, description: string) => void;
  onLoadProcess: (process: SimilarProcess) => void;
}

interface SimilarProcess {
  id: string;
  name: string;
  description: string;
}

const mockSimilarProcesses: SimilarProcess[] = [
  {
    id: '1',
    name: '订单处理流程',
    description: '处理客户订单从提交到完成的全过程'
  },
  {
    id: '2',
    name: '订单审核流程',
    description: '订单信息审核及风险评估流程'
  },
  {
    id: '3',
    name: '订单发货流程',
    description: '订单商品打包、发货及物流跟踪流程'
  },
  {
    id: '4',
    name: '订单退换货流程',
    description: '处理客户退货、换货申请的审批流程'
  },
  {
    id: '5',
    name: '订单售后流程',
    description: '处理订单相关的售后服务及客户反馈'
  }
];

const CreateProcessDialog: FC<CreateProcessDialogProps> = ({
  visible,
  onClose,
  onCreateProcess,
  onLoadProcess
}) => {
  const [processName, setProcessName] = useState('');
  const [processDescription, setProcessDescription] = useState('');
  const [similarProcesses, setSimilarProcesses] = useState<SimilarProcess[]>([]);
  const [selectedProcess, setSelectedProcess] = useState<SimilarProcess | null>(null);

  useEffect(() => {
    if (processName.trim()) {
      // TODO: 这里将来需要替换为真实的相似流程推荐API调用
      const filtered = mockSimilarProcesses.filter(process =>
        process.name.toLowerCase().includes(processName.toLowerCase())
      );
      setSimilarProcesses(filtered);
    } else {
      setSimilarProcesses([]);
    }
  }, [processName]);

  if (!visible) return null;

  return (
    <div className="dialog-overlay">
      <div className="create-process-dialog">
        <div className="dialog-header">
          <h2>新建业务流程</h2>
          <button className="close-button" onClick={onClose}>×</button>
        </div>
        <div className="dialog-content">
          <div className="input-section">
            <div className="form-group">
              <label>业务流程名称 <span className="required">*</span></label>
              <input
                type="text"
                value={processName}
                onChange={(e) => setProcessName(e.target.value)}
                placeholder="请输入业务流程名称"
                required
              />
            </div>
            <div className="form-group">
              <label>业务流程描述</label>
              <textarea
                value={processDescription}
                onChange={(e) => setProcessDescription(e.target.value)}
                placeholder="请输入业务流程描述（可选）"
                rows={4}
              />
            </div>
          </div>
          <div className="recommendation-section">
            <h3>相似流程推荐</h3>
            <div className="similar-process-list">
              {similarProcesses.map(process => (
                <div
                  key={process.id}
                  className={`similar-process-item ${selectedProcess?.id === process.id ? 'selected' : ''}`}
                  onClick={() => setSelectedProcess(process)}
                >
                  <span className="check-icon">{selectedProcess?.id === process.id ? '✓' : ''}</span>
                  <div>
                    <h4>{process.name}</h4>
                    <p>{process.description}</p>
                  </div>
                </div>
              ))}
              {processName && similarProcesses.length === 0 && (
                <div className="no-results">未找到相似流程</div>
              )}
            </div>
          </div>
        </div>
        <div className="dialog-footer">
          <button
            className="primary-button"
            onClick={() => onCreateProcess(processName, processDescription)}
            disabled={!processName.trim()}
          >
            创建新流程
          </button>
          <button
            className="secondary-button"
            onClick={() => selectedProcess && onLoadProcess(selectedProcess)}
            disabled={!selectedProcess}
          >
            载入选中流程
          </button>
        </div>
      </div>
    </div>
  );
};

export default CreateProcessDialog;