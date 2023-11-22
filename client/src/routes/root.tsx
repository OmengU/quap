import { useState, useEffect } from "react";
import { Quiz } from "../global";
import { getQuizzes } from "./endpoints";
import QuizGrid from "./components/QuizGrid";
import Header from "./components/Header";



const Root: React.FC = () => {
    const [quizzes, setQuizzes] = useState<Quiz[]>([]);
    useEffect(() => { getQuizzes().then((q) => setQuizzes(q)) }, []);

    return <>
        <Header />
        <QuizGrid quizzes={quizzes}></QuizGrid>
    </>;
}

export default Root;
