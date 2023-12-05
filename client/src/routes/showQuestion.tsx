import { useLoaderData } from "react-router-dom";
import { Question } from "../global";
import QuestionDisplay from "./components/question/QuestionDisplay";
import { Flex } from "@chakra-ui/react";
import OptionsDisplay from "./components/question/OptionsDisplay";


const ShowQuestion = () => {
    const question = useLoaderData() as Question;

    console.log(question.points);

    return <>
        <Flex direction={"row"} gap={20}>
            <QuestionDisplay isEditing={false} question={question} />
            <OptionsDisplay options={question.options} type={question.type} isEditing={false} questionId={question.questionId} />
        </Flex>

    </>
}

export default ShowQuestion;