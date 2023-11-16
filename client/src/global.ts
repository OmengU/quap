export interface Quiz {
    quizId: string;
    name: string;
    description: string;
    nQuestions: number;
}
export const URL = 'http://localhost:5220/api/Quiz';