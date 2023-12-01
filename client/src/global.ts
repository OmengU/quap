export declare type Params<Key extends string = string> = {
    readonly [key in Key]: string | undefined;
};

export const Paths = {
    editQuiz: "/editquiz/:quizId",
    displayQuestion: "question/:questionId",
    editQuestion: "editquestion/:questionId",
    deleteQuestion: "deletequestion/:questionId",
    deleteQuiz: "deletequiz/:quizId",
} as const;

export enum QType {
    SingleChoice,
    MultipleChoice,
}
export interface Quiz {
    quizId: string;
    name: string;
    description: string;
    nQuestions: number;
}
export interface Question {
    questionId: string;
    questionName: string;
    nOptions: number;
    type: QType;
    timeLimit: number;
    points: number;
    quizId: string;
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

export const URL = 'http://localhost:5220/api/Quiz';
export const sURL = 'http://localhost:5220';