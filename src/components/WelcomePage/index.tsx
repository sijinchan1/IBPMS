import { FC } from 'react';
import { useNavigate } from 'react-router-dom';
import './index.css';

const WelcomePage: FC = () => {
  const navigate = useNavigate();

  return (
    <div className="welcome-container">
      <div className="welcome-header">
        <h1>智能业务流程建模系统</h1>
        <p className="subtitle">欢迎使用智能业务流程建模系统，为您提供直观的流程管理和智能的建模工具。</p>
      </div>
      
      <div className="features-container">
        <div 
          className="feature-card" 
          onClick={() => navigate('/process-management')}
        >
          <div className="icon-wrapper">
            <svg className="feature-icon" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M19 3H5C3.89 3 3 3.9 3 5V19C3 20.1 3.89 21 5 21H19C20.1 21 21 20.1 21 19V5C21 3.9 20.1 3 19 3ZM19 19H5V5H19V19Z" fill="currentColor"/>
              <path d="M17 7H7V9H17V7Z" fill="currentColor"/>
              <path d="M17 11H7V13H17V11Z" fill="currentColor"/>
              <path d="M17 15H7V17H17V15Z" fill="currentColor"/>
            </svg>
          </div>
          <h2>业务流程管理</h2>
          <p>查看和管理所有业务流程，包含流程名称、创建时间等详细信息。</p>
        </div>

        <div 
          className="feature-card" 
          onClick={() => navigate('/modeler')}
        >
          <div className="icon-wrapper">
            <svg className="feature-icon" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M19 3H5C3.89 3 3 3.9 3 5V19C3 20.1 3.89 21 5 21H19C20.1 21 21 20.1 21 19V5C21 3.9 20.1 3 19 3ZM19 19H5V5H19V19Z" fill="currentColor"/>
              <path d="M12 6L9 9H11V13H13V9H15L12 6Z" fill="currentColor"/>
              <path d="M12 18L15 15H13V11H11V15H9L12 18Z" fill="currentColor"/>
            </svg>
          </div>
          <h2>开始建模</h2>
          <p>使用直观的可视化界面进行业务流程建模，智能推荐助您轻松创建和编辑流程图。</p>
        </div>
      </div>
    </div>
  );
};

export default WelcomePage;