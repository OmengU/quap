import { Question } from "../global";
import Sidebar from "./components/createEditQuiz/Sidebar";
import { getQuestions } from "./endpoints";
import { Outlet, useLoaderData, useParams } from "react-router";

type Parms = {
    questionId: string;
}


function invariant(value: unknown): asserts value {
    if (value) return;

    throw new Error("Invariant violation");
}

export async function loader() {
    const { questionId } = useParams<Parms>();
    invariant(questionId);
    const questions = await getQuestions(questionId);
    if (questions.length == 0) {
        throw new Response("", {
            status: 404,
            statusText: "Not Found",
        });
    }
    return { questions };
}
const CreateEditQuiz = () => {
    const questions = useLoaderData() as Question[];

    return <>
        <Sidebar questions={questions} />
        <Outlet />
    </>
}

export default CreateEditQuiz