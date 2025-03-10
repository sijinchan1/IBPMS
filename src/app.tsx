import { FC } from 'react';
import { RouterProvider as ReactRouterProvider } from 'react-router-dom';
import router from './router';
import './App.css';
import React from 'react';

const App: FC = () => {
  return <ReactRouterProvider router={router} />;
};

export default App;