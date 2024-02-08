import { Button, FormControl, FormErrorMessage, FormHelperText, FormLabel, Input, Modal, ModalBody, ModalCloseButton, ModalContent, ModalFooter, ModalHeader, ModalOverlay } from "@chakra-ui/react"
import { useState } from "react"
import { createQuiz } from "../endpoints"
import { useNavigate } from "react-router"

type Props = {
    isOpen: boolean,
    onClose: () => void
}

const CreateQuizDialog = ({ isOpen, onClose }: Props) => {
    const [name, setName] = useState<string>("")
    const [description, setDescription] = useState<string>("")

    const [isErrorName, setErrorName] = useState<boolean>(false);
    const [isErrorDescription, setErrorDescription] = useState<boolean>(false);

    const navigate = useNavigate();

    return <Modal isOpen={isOpen} onClose={onClose}>
        <ModalOverlay />
        <ModalContent>
            <ModalHeader>Create a Quiz</ModalHeader>
            <ModalCloseButton />
            <ModalBody pb={6}>
                <FormControl isRequired isInvalid={isErrorName}>
                    <FormLabel>Name</FormLabel>
                    <Input placeholder='Name' value={name} onChange={(event) => setName(event.target.value)} />
                    {!isErrorName ? (
                        <FormHelperText>
                            Enter the name of the Quiz
                        </FormHelperText>
                    ) : (
                        <FormErrorMessage>Quiz Name is required.</FormErrorMessage>
                    )}
                </FormControl>

                <FormControl mt={4} isRequired isInvalid={isErrorDescription}>
                    <FormLabel>Description</FormLabel>
                    <Input type="text" placeholder='Description' value={description} onChange={(event) => setDescription(event.target.value)} />
                    {!isErrorDescription ? (
                        <FormHelperText>
                            Enter the description of the Quiz
                        </FormHelperText>
                    ) : (
                        <FormErrorMessage>Quiz Description is required.</FormErrorMessage>
                    )}
                </FormControl>
            </ModalBody>

            <ModalFooter>
                <Button colorScheme='green' mr={3} onClick={(event) => {
                    event.preventDefault();
                    if (name.length > 0 && description.length > 0) {
                        createQuiz({ name: name, description: description })
                            .catch(error => console.error(error))
                            .then(data => {
                                if (data) navigate(`editquiz/${data.quizId}`)
                            });
                    } else {
                        name.length == 0 ? setErrorName(true) : setErrorName(false);
                        description.length == 0 ? setErrorDescription(true) : setErrorDescription(false);
                    }
                }}>
                    Create Quiz
                </Button>
                <Button onClick={onClose} colorScheme='red'>Cancel</Button>
            </ModalFooter>
        </ModalContent>
    </Modal>
}
export default CreateQuizDialog;