import { Form, Link } from "react-router-dom";
import { QType, Question } from "../../../global";
import { Badge, Box, Button, ButtonGroup, Flex, Heading, IconButton, Spacer } from "@chakra-ui/react";
import { AddIcon, CheckIcon, DeleteIcon } from "@chakra-ui/icons";

type Props = { questions: Question[]; }

const Sidebar = ({ questions }: Props) => {
    return <>
        <Flex direction='column' align='flex-start' ml='3' h='100vh' borderRight={"2px solid darkgray"} p={5}>
            <div id="sidebar">
                <Heading mb='8'>Quap</Heading>
                <nav>
                    {questions.length != 0 ? (
                        <ButtonGroup display={'flex'} flexDirection={'column'} gap={3} alignItems={"flex-start"} mb={10} isAttached variant={'outline'}>
                            {questions.map((q) =>
                                <Box key={q.questionId}>
                                    <Button colorScheme="green" borderRightRadius={0} onClick={(event) => {event.preventDefault();}}>
                                        <Link to={`question/${q.questionId}`}>
                                            {q.questionName != "" ? (
                                                <>
                                                    {q.questionName}
                                                </>
                                            ) : (
                                                <>Empty</>
                                            )}
                                            <Badge colorScheme={q.type == QType.MultipleChoice ? 'pink' : 'purple'} ml={2}>{q.type == QType.MultipleChoice ? 'MC' : 'SC'}</Badge>
                                            <Badge colorScheme="green" ml={1}>{q.nOptions} Options</Badge>
                                        </Link>
                                    </Button>
                                    <IconButton aria-label='Delete Question' colorScheme="red" icon={<DeleteIcon />} borderLeftRadius={0} />
                                </Box>

                            )}
                        </ButtonGroup>
                    ) : (
                        <p>
                            <i>No questions</i>
                        </p>
                    )}
                    <Form method="post">
                        <Button type="submit" colorScheme="green" leftIcon={<AddIcon />} >New</Button>
                    </Form>
                </nav>
            </div>
            <Spacer />
            <Button colorScheme="green" leftIcon={<CheckIcon />} size={'lg'} mb={5}>Save</Button>
        </Flex>
    </>
}
export default Sidebar