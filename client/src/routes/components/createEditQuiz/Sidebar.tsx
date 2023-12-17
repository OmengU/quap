import { Form, Link } from "react-router-dom";
import { QType, Question } from "../../../global";
import { Badge, Box, Button, ButtonGroup, Card, CardBody, Flex, Heading, IconButton, Spacer, Text } from "@chakra-ui/react";
import { AddIcon, CheckIcon, CloseIcon, DeleteIcon } from "@chakra-ui/icons";

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
                                <Box key={q.questionId} display={"flex"} flexDirection={"row"}>
                                    <Button colorScheme="green" borderRightRadius={0} onClick={(event) => { event.preventDefault(); }}>
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
                                    <Form method="DELETE" action={`deletequestion/${q.questionId}`}>
                                        <IconButton type="submit" aria-label='Delete Question' colorScheme="red" icon={<DeleteIcon />} borderLeftRadius={0} />
                                    </Form>
                                </Box>

                            )}
                        </ButtonGroup>
                    ) : (
                        <Card mb={5} align={"center"} variant={"filled"}>
                            <CardBody>
                                <Text>No Questions</Text>
                            </CardBody>
                        </Card>
                    )}
                    <Form method="post">
                        <Button type="submit" colorScheme="green" leftIcon={<AddIcon />} >New</Button>
                    </Form>
                </nav>
            </div>
            <Spacer />
            <ButtonGroup mb={"5"}>
                <Button colorScheme="green" leftIcon={<CheckIcon />} size={'lg'}>Save</Button>
                <Button colorScheme="red" variant={"outline"} leftIcon={<CloseIcon />} size={"lg"}>
                    <Link to={"/"}>
                        Cancel
                    </Link>
                </Button>
            </ButtonGroup>
        </Flex>
    </>
}
export default Sidebar