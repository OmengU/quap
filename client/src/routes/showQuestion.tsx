import { ActionFunctionArgs, LoaderFunction, ParamParseKey, Params, useLoaderData } from "react-router-dom";
import { getQuestionById } from "./endpoints";
import { Paths, Question } from "../global";
import QuestionDisplay from "./components/question/QuestionDisplay";

interface TodoLoaderArgs extends ActionFunctionArgs {
    params: Params<ParamParseKey<typeof Paths.displayQuestion>>;
}

export const questionLoader: LoaderFunction = async ({ params }: TodoLoaderArgs) => {
    const questionId = params.questionId ?? "";
    const question = await getQuestionById(questionId);
    if (question == null) {
        throw new Response("", {
            status: 404,
            statusText: "Not Found",
        });
    }
    return question;
};

const ShowQuestion = () => {
    const question = useLoaderData() as Question;

    return <>
        <QuestionDisplay isEditing={false} question={question} />
    </>
}

export default ShowQuestion;