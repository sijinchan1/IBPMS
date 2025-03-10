import fs from 'fs';
import path from 'path';

const PROCESSES_DIR = path.join(process.cwd(), 'processes');

export const getProcessFiles = async (): Promise<string[]> => {
  try {
    // 确保processes目录存在
    if (!fs.existsSync(PROCESSES_DIR)) {
      fs.mkdirSync(PROCESSES_DIR, { recursive: true });
    }

    // 读取目录内容
    const files = await fs.promises.readdir(PROCESSES_DIR);
    
    // 只返回.bpmn文件
    return files.filter(file => file.endsWith('.bpmn'));
  } catch (error) {
    console.error('读取processes目录失败:', error);
    throw error;
  }
};

export const readProcessFile = async (filename: string): Promise<string> => {
  try {
    const filePath = path.join(PROCESSES_DIR, filename);
    const content = await fs.promises.readFile(filePath, 'utf-8');
    return content;
  } catch (error) {
    console.error(`读取文件 ${filename} 失败:`, error);
    throw error;
  }
};

export const saveProcessFile = async (filename: string, content: string): Promise<void> => {
  try {
    const filePath = path.join(PROCESSES_DIR, filename);
    await fs.promises.writeFile(filePath, content, 'utf-8');
  } catch (error) {
    console.error(`保存文件 ${filename} 失败:`, error);
    throw error;
  }
};