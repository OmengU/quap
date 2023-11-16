import { Quiz, URL } from "../global";

type GetQuizzes = () => Promise<Quiz[]>

export const getQuizzes: GetQuizzes = async () => {
    try {
        const response = await fetch(URL);
        const data = await response.json();
        return data as Quiz[];
    } catch (e) {
        throw e;
    }
}

