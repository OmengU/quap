import { DeleteIcon, EditIcon } from "@chakra-ui/icons";
import { Badge, Button, ButtonGroup, Card, CardBody, CardFooter, CardHeader, Divider, Flex, Heading, Spacer, Text } from "@chakra-ui/react";
import { Link } from "react-router-dom";

type Props = {
    quizName: string,
    description: string,
    nQuestions: number,
    id: string;
}

const QuizGridElement = ({ quizName, description, nQuestions, id }: Props) => {
    return <Card maxW='sm' m='10'>
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
                <Button variant='solid' colorScheme='green' >
                    Play
                </Button>
                <Button leftIcon={<EditIcon />} variant='outline' colorScheme='green'>
                    <Link to={`editquiz/${id}`}>
                        Edit
                    </Link>
                </Button>
                <Button leftIcon={<DeleteIcon />} variant='solid' colorScheme='red'>
                    Delete
                </Button>
            </ButtonGroup>
        </CardFooter>
    </Card>
}
export default QuizGridElement;