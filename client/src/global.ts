export declare type Params<Key extends string = string> = {
    readonly [key in Key]: string | undefined;
};

export const Paths = {
    editQuiz: "/editquiz/:quizId",
    displayQuestion: "question/:questionId",
    editQuestion: "editquestion/:questionId",
    deleteQuestion: "deletequestion/:questionId",
    deleteQuiz: "deletequiz/:quizId",
    deleteOption: "deleteoption/:questionId/:optionId",
    addOption: "addoption/:questionId",
    startGame: "startgame/:quizId",
    gameWaitingRoom: "wait/:gameId",
    joinGame: "play",
    gameTutor: "gameTeacher",
    gameStudent: "gameStudent",
} as const;

export const colors = ["#FF7F7F", "#7BEf7B ", "#7F7FFF", "#FF7FFF", "#FFA500", " #79F5F5"];

export enum QType {
    SingleChoice,
    MultipleChoice,
}
export interface Quiz {
    quizId: string;
    name: string;
    description: string;
    questions: Question[]
    nQuestions: number;
}
export interface Question {
    questionId: string;
    questionName: string;
    nOptions: number;
    options: Option[];
    type: QType;
    timeLimit: number;
    points: number;
    quizId: string;
}
export interface Option {
    oId: string;
    optionText: string;
    isCorrect: boolean;
    questionId: string;
}
export interface Player {
    playerId: string;
    name: string;
    icon: string;
    score: number;
    gameId: string;
}
export interface Game {
    gameId: string;
    players: Player[];
    nPlayers: number;
    quiz: Quiz;
    current: boolean;
}
export type QuizDto = {
    name: string,
    description: string
}

export type QuestionDto = {
    questionName: string,
    type: QType,
    timeLimit: number,
    points: number,
}

export type GameQuestionDto = {
    questionName: string,
    type: QType,
    timeLimit: number,
    points: number,
    options: GameOptionDto[],
}

export type GameOptionDto = {
    oId: string;
    optionText: string;
}

export type PlayerDto = {
    name: string;
    icon: string;
}

export const URL = 'http://localhost:5220/api/Quiz';
export const GameURL = 'http://localhost:5220/api/Game'
export const sURL = 'http://localhost:5220';