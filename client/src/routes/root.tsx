import { useState, useEffect } from "react";
import { Quiz } from "../global";
import { getQuizzes } from "./endpoints";
import QuizGrid from "./components/QuizGrid";



const Root: React.FC = () => {
    const [quizzes, setQuizzes] = useState<Quiz[]>([]);
    useEffect(() => { getQuizzes().then((q) => setQuizzes(q)) }, []);

    return <>
        <div className="test">
            <h1 className="testheading">this is a test :)</h1>
            <p className="testtext">this is a text test!!!!</p>
        </div>
        <QuizGrid quizzes={quizzes}></QuizGrid>
    </>;
}

export default Root;
