import { Question, Quiz, QuizDto, URL } from "../global";


type GetQuizzes = () => Promise<Quiz[]>
type CreateQuiz = (body: QuizDto) => Promise<Quiz>
type GetQuestions = (quizId: string) => Promise<Question[]>
type GetQuestionById = (questionId: string) => Promise<Question>


export const getQuizzes: GetQuizzes = async () => {
    try {
        const response = await fetch(URL);
        const data = await response.json();
        return data as Quiz[];
    } catch (e) {
        throw e;
    }
}

export const createQuiz: CreateQuiz = async (body: QuizDto) => {
    const headers = { 'Content-Type': 'application/json' };
    console.log(body);

    try {
        const response = await fetch(URL, {
            method: 'POST',
            headers,
            body: JSON.stringify(body),
        });

        const data = await response.json();

        return data as Quiz;
    } catch (error) {
        console.error(error);
        throw error;
    }
}

export const getQuestions: GetQuestions = async (quizId: string) => {
    try {
        const response = await fetch(`${URL}/questions/${quizId}`);
        const data = await response.json();
        return data as Question[];
    } catch (e) {
        throw e;
    }
}

export const getQuestionById: GetQuestionById = async (questionId: string) => {
    try {
        throw Error("Error");
    }
}