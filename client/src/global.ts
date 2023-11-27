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
    name: string;
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
export const URL = 'http://localhost:5220/api/Quiz';