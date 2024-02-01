import { useState, useEffect, createContext } from "react";
import { Quiz } from "../global";
import { checkIfPassword, getQuizzes } from "./endpoints";
import QuizGrid from "./components/QuizGrid";
import Header from "./components/Header";
import { useDisclosure } from "@chakra-ui/react";
import CreateQuizDialog from "./components/CreateQuizDialog";
import { useLoaderData } from "react-router";


type PasswordContextType = {
    hasPassword: boolean,
    setHasPassword: React.Dispatch<React.SetStateAction<boolean>>
}

const iPasswordContextState = {
    hasPassword: false,
    setHasPassword: () => { },
}


export const PasswordContext = createContext<PasswordContextType>(iPasswordContextState);

const Root: React.FC = () => {
    const quizzes = useLoaderData() as Array<Quiz>;

    const [hasPassword, setHasPassword] = useState<boolean>(false);

    useEffect(() => {
        const passwordCheck = async () => {
            await checkIfPassword().then(r => r.ok ? setHasPassword(true) : (r.status == 404 ? setHasPassword(false) : setHasPassword(false)))
        }
        passwordCheck();
    }, []);

    const { isOpen, onOpen, onClose } = useDisclosure()

    console.log(hasPassword);

    return <>
        <PasswordContext.Provider value={{ hasPassword, setHasPassword }}>
            <Header onOpen={onOpen} />
            <CreateQuizDialog isOpen={isOpen} onClose={onClose} />
            <QuizGrid quizzes={quizzes}></QuizGrid>
        </PasswordContext.Provider>

    </>;
}

export default Root;
