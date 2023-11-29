import { Form, Link } from "react-router-dom";
import { Question } from "../../../global";
import { Button, Flex, Heading } from "@chakra-ui/react";
import { CheckIcon } from "@chakra-ui/icons";

type Props = { questions: Question[]; }

const Sidebar = ({ questions }: Props) => {
    return <>
        <Flex direction='column' justify='space-between' align='flex-start' ml='3' h='100%'>
            <div id="sidebar">
                <Heading mb='8'>Quap</Heading>
                <nav>
                    {questions.length != 0 ? (
                        <ul>
                            {questions.map((q) =>
                                <Link to={`question/${q.questionId}`}>
                                    <Button colorScheme="green">
                                        {q.questionName != "" ? (
                                            <>
                                                {q.questionName}
                                            </>
                                        ) : (
                                            <>Empty</>
                                        )}
                                    </Button>

                                </Link>
                            )}
                        </ul>
                    ) : (
                        <p>
                            <i>No questions</i>
                        </p>
                    )}
                    <Button colorScheme="green" mt='5'>
                        <Form method="post">
                            <button type="submit">New</button>
                        </Form>
                    </Button>

                </nav>
            </div>
            <Button colorScheme="green" leftIcon={<CheckIcon />}>Save</Button>
        </Flex>
    </>
}
export default Sidebar