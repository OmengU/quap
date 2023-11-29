import React from 'react'
import ReactDOM from 'react-dom/client'
import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import App from './App.tsx'
//import './index.css'
import Root from './routes/root.tsx'
import { ChakraProvider } from '@chakra-ui/react'
import Test from './routes/test.tsx'
import CreateEditQuiz, { loader } from './routes/createEditQuiz.tsx'
import ShowQuestion, { questionloader } from './routes/showQuestion.tsx'

const router = createBrowserRouter([
  {
    path: "/",
    element: <Root />
  },
  {
    path:"editquiz/:quizId",
    element: <CreateEditQuiz />,
    loader: loader,
    children: [
      {
        path:"question/questionId",
        element: <ShowQuestion />,
        loader: questionloader,
      }
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
