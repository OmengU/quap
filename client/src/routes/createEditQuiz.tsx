import { Paths, Question } from "../global";
import Sidebar from "./components/createEditQuiz/Sidebar";
import { getQuestions } from "./endpoints";
import { ActionFunctionArgs, LoaderFunction, Outlet, ParamParseKey, Params, useLoaderData } from "react-router";

interface TodoLoaderArgs extends ActionFunctionArgs {
    params: Params<ParamParseKey<typeof Paths.editQuiz>>;
}

export const loader: LoaderFunction = async ({ params }: TodoLoaderArgs) => {
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

const CreateEditQuiz = () => {
    const questions = useLoaderData() as Array<Question>;

    return <>
        <Sidebar questions={questions} />
        <Outlet />
    </>
}

export default CreateEditQuiz