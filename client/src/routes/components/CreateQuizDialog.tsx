import { Button, FormControl, FormLabel, Input, Modal, ModalBody, ModalCloseButton, ModalContent, ModalFooter, ModalHeader, ModalOverlay } from "@chakra-ui/react"
import { useState } from "react"
import { createQuiz } from "../endpoints"

type Props = {
    isOpen: boolean,
    onClose: () => void
}

const CreateQuizDialog = ({ isOpen, onClose }: Props) => {
    const [name, setName] = useState<string>("")
    const [description, setDescription] = useState<string>("")

    return <Modal isOpen={isOpen} onClose={onClose}>
        <ModalOverlay />
        <ModalContent>
            <ModalHeader>Create a Quiz</ModalHeader>
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
                <Button colorScheme='green' mr={3} onClick={(event) => {
                    event.preventDefault();
                    if (name.length > 0 && description.length > 0) {
                        createQuiz({ name: name, description: description }).then((q) => {
                            alert("Quiz created");
                        });
                    } else {
                        //todo
                    }
                    setName("");
                    setDescription("");
                }}>
                    Create Quiz
                </Button>
                <Button onClick={onClose} colorScheme='red'>Cancel</Button>
            </ModalFooter>
        </ModalContent>
    </Modal>
}
export default CreateQuizDialog;