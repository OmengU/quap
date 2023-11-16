import { Quiz } from "../../global";

type Props = { quizzes: Quiz[]; }

const QuizGrid = ({ quizzes }: Props) => {

    return <div>
        <ul>
            {quizzes.map((q) =>
                <li key={q.quizId}>{q.name} : {q.description}</li>
            )}
        </ul>

    </div>
}

export default QuizGrid;