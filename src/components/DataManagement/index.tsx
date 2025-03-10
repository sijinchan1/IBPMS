import { useState } from 'react';
import { Table, Button, Modal, Form, Input, message } from 'antd';
import { useNavigate } from 'react-router-dom';
import 'antd/dist/reset.css';
import './index.css';
import type { ColumnsType } from 'antd/es/table';

interface ProcessData {
  key: string;
  name: string;
  language: string;
  description: string;
  createdAt: string;
}

const DataManagement: React.FC = () => {
  const navigate = useNavigate();
  const [data, setData] = useState<ProcessData[]>([
    {
      key: '1',
      name: '采购流程',
      language: 'BPMN 2.0',
      description: '企业采购审批流程',
      createdAt: '2025-01-15 10:30:00'
    },
    {
      key: '2',
      name: '审批流程',
      language: 'BPMN 2.0',
      description: '通用审批流程模板',
      createdAt: '2025-01-16 14:20:00'
    },
    {
      key: '3',
      name: '请假流程',
      language: 'BPMN 2.0',
      description: '员工请假审批流程',
      createdAt: '2025-01-17 09:15:00'
    },
    {
      key: '4',
      name: '报销流程',
      language: 'BPMN 2.0',
      description: '费用报销审批流程',
      createdAt: '2025-01-18 11:45:00'
    },
    {
      key: '5',
      name: '入职流程',
      language: 'BPMN 2.0',
      description: '新员工入职办理流程',
      createdAt: '2025-01-19 14:30:00'
    },
    {
      key: '6',
      name: '离职流程',
      language: 'BPMN 2.0',
      description: '员工离职办理流程',
      createdAt: '2025-01-20 16:20:00'
    },
    {
      key: '7',
      name: '合同审批流程',
      language: 'BPMN 2.0',
      description: '合同审核与签署流程',
      createdAt: '2025-01-21 10:00:00'
    },
    {
      key: '8',
      name: '项目立项流程',
      language: 'BPMN 2.0',
      description: '新项目立项审批流程',
      createdAt: '2025-01-22 13:40:00'
    },
    {
      key: '9',
      name: '会议室预订流程',
      language: 'BPMN 2.0',
      description: '会议室使用预订流程',
      createdAt: '2025-01-23 15:10:00'
    },
    {
      key: '10',
      name: '出差申请流程',
      language: 'BPMN 2.0',
      description: '员工出差申请审批流程',
      createdAt: '2025-01-24 08:50:00'
    },
    {
      key: '11',
      name: '培训管理流程',
      language: 'BPMN 2.0',
      description: '员工培训计划制定与执行流程',
      createdAt: '2025-01-25 09:20:00'
    },
    {
      key: '12',
      name: '绩效考核流程',
      language: 'BPMN 2.0',
      description: '员工绩效评估与考核流程',
      createdAt: '2025-01-26 11:30:00'
    },
    {
      key: '13',
      name: '客户投诉处理流程',
      language: 'BPMN 2.0',
      description: '客户投诉接收与处理流程',
      createdAt: '2025-01-27 14:15:00'
    },
    {
      key: '14',
      name: '库存管理流程',
      language: 'BPMN 2.0',
      description: '仓库库存盘点与管理流程',
      createdAt: '2025-01-28 16:40:00'
    },
    {
      key: '15',
      name: '质量控制流程',
      language: 'BPMN 2.0',
      description: '产品质量检测与控制流程',
      createdAt: '2025-01-29 10:50:00'
    }
  ]);

  const columns: ColumnsType<ProcessData> = [
    {
      title: '名称',
      dataIndex: 'name',
      key: 'name',
      align: 'center',
    },
    {
      title: '建模语言',
      dataIndex: 'language',
      key: 'language',
      align: 'center',
    },
    {
      title: '简介',
      dataIndex: 'description',
      key: 'description',
      align: 'center',
    },
    {
      title: '创建时间',
      dataIndex: 'createdAt',
      key: 'createdAt',
      align: 'center',
    },
    {
      title: '操作',
      key: 'action',
      align: 'center',
      render: (_, record) => (
        <span>
          <Button type="link" onClick={() => handleEdit(record)}>编辑</Button>
          <Button type="link" danger onClick={() => handleDelete(record.key)}>删除</Button>
        </span>
      ),
    },
  ];

  const [isModalVisible, setIsModalVisible] = useState(false);
  const [form] = Form.useForm();
  const [editingKey, setEditingKey] = useState('');

  const handleAdd = () => {
    setIsModalVisible(true);
  };

  const handleEdit = (record: ProcessData) => {
    form.setFieldsValue(record);
    setEditingKey(record.key);
    setIsModalVisible(true);
  };

  const handleDelete = (key: string) => {
    setData(data.filter(item => item.key !== key));
    message.success('删除成功');
  };

  const handleModalOk = () => {
    form.validateFields().then(values => {
      if (editingKey) {
        setData(data.map(item => {
          if (item.key === editingKey) {
            return { ...item, ...values };
          }
          return item;
        }));
        message.success('更新成功');
      } else {
        const newData = {
          key: Date.now().toString(),
          ...values,
          language: 'BPMN 2.0',
          createdAt: new Date().toLocaleString()
        };
        setData([...data, newData]);
        message.success('创建成功');
      }
      setIsModalVisible(false);
      setEditingKey('');
      form.resetFields();
    });
  };

  const handleModalCancel = () => {
    setIsModalVisible(false);
    setEditingKey('');
    form.resetFields();
  };

  return (
    <div className="data-management-container">
      <div className="header">
        <div className="logo-section">
          <img src="/ai-tech.svg" alt="Logo" className="logo" />
          <h1 className="title">业务流程管理</h1>
        </div>
      </div>
      <div className="content">
        <div className="table-container">
          <Table 
            columns={columns} 
            dataSource={data} 
            pagination={{ 
              pageSize: 10,
              total: data.length,
              showTotal: (total) => `共 ${total} 条数据`
            }} 
          />
        </div>
        <div className="button-container">
          <Button type="primary" onClick={handleAdd}>新建流程</Button>
          <Button onClick={() => navigate('/')}>返回首页</Button>
        </div>
      </div>
      <Modal
        title={editingKey ? '编辑流程' : '新建流程'}
        open={isModalVisible}
        onOk={handleModalOk}
        onCancel={handleModalCancel}
        footer={[
          <Button key="cancel" onClick={handleModalCancel}>取消</Button>,
          <Button key="modeler" type="primary" onClick={() => navigate('/modeler')}>去建模</Button>,
          <Button key="submit" type="primary" onClick={handleModalOk}>{editingKey ? '更新' : '创建'}</Button>,
        ]}
      >
        <Form form={form} layout="vertical">
          <Form.Item
            name="name"
            label="流程名称"
            rules={[{ required: true, message: '请输入流程名称' }]}
          >
            <Input />
          </Form.Item>
          <Form.Item
            name="description"
            label="流程简介"
            rules={[{ required: true, message: '请输入流程简介' }]}
          >
            <Input.TextArea rows={4} />
          </Form.Item>
        </Form>
      </Modal>
    </div>
  );
};

export default DataManagement;