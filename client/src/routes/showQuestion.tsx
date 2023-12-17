import { useLoaderData } from "react-router-dom";
import { Question } from "../global";
import QuestionDisplay from "./components/question/QuestionDisplay";
import { Flex } from "@chakra-ui/react";
import OptionsDisplay from "./components/question/OptionsDisplay";
import { createContext, useState } from "react";

type OptionNamesContextType = {
    optionNames: { [key: string]: string },
    setOptionNames: React.Dispatch<React.SetStateAction<{ [key: string]: string }>>
}

const iOptionNamesContextState = {
    optionNames: {},
    setOptionNames: () => { }
}


export const OptionNamesContext = createContext<OptionNamesContextType>(iOptionNamesContextState);

const ShowQuestion = () => {
    const question = useLoaderData() as Question;
    const [optionNames, setOptionNames] = useState<{ [key: string]: string }>({});

    console.log(question.points);

    return <>
        <OptionNamesContext.Provider value={{ optionNames, setOptionNames }}>
            <Flex direction={"row"} gap={20}>
                <QuestionDisplay isEditing={false} question={question} />
                <OptionsDisplay options={question.options} isEditing={false} questionId={question.questionId} />
            </Flex>
        </OptionNamesContext.Provider>
    </>
}

export default ShowQuestion;