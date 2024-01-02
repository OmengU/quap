import { ActionFunction, ActionFunctionArgs, ParamParseKey, Params, redirect } from "react-router";
import { Game, Paths } from "../../global";
import { initializeGame } from "../endpoints";

interface GameArgs extends ActionFunctionArgs {
    params: Params<ParamParseKey<typeof Paths.startGame>>;
}

export const startGameAction: ActionFunction = async ({ params }: GameArgs) => {
    const quizId = params.quizId ?? "";
    const game: Game = await initializeGame(quizId);
    return redirect(`../wait/${game.gameId}`);
}