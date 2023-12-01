import { useLoaderData } from "react-router-dom";
import { Question } from "../global";
import QuestionDisplay from "./components/question/QuestionDisplay";


const ShowQuestion = () => {
    const question = useLoaderData() as Question;

    console.log(question.points);

    return <>
        <QuestionDisplay isEditing={false} question={question}/>
    </>
}

export default ShowQuestion;