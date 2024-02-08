import { Question, QuestionDto, Quiz, QuizDto, URL, sURL, Option, Game, GameURL, PasswordDto, ChangePasswordDto, OptionDto } from "../global";


type GetQuizzes = () => Promise<Quiz[]>
type GetQuizById = (quizId: string) => Promise<Quiz>
type CreateQuiz = (body: QuizDto) => Promise<Quiz>
type GetQuestions = (quizId: string) => Promise<Question[]>
type GetQuestionById = (questionId: string) => Promise<Question>
type UpdateQuiz = (quizId: string, body: QuizDto) => Promise<Quiz>
type UpdateQuestion = (questionId: string, body: QuestionDto) => Promise<Question>
type UpdateOption = (optionId: string, body: OptionDto) => Promise<Option>
type AddQuestion = (quizId: string) => Promise<Question>
type AddOption = (questionId: string) => Promise<Option>
type Delete = (id: string) => void

type InitializeGame = (quizId: string) => Promise<Game>
type GetIP = () => Promise<string>

type CheckIfPassword = () => Promise<Response>
type VerifyPassword = (dto: PasswordDto) => Promise<Response>
type RegisterPassword = (dto: PasswordDto) => Promise<Response>
type ChangePassword = (dto: ChangePasswordDto) => Promise<Response>


export const getQuizzes: GetQuizzes = async () => {
    try {
        const response = await fetch(`${URL}/Quiz`);
        const data = await response.json();
        return data as Quiz[];
    } catch (e) {
        throw e;
    }
}

export const getQuizById: GetQuizById = async (id: string) => {
    try {
        const response = await fetch(`${URL}/Quiz/${id}`);
        const data = await response.json();
        return data as Quiz;
    } catch (e) {
        throw e;
    }
}

export const createQuiz: CreateQuiz = async (body: QuizDto) => {
    const headers = { 'Content-Type': 'application/json' };
    console.log(body);

    try {
        const response = await fetch(`${URL}/Quiz`, {
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
        const response = await fetch(`${URL}/Quiz/${quizId}/questions`);
        const data = await response.json();
        return data as Question[];
    } catch (e) {
        throw e;
    }
}

export const getQuestionById: GetQuestionById = async (questionId: string) => {
    try {
        const response = await fetch(`${URL}/Question/${questionId}`);
        const data = await response.json();
        return data as Question;
    } catch (e) {
        throw e;
    }
}

export const updateQuiz: UpdateQuiz = async (id: string, body: QuizDto) => {
    const response = await fetch(`${URL}/Quiz/${id}`, {
        method: 'PATCH',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(body),
    });
    const data = await response.json();

    return data as Quiz;
}

export const updateQuestion: UpdateQuestion = async (id: string, body: QuestionDto) => {
    const response = await fetch(`${URL}/Question/${id}`, {
        method: 'PATCH',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(body),
    });
    const data = await response.json();

    return data as Question;
}

export const updateOption: UpdateOption = async (id: string, body: OptionDto) => {
    const response = await fetch(`${URL}/Option/${id}`, {
        method: 'PATCH',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(body),
    });
    const data = await response.json();

    return data as Option;
}

export const addQuestion: AddQuestion = async (quizId: string) => {
    const response = await fetch(`${URL}/Question/${quizId}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
    });
    const data = await response.json();

    return data as Question;
}

export const addOption: AddOption = async (questionid: string) => {
    const response = await fetch(`${URL}/Option/${questionid}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
    });
    const data = await response.json();

    return data as Option;
}

export const deleteQuestion: Delete = async (id: string) => {
    await fetch(`${URL}/Question/${id}`, {
        method: 'DELETE'
    });
}

export const deleteQuiz: Delete = async (id: string) => {
    await fetch(`${URL}/Quiz/${id}`, {
        method: 'DELETE'
    });
}

export const deleteOption: Delete = async (id: string) => {
    await fetch(`${URL}/Option/${id}`, {
        method: 'DELETE'
    });
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

export const getIP: GetIP = async () => {
    try {
        const response = await fetch(`${GameURL}/ip`)
        const data = await response.text();
        return data as string;
    } catch (e) {
        throw e;
    }
}

export const checkIfPassword: CheckIfPassword = async () => {
    try {
        const response = await fetch(`${sURL}/api/Auth`);
        return await response;
    } catch (e) {
        throw e
    }
}
export const verifyPassword: VerifyPassword = async (dto: PasswordDto) => {
    try {
        const response = await fetch(`${sURL}/api/Auth/verify`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(dto),
        });
        return await response;
    } catch (e) {
        throw e
    }
}
export const changePassword: ChangePassword = async (dto: ChangePasswordDto) => {
    try {
        const response = await fetch(`${sURL}/api/Auth/change-password`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(dto),
        });
        return await response;
    } catch (e) {
        throw e
    }
}
export const registerPassword: RegisterPassword = async (dto: PasswordDto) => {
    try {
        const response = await fetch(`${sURL}/api/Auth/register`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(dto),
        });
        return await response;
    } catch (e) {
        throw e
    }
}