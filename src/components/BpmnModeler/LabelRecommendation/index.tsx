import { FC, useEffect, useState, useRef, useCallback } from 'react';
import './index.css';

interface LabelRecommendationProps {
  position: { x: number; y: number };
  onSelect: (label: string) => void;
  visible: boolean;
  onClose: () => void;
}

const mockRecommendations = [
  '审核申请',
  '处理订单',
  '发送通知',
  '更新状态',
  '验证信息',
  '生成报告',
  '分配任务',
  '确认完成',
  '数据同步',
  '结果反馈'
];

const LabelRecommendation: FC<LabelRecommendationProps> = ({ position, onSelect, visible, onClose }) => {
  const [recommendations, setRecommendations] = useState<string[]>([]);
  const containerRef = useRef<HTMLDivElement>(null);

  const handleClickOutside = useCallback((event: MouseEvent) => {
    if (containerRef.current && !containerRef.current.contains(event.target as Node)) {
      onClose();
    }
  }, [onClose]);

  useEffect(() => {
    if (visible) {
      document.addEventListener('mousedown', handleClickOutside);
      return () => {
        document.removeEventListener('mousedown', handleClickOutside);
      };
    }
  }, [visible, handleClickOutside]);

  useEffect(() => {
    // TODO: 这里将来需要替换为真实的推荐服务API调用
    setRecommendations(mockRecommendations);
  }, []);

  if (!visible) return null;

  return (
    <div 
      ref={containerRef}
      className="label-recommendation"
      style={{
        left: `${position.x}px`,
        top: `${position.y}px`
      }}
    >
      <div className="label-recommendation-header">
        <div className="label-recommendation-title">标签推荐</div>
        <button className="label-recommendation-close" onClick={onClose}>
          ×
        </button>
      </div>
      <ul className="label-recommendation-list">
        {recommendations.map((label, index) => (
          <li 
            key={index}
            onClick={() => onSelect(label)}
            className="label-recommendation-item"
          >
            {label}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default LabelRecommendation;