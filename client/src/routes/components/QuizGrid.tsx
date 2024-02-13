import { SimpleGrid } from "@chakra-ui/react";
import { Quiz } from "../../global";
import QuizGridElement from "./QuizGridElement";

type Props = { quizzes: Quiz[]; }

const QuizGrid = ({ quizzes }: Props) => {

    return <SimpleGrid columns={{ base: 1, md: 2, lg: quizzes.length < 4 ? quizzes.length : 4 }} spacing={10} ml={10} mr={10}>
        {quizzes.map((q) =>
            <QuizGridElement quizName={q.name} description={q.description} nQuestions={q.nQuestions} id={q.quizId} key={q.quizId} />
        )}
    </SimpleGrid>
}

export default QuizGrid;