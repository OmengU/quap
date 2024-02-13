import { DeleteIcon, EditIcon } from "@chakra-ui/icons";
import { Badge, Button, ButtonGroup, Card, CardBody, CardFooter, CardHeader, Divider, Flex, Heading, Spacer, Text, useDisclosure } from "@chakra-ui/react";
import { useContext, useRef } from "react";
import { Form } from "react-router-dom";
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
    const deleteRef = useRef<HTMLFormElement>(null);
    const deleteBtnRef = useRef<HTMLButtonElement>(null);

    const { hasPassword } = useContext(PasswordContext);

    const onVerificationSuccessDelete = () => {
        //deleteRef.current?.submit();
        deleteBtnRef.current?.click();
    };

    const onVerificationSuccessEdit = () => {
        navigate(`editquiz/${id}`);
    }

    return <>
        <Card maxW='sm'>
            <CardHeader>
                <Flex direction={{base: "column", md: "row"}} gap={2}>
                    <Heading size='lg'>{quizName}</Heading>
                    <Spacer />
                    <Badge fontSize='.9rem' colorScheme="green" h={"fit-content"} p={".5rem"}>{nQuestions} {nQuestions == 1 ? "Question" : "Questions"}</Badge>
                </Flex>
            </CardHeader>
            <Divider color='grey' />
            <CardBody>
                <Text size='md'>
                    {description}
                </Text>
            </CardBody>
            <CardFooter>
                <ButtonGroup display={"flex"} flexWrap={"wrap"} gap={2} spacing={0}>
                    <Form method="post" action={`startgame/${id}`}>
                        <Button variant='solid' colorScheme='green' type="submit">
                            Play
                        </Button>
                    </Form>
                    <Button leftIcon={<EditIcon />} variant='outline' colorScheme='green' onClick={onOpenEditVerify}>
                        Edit
                    </Button>
                    <Form method="DELETE" action={`deletequiz/${id}`} ref={deleteRef}>
                        <Button type="submit" display={"none"} ref={deleteBtnRef}></Button>
                        <Button leftIcon={<DeleteIcon />} variant='solid' colorScheme='red' onClick={onOpenDeleteVerify}>
                            Delete
                        </Button>
                    </Form>
                </ButtonGroup>
            </CardFooter>
        </Card>
        {hasPassword ? <VerifyPasswordModal isOpen={isOpenEditVerify} onClose={onCloseEditVerify} onSuccess={onVerificationSuccessEdit} ></VerifyPasswordModal> : <RegisterPasswordModal isOpen={isOpenEditVerify} onClose={onCloseEditVerify}></RegisterPasswordModal>}
        {hasPassword ? <VerifyPasswordModal isOpen={isOpenDeleteVerify} onClose={onCloseDeleteVerify} onSuccess={onVerificationSuccessDelete} ></VerifyPasswordModal> : <RegisterPasswordModal isOpen={isOpenDeleteVerify} onClose={onCloseDeleteVerify}></RegisterPasswordModal>}
    </>

}
export default QuizGridElement;