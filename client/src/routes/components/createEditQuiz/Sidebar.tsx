import { Form, Link, NavLink } from "react-router-dom";
import { Question } from "../../../global";

type Props = {
    questions: Question[];
}

const Sidebar = ({ questions }: Props) => {
    return <>
        <div id="sidebar">
            <h1>React Router Contacts</h1>
            <div>
            </div>
            <nav>
                {questions.length != 0 ? (
                    <ul>
                        {questions.map((question) => (
                            <li key={question.questionId}>
                                <NavLink
                                    to={`question/${question.questionId}`}
                                    className={({ isActive, isPending }) =>
                                        isActive
                                            ? "active"
                                            : isPending
                                                ? "pending"
                                                : ""
                                    }
                                >
                                    <Link to={`question/${question.questionId}`}>
                                        {question.name != "" ? (
                                            <>
                                                {question.name}
                                            </>
                                        ) : (
                                            <i>No Name</i>
                                        )}
                                    </Link>
                                </NavLink>

                            </li>
                        ))}
                    </ul>
                ) : (
                    <p>
                        <i>No questions</i>
                    </p>
                )}
                <Form method="post">
                    <button type="submit">New</button>
                </Form>
            </nav>
        </div>
    </>
}
export default Sidebar