import { useLocation } from "react-router-dom";
import { GameQuestionDto } from "../global";

const GameTutor = () => {
    const location = useLocation();
    const data: GameQuestionDto = location.state;
    console.log(data);

    return <>
    </>
}

export default GameTutor;