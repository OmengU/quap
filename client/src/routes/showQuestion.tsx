import { useLoaderData } from "react-router-dom";
import { OptionDto, Question } from "../global";
import QuestionDisplay from "./components/question/QuestionDisplay";
import { Flex } from "@chakra-ui/react";
import OptionsDisplay from "./components/question/OptionsDisplay";
import { createContext, useEffect, useState } from "react";

type OptionsContextType = {
    options: { [key: string]: OptionDto },
    setOptions: React.Dispatch<React.SetStateAction<{ [key: string]: OptionDto }>>
}

const iOptionsContextState = {
    options: {},
    setOptions: () => { }
}


export const OptionsContext = createContext<OptionsContextType>(iOptionsContextState);

const ShowQuestion = () => {
    const question = useLoaderData() as Question;
    const [options, setOptions] = useState<{ [key: string]: OptionDto }>({});

    // everytime a new question is selected the right options are set as the options
    useEffect(() => {
        setOptions(() => {
            if(question.options.length > 0){
                return question.options.reduce((acc: { [key: string]: OptionDto; }, option) => {
                    acc[option.oId] = {
                        optionText: option.optionText,
                        isCorrect: option.isCorrect
                    };
                    return acc;
                }, {});
            } else return {}
        })
    }, [question])

    return <>
        <OptionsContext.Provider value={{ options, setOptions }}>
            <Flex direction={"row"} gap={20}>
                <QuestionDisplay isEditing={false} question={question} />
                <OptionsDisplay options={question.options} isEditing={false} questionId={question.questionId} />
            </Flex>
        </OptionsContext.Provider>
    </>
}

export default ShowQuestion;