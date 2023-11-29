import React from 'react'
import ReactDOM from 'react-dom/client'
import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import App from './App.tsx'
//import './index.css'
import Root from './routes/root.tsx'
import { ChakraProvider } from '@chakra-ui/react'
import Test from './routes/test.tsx'
import CreateEditQuiz, { loader } from './routes/createEditQuiz.tsx'
import ShowQuestion, { questionLoader } from './routes/showQuestion.tsx'
import { Paths } from './global.ts'

const router = createBrowserRouter([
  {
    path: "/",
    element: <Root />
  },
  {
    path: Paths.editQuiz,
    element: <CreateEditQuiz />,
    loader: loader,
    children: [
      {
        path: Paths.displayQuestion,
        element: <ShowQuestion />,
        loader: questionLoader,
      },
    ]
  },
  {
    path: "/app",
    element: <App />
  },
  {
    path: "/test",
    element: <Test />
  }
])

ReactDOM.createRoot(document.getElementById('root')!).render(
  <ChakraProvider>
    <React.StrictMode>
      <RouterProvider router={router} />
    </React.StrictMode>
  </ChakraProvider>,
)
