import { createBrowserRouter } from 'react-router-dom';
import WelcomePage from './components/WelcomePage';
import DataManagement from './components/DataManagement';
import BpmnModeler from './components/BpmnModeler';

const router = createBrowserRouter([
  {
    path: '/',
    element: <WelcomePage />,
  },
  {
    path: '/process-management',
    element: <DataManagement />,
  },
  {
    path: '/modeler',
    element: <BpmnModeler />,
  },
]);

export default router;