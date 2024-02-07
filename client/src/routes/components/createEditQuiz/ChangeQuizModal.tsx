import { Alert, AlertDescription, AlertIcon, Button, FormControl, FormLabel, Input, Modal, ModalBody, ModalCloseButton, ModalContent, ModalFooter, ModalHeader, ModalOverlay } from "@chakra-ui/react"
import { useEffect, useState } from "react"
import { getQuizById, updateQuiz } from "../../endpoints"
import { useParams } from "react-router-dom"

type Props = {
    isOpen: boolean,
    onClose: () => void
}

const ChangeQuizModal = ({ isOpen, onClose }: Props) => {
    const [name, setName] = useState<string>("")
    const [description, setDescription] = useState<string>("")

    const [hasEmptyError, setEmptyError] = useState<boolean>(false);
    //get parameter from url
    const { quizId } = useParams<'quizId'>();

    useEffect(() => {
        if (quizId) {
            getQuizById(quizId)
                .catch(error => console.error(error))
                .then(data => {
                    if (data) {
                        setName(data.name);
                        setDescription(data.description);
                    }
                })
        } else {
            console.error("Could not load QuizId from parameters");
        }
    }, [])

    useEffect(() => {
        setEmptyError(name == "" || description == "")
    }, [name, description])

    return <Modal isOpen={isOpen} onClose={onClose}>
        <ModalOverlay />
        <ModalContent>
            <ModalHeader>Update Quiz</ModalHeader>
            <Alert status='error' display={hasEmptyError ? "flex" : "none"} h={"auto"} w={"auto"}>
                <AlertIcon />
                <AlertDescription>Inputs invalid!</AlertDescription>
            </Alert>
            <ModalCloseButton />
            <ModalBody pb={6}>
                <FormControl isRequired>
                    <FormLabel>Name</FormLabel>
                    <Input placeholder='Name' value={name} onChange={(event) => setName(event.target.value)} />
                </FormControl>
                <FormControl mt={4} isRequired>
                    <FormLabel>Description</FormLabel>
                    <Input type="text" placeholder='Description' value={description} onChange={(event) => setDescription(event.target.value)} />
                </FormControl>
            </ModalBody>
            <ModalFooter>
                <Button colorScheme='green' mr={3} isDisabled={hasEmptyError} onClick={(event) => {
                    event.preventDefault();
                    if (name.length > 0 && description.length > 0) {
                        updateQuiz((quizId ? quizId : ""), { name: name, description: description })
                            .catch(error => console.error(error))
                            .then(() => {
                                onClose();
                            });
                    }
                }}>
                    Update
                </Button>
                <Button onClick={onClose} colorScheme='red'>Cancel</Button>
            </ModalFooter>
        </ModalContent>
    </Modal>
}
export default ChangeQuizModal;