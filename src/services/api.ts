import express from 'express';
import { getProcessFiles, readProcessFile, saveProcessFile } from './fileService';

const router = express.Router();

// 获取processes目录下的所有BPMN文件
router.get('/files/processes', async (req, res) => {
  try {
    const files = await getProcessFiles();
    res.json(files);
  } catch (error) {
    res.status(500).json({ error: '获取文件列表失败' });
  }
});

// 读取指定的BPMN文件内容
router.get('/files/processes/:filename', async (req, res) => {
  try {
    const { filename } = req.params;
    const content = await readProcessFile(filename);
    res.json({ content });
  } catch (error) {
    res.status(500).json({ error: '读取文件失败' });
  }
});

// 保存BPMN文件内容
router.post('/files/processes/:filename', async (req, res) => {
  try {
    const { filename } = req.params;
    const { content } = req.body;
    await saveProcessFile(filename, content);
    res.json({ message: '文件保存成功' });
  } catch (error) {
    res.status(500).json({ error: '保存文件失败' });
  }
});

export default router;