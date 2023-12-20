import { useLoaderData } from "react-router";
import { QType, Question } from "../global";
import QuestionDisplay from "./components/question/QuestionDisplay";
import { OptionNamesContext } from "./showQuestion";
import OptionsDisplay from "./components/question/OptionsDisplay";
import { Flex } from "@chakra-ui/react";
import { createContext, useEffect, useState } from "react";

type TypeContextType = {
    type: QType,
    setType: React.Dispatch<React.SetStateAction<QType>>
}

const iTypeContextState = {
    type: QType.SingleChoice,
    setType: () => { }
}


export const TypeContext = createContext<TypeContextType>(iTypeContextState);

const CreateEditQuestion = () => {
    const q = useLoaderData() as Question;

    const [optionNames, setOptionNames] = useState<{ [key: string]: string }>({});
    const [type, setType] = useState<QType>(q.type);
    const [question, setQuestion] = useState<Question>(q);

    useEffect(() => {
        console.log(optionNames);
    }, [optionNames])

    return <>
        <OptionNamesContext.Provider value={{ optionNames, setOptionNames }}>
            <TypeContext.Provider value={{ type, setType }}>
                <Flex direction={"row"} gap={20}>
                    <QuestionDisplay isEditing={true} question={question} />
                    <OptionsDisplay options={q.options} isEditing={true} questionId={question.questionId} />
                </Flex>
            </TypeContext.Provider>
        </OptionNamesContext.Provider>
    </>
}

export default CreateEditQuestion