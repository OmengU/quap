import ReactDOM from 'react-dom/client'
import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import App from './App.tsx'
//import './index.css'
import Root from './routes/root.tsx'
import { ChakraProvider } from '@chakra-ui/react'
import Test from './routes/test.tsx'
import CreateEditQuiz from './routes/createEditQuiz.tsx'
import ShowQuestion from './routes/showQuestion.tsx'
import { Paths } from './global.ts'
import { addOptionAction, deleteOptionAction, deleteQuestionAction, questionAction, questionLoader } from './routes/LoaderActionFunctions/QuestionLA.ts'
import { addQuestionAction as addQuestionAction, deleteQuizAction, loader, quizLoader } from './routes/LoaderActionFunctions/QuizLA.ts'
import CreateEditQuestion from './routes/createEditQuestion.tsx'

const router = createBrowserRouter([
  {
    path: "/",
    element: <Root />,
    loader: quizLoader,
    children: [
      {
        path: Paths.deleteQuiz,
        action: deleteQuizAction,
      },
    ]
  },
  {
    path: Paths.editQuiz,
    element: <CreateEditQuiz />,
    loader: loader,
    action: addQuestionAction,
    children: [
      {
        path: Paths.displayQuestion,
        element: <ShowQuestion />,
        loader: questionLoader,
      },
      {
        path: Paths.editQuestion,
        element: <CreateEditQuestion />,
        loader: questionLoader,
        action: questionAction,
      },
      {
        path: Paths.deleteQuestion,
        action: deleteQuestionAction,
      },
      {
        path: Paths.deleteOption,
        action: deleteOptionAction,
      },
      {
        path: Paths.addOption,
        action: addOptionAction,
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
    <RouterProvider router={router} />
  </ChakraProvider>
)
