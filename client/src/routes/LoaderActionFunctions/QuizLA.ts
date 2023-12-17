import { ActionFunctionArgs, Params, ParamParseKey, LoaderFunction, ActionFunction, redirect } from "react-router";
import { Paths, Question } from "../../global";
import { addQuestion, deleteQuiz, getQuestions, getQuizzes } from "../endpoints";

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

export const quizLoader: LoaderFunction = async () => {
    const quizzes = await getQuizzes();
    if (quizzes == null) {
        throw new Response("", {
            status: 404,
            statusText: "Not Found",
        });
    }
    return quizzes;
}

export const addQuestionAction: ActionFunction = async ({ params }: QuestionsLoaderArgs) => {
    const quizId = params.quizId ?? "";
    const question: Question = await addQuestion(quizId);
    return redirect(`editquestion/${question.questionId}`);
}

export const deleteQuizAction: ActionFunction = ({ params }: QuestionsLoaderArgs) => {
    const quizId = params.quizId ?? "";
    deleteQuiz(quizId);
    return redirect(`../`);
}