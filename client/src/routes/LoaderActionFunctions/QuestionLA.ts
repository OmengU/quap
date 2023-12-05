import { ActionFunctionArgs, Params, ParamParseKey, LoaderFunction, redirect, ActionFunction } from "react-router";
import { Paths, QuestionDto } from "../../global";
import { addOption, deleteOption, deleteQuestion, getQuestionById, updateQuestion } from "../endpoints";

interface QuestionLoaderArgs extends ActionFunctionArgs {
    params: Params<ParamParseKey<typeof Paths.displayQuestion>>;
}

interface OptionDeleteArgs extends ActionFunctionArgs {
    params: Params<ParamParseKey<typeof Paths.deleteOption>>;
}

interface AddOptionArgs extends ActionFunctionArgs {
    params: Params<ParamParseKey<typeof Paths.addOption>>;
}

type QuestionActionArgs = {
    request: Request,
    params: Params<ParamParseKey<typeof Paths.displayQuestion>>,
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

export async function questionAction({ request, params }: QuestionActionArgs) {
    const formData = await request.formData();
    const updates = Object.fromEntries(formData);
    const questionId = params.questionId ?? "";

    const questionDto: QuestionDto = {
        questionName: updates.questionName as string,
        //type: QType[updates.type as keyof typeof QType] as QType,
        type: Number(updates.type) as number,
        timeLimit: Number(updates.timeLimit as unknown),
        points: Number(updates.points as unknown),
    };

    await updateQuestion(questionId, questionDto);
    return redirect(`../question/${params.questionId}`);
}

export const deleteQuestionAction : ActionFunction = async ({ params } : QuestionLoaderArgs) => {
    const questionId = params.questionId ?? "";
    await deleteQuestion(questionId);
    return redirect(`../`);
}

export const deleteOptionAction : ActionFunction = async ({ params } : OptionDeleteArgs) => {
    const optionId = params.optionId ?? "";
    const questionId = params.questionId ?? "";
    await deleteOption(optionId);
    return redirect(`../question/${questionId}`);
}

export const addOptionAction: ActionFunction = async({ params }: AddOptionArgs) => {
    const questionId = params.questionId ?? "";
    await addOption(questionId);
    return redirect(`../question/${questionId}`)
}

