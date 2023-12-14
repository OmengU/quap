import { useLoaderData } from "react-router";
import { Question } from "../global";
import QuestionDisplay from "./components/question/QuestionDisplay";
import { OptionNamesContext } from "./showQuestion";
import OptionsDisplay from "./components/question/OptionsDisplay";
import { Flex } from "@chakra-ui/react";
import { useEffect, useState } from "react";

const CreateEditQuestion = () => {
    const question = useLoaderData() as Question;

    const [optionNames, setOptionNames] = useState<{ [key: string]: string }>({});

    useEffect(() => {
        console.log(optionNames);
    },[optionNames])

    return <>
        <OptionNamesContext.Provider value={{optionNames, setOptionNames}}>
            <Flex direction={"row"} gap={20}>
                <QuestionDisplay isEditing={true} question={question}/>
                <OptionsDisplay options={question.options} type={question.type} isEditing={true} questionId={question.questionId}/>
            </Flex>
        </OptionNamesContext.Provider>
    </>
}

export default CreateEditQuestion