export interface Quiz {
    quizId: string;
    name: string;
    description: string;
    nQuestions: number;
}
export type QuizDto = {
    name: string,
    description: string
}
export const URL = 'http://localhost:5220/api/Quiz';