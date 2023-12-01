import { useLoaderData } from "react-router";
import { Question } from "../global";
import QuestionDisplay from "./components/question/QuestionDisplay";

const CreateEditQuestion = () => {
    const question = useLoaderData() as Question;

    return <>
        <QuestionDisplay isEditing={true} question={question}/>
    </>
}

export default CreateEditQuestion