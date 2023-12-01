import { useState, useEffect } from "react";
import { Quiz } from "../global";
import { getQuizzes } from "./endpoints";
import QuizGrid from "./components/QuizGrid";
import Header from "./components/Header";
import { useDisclosure } from "@chakra-ui/react";
import CreateQuizDialog from "./components/CreateQuizDialog";



const Root: React.FC = () => {
    const [quizzes, setQuizzes] = useState<Quiz[]>([]);
    useEffect(() => { getQuizzes().then((q) => setQuizzes(q)) }, [quizzes]);
    const { isOpen, onOpen, onClose } = useDisclosure()

    return <>
        <Header onOpen={onOpen} />
        <CreateQuizDialog isOpen={isOpen} onClose={onClose} />
        <QuizGrid quizzes={quizzes}></QuizGrid>
    </>;
}

export default Root;
