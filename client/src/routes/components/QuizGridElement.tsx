import { DeleteIcon, EditIcon } from "@chakra-ui/icons";
import { Badge, Button, ButtonGroup, Card, CardBody, CardFooter, CardHeader, Divider, Flex, Heading, Spacer, Text, useDisclosure } from "@chakra-ui/react";
import { useContext, useState } from "react";
import { Form, Link } from "react-router-dom";
import { PasswordContext } from "../root";
import { useNavigate } from "react-router";
import VerifyPasswordModal from "./VerifyPasswordModal";
import RegisterPasswordModal from "./RegisterPasswordModal";

type Props = {
    quizName: string,
    description: string,
    nQuestions: number,
    id: string;
}

const QuizGridElement = ({ quizName, description, nQuestions, id }: Props) => {
    const { isOpen: isOpenEditVerify, onOpen: onOpenEditVerify, onClose: onCloseEditVerify } = useDisclosure()
    const { isOpen: isOpenDeleteVerify, onOpen: onOpenDeleteVerify, onClose: onCloseDeleteVerify } = useDisclosure()

    const navigate = useNavigate();
    const [verified, setVerfied] = useState<boolean>(false);

    const { hasPassword } = useContext(PasswordContext);

    const handleVerificationSuccess = (route: string) => {
        navigate(route);
    };

    return <>
        <Card maxW='sm'>
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
                    <Button leftIcon={<EditIcon />} variant='outline' colorScheme='green' onClick={onOpenEditVerify}>
                        Edit
                        <Link to={`editquiz/${id}`}>

                        </Link>
                    </Button>
                    <Form method="DELETE" action={`deletequiz/${id}`}>
                        <Button leftIcon={<DeleteIcon />} variant='solid' colorScheme='red' onClick={onOpenDeleteVerify}>
                            Delete
                        </Button>
                    </Form>
                </ButtonGroup>
            </CardFooter>
        </Card>
        {hasPassword ? <VerifyPasswordModal isOpen={isOpenEditVerify} onClose={onCloseEditVerify} onVerificationSuccess={() => handleVerificationSuccess(`editquiz/${id}`)}></VerifyPasswordModal> : <RegisterPasswordModal isOpen={isOpenEditVerify} onClose={onCloseEditVerify}></RegisterPasswordModal>}
        {hasPassword ? <VerifyPasswordModal isOpen={isOpenDeleteVerify} onClose={onCloseDeleteVerify} onVerificationSuccess={() => handleVerificationSuccess(`deletequiz/${id}`)}></VerifyPasswordModal> : <RegisterPasswordModal isOpen={isOpenDeleteVerify} onClose={onCloseDeleteVerify}></RegisterPasswordModal>}
    </>

}
export default QuizGridElement;