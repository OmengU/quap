import { Quiz } from "../../global";
import QuizGridElement from "./QuizGridElement";

type Props = { quizzes: Quiz[]; }

const QuizGrid = ({ quizzes }: Props) => {

    return <div>
        {quizzes.map((q) =>
            <QuizGridElement quizName={q.name} description={q.description} nQuestions={q.nQuestions} id={q.quizId} key={q.quizId} />
        )}

    </div>
}

export default QuizGrid;