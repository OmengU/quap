import { Quiz, QuizDto, URL } from "../global";


type GetQuizzes = () => Promise<Quiz[]>
type CreateQuiz = (body: QuizDto) => Promise<Quiz>


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