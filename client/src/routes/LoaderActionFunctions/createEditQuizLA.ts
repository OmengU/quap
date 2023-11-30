import { ActionFunctionArgs, Params, ParamParseKey, LoaderFunction } from "react-router";
import { Paths } from "../../global";
import { getQuestions } from "../endpoints";

interface QuestionsLoaderArgs extends ActionFunctionArgs {
    params: Params<ParamParseKey<typeof Paths.editQuiz>>;
}

export const loader: LoaderFunction = async ({ params }: QuestionsLoaderArgs) => {
    const quizId = params.quizId ?? "";
    const questions = await getQuestions(quizId);
    if (questions == null) {
        throw new Response("", {
            status: 404,
            statusText: "Not Found",
        });
    }
    return questions;
};