import { Question, QuestionDto, Quiz, QuizDto, URL, sURL, Option, Game, GameURL } from "../global";


type GetQuizzes = () => Promise<Quiz[]>
type CreateQuiz = (body: QuizDto) => Promise<Quiz>
type GetQuestions = (quizId: string) => Promise<Question[]>
type GetQuestionById = (questionId: string) => Promise<Question>
type UpdateQuestion = (questionId: string, body: QuestionDto) => Promise<Question>
type AddQuestion = (quizId: string) => Promise<Question>
type AddOption = (questionId: string) => Promise<Option>
type Delete = (id: string) => void
type ToggleOption = (optionId: string) => void
type SetText = (optionId: string, text: string) => Promise<Option>

type InitializeGame = (quizId: string) => Promise<Game>
type GetCurrGameId = () => Promise<string>
type GetIP = () => Promise<string>


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
        const response = await fetch(`${sURL}/questions/${quizId}`);
        const data = await response.json();
        return data as Question[];
    } catch (e) {
        throw e;
    }
}

export const getQuestionById: GetQuestionById = async (questionId: string) => {
    try {
        const response = await fetch(`${URL}/question/${questionId}`);
        const data = await response.json();
        return data as Question;
    } catch (e) {
        throw e;
    }
}

export const updateQuestion: UpdateQuestion = async (id: string, body: QuestionDto) => {
    const response = await fetch(`${URL}/updatequestion/${id}`, {
        method: 'PATCH',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(body),
    });
    const data = await response.json();

    return data as Question;
}
export const addQuestion: AddQuestion = async (id: string) => {
    const response = await fetch(`${URL}/${id}/addquestion`, {
        method: 'PATCH',
        headers: {
            'Content-Type': 'application/json',
        },
    });
    const data = await response.json();

    return data as Question;
}

export const addOption: AddOption = async (questionid: string) => {
    const response = await fetch(`${URL}/${questionid}/addoption`, {
        method: 'PATCH',
        headers: {
            'Content-Type': 'application/json',
        },
    });
    const data = await response.json();

    return data as Option;
}

export const deleteQuestion: Delete = async (id: string) => {
    await fetch(`${URL}/deletequestion/${id}`, {
        method: 'DELETE'
    });
}

export const deleteQuiz: Delete = async (id: string) => {
    await fetch(`${URL}/deletequiz/${id}`, {
        method: 'DELETE'
    });
}

export const deleteOption: Delete = async (id: string) => {
    await fetch(`${URL}/deleteoption/${id}`, {
        method: 'DELETE'
    });
}

export const toggleOption: ToggleOption = async (optionId: string) => {
    await fetch(`${URL}/${optionId}/togglecorrect`, {
        method: 'PATCH'
    });
}

export const setText: SetText = async (optionId: string, text: string) => {
    const response = await fetch(`${URL}/${optionId}/settext`, {
        method: 'PATCH',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(text),
    });
    const data = await response.json();

    return data as Option;
}

export const initializeGame: InitializeGame = async (quizId: string) => {
    const headers = { 'Content-Type': 'application/json' };

    try {
        const response = await fetch(`${GameURL}/${quizId}`, {
            method: 'POST',
            headers,
        });
        const data = await response.json();

        return data as Game;
    } catch (error) {
        console.error(error);
        throw error;
    }
}

export const getCurrGameId: GetCurrGameId = async () => {
    try {
        const response = await fetch(`${GameURL}/active`)
        const data = await response.json();
        return data as string;
    } catch (e) {
        throw e;
    }
}

export const getIP: GetIP = async () => {
    try {
        const response = await fetch(`${GameURL}/ip`)
        const data = await response.text();
        return data as string;
    } catch (e) {
        throw e;
    }
}