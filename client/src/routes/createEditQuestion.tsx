import { useLoaderData } from "react-router";
import { OptionDto, QType, Question } from "../global";
import QuestionDisplay from "./components/question/QuestionDisplay";
import { OptionsContext } from "./showQuestion";
import OptionsDisplay from "./components/question/OptionsDisplay";
import { Flex } from "@chakra-ui/react";
import { createContext, useState } from "react";

type TypeContextType = {
    type: QType,
    setType: React.Dispatch<React.SetStateAction<QType>>
}

const iTypeContextState = {
    type: QType.SingleChoice,
    setType: () => { }
}

type OptionErrorContextType = {
    hasOptionError: boolean,
    setOptionError: React.Dispatch<React.SetStateAction<boolean>>
}

const iOptionErrorContextState = {
    hasOptionError: true,
    setOptionError: () => { }
}

export const TypeContext = createContext<TypeContextType>(iTypeContextState);
export const OptionErrorContext = createContext<OptionErrorContextType>(iOptionErrorContextState);

const CreateEditQuestion = () => {
    const q = useLoaderData() as Question;

    const [type, setType] = useState<QType>(q.type);
    const [question] = useState<Question>(q);
    const [hasOptionError, setOptionError] = useState<boolean>(true);
    const [options, setOptions] = useState<{ [key: string]: OptionDto }>(() => {
        if (question.options.length > 0) {
            return question.options.reduce((acc: { [key: string]: OptionDto; }, option) => {
                acc[option.oId] = {
                    optionText: option.optionText,
                    isCorrect: option.isCorrect
                };
                return acc;
            }, {});
        } else return {}
    });

    return <>
        <OptionsContext.Provider value={{ options, setOptions }}>
            <OptionErrorContext.Provider value={{ hasOptionError, setOptionError }}>
                <TypeContext.Provider value={{ type, setType }}>
                    <Flex direction={"row"} gap={20}>
                        <QuestionDisplay isEditing={true} question={question} />
                        <OptionsDisplay options={q.options} isEditing={true} questionId={question.questionId} />
                    </Flex>
                </TypeContext.Provider>
            </OptionErrorContext.Provider>
        </OptionsContext.Provider>
    </>
}

export default CreateEditQuestion