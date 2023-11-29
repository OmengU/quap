import { useLoaderData, useParams } from "react-router-dom";
import { getQuestionById } from "./endpoints";
import { Question } from "../global";
import QuestionDisplay from "./components/question/QuestionDisplay";

type Parms = {
    questionId: string;
}

function invariant(value: unknown): asserts value {
    if (value) return;

    throw new Error("Invariant violation");
}

export async function questionloader() {
    const { questionId } = useParams<Parms>();
    invariant(questionId);
    const question = await getQuestionById(questionId);
    return question;
}

const ShowQuestion = () => {
    const question = useLoaderData() as Question;

    return <>
    <QuestionDisplay isEditing={false} question={question} />
    </>
}

export default ShowQuestion;