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
import { startGameAction } from './routes/LoaderActionFunctions/GameLA.ts'
import WaitingRoom from './routes/gameWaitingRoom.tsx'
import JoinGame from './routes/joinGame.tsx'
import GameTutor from './routes/gameTutor.tsx'
import GamePlayer from './routes/gamePlayer.tsx'
import Scoreboard from './routes/scoreboard.tsx'

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
      {
        path: Paths.startGame,
        action: startGameAction,
      },
    ]
  },
  {
    path: Paths.gameWaitingRoom,
    element: <WaitingRoom />,
  },
  {
    path: Paths.joinGame,
    element: <JoinGame />,
  },
  {
    path: Paths.gameTutor,
    element: <GameTutor />,
  },
  {
    path: Paths.gameStudent,
    element: <GamePlayer />,
  },
  {
    path: Paths.scoreboard,
    element: <Scoreboard />,
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
