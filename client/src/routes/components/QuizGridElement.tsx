import { DeleteIcon, EditIcon } from "@chakra-ui/icons";
import { Badge, Button, ButtonGroup, Card, CardBody, CardFooter, CardHeader, Divider, Flex, Heading, Spacer, Text } from "@chakra-ui/react";
import { Form, Link } from "react-router-dom";

type Props = {
    quizName: string,
    description: string,
    nQuestions: number,
    id: string;
}

const QuizGridElement = ({ quizName, description, nQuestions, id }: Props) => {
    return <Card maxW='sm'>
        <CardHeader>
            <Flex direction='row'>
                <Heading size='lg'>{quizName}</Heading>
                <Spacer />
                <Badge fontSize='.9rem' colorScheme="green">{nQuestions} {nQuestions == 1 ? "Question" : "Questions"}</Badge>
            </Flex>
        </CardHeader>
        <Divider color='grey' />
        <CardBody>
            <Text size='md'>
                {description}
            </Text>
        </CardBody>
        <CardFooter>
            <ButtonGroup spacing='2'>
                <Form method="post" action={`startgame/${id}`}>
                    <Button variant='solid' colorScheme='green' type="submit">
                        Play
                    </Button>
                </Form>
                <Button leftIcon={<EditIcon />} variant='outline' colorScheme='green'>
                    <Link to={`editquiz/${id}`}>
                        Edit
                    </Link>
                </Button>
                <Form method="DELETE" action={`deletequiz/${id}`}>
                    <Button type="submit" leftIcon={<DeleteIcon />} variant='solid' colorScheme='red'>
                        Delete
                    </Button>
                </Form>
            </ButtonGroup>
        </CardFooter>
    </Card>
}
export default QuizGridElement;