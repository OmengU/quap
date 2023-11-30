import { ActionFunctionArgs, Params, ParamParseKey, LoaderFunction } from "react-router";
import { Paths } from "../../global";
import { getQuestionById } from "../endpoints";

interface QuestionLoaderArgs extends ActionFunctionArgs {
    params: Params<ParamParseKey<typeof Paths.displayQuestion>>;
}

export const questionLoader: LoaderFunction = async ({ params }: QuestionLoaderArgs) => {
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