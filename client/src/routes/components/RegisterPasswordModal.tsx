import { Modal, ModalOverlay, ModalContent, ModalHeader, Alert, AlertIcon, AlertTitle, AlertDescription, ModalBody, FormControl, FormLabel, Input, ModalFooter, Button, ModalCloseButton } from "@chakra-ui/react";
import { useContext, useState } from "react";
import { PasswordDto } from "../../global";
import { registerPassword } from "../endpoints";
import { PasswordContext } from "../root";

type Props = {
    isOpen: boolean,
    onClose: () => void
}

const RegisterPasswordModal = ({ isOpen, onClose }: Props) => {
    const [password, setPassword] = useState<string>("");
    const [hasError, setError] = useState<boolean>(false);

    const { setHasPassword } = useContext(PasswordContext);

    return <Modal isOpen={isOpen} onClose={onClose} closeOnOverlayClick={false}>
        <ModalOverlay />
        <ModalContent>
            <Alert status='error' display={hasError ? "flex" : "none"}>
                <AlertIcon />
                <AlertTitle>Error!</AlertTitle>
                <AlertDescription>Password already exists.</AlertDescription>
            </Alert>
            <ModalCloseButton />
            <ModalHeader>Set Password</ModalHeader>
            <ModalBody pb={6}>
                <FormControl isRequired>
                    <FormLabel>Password</FormLabel>
                    <Input placeholder='Password' value={password} onChange={(event) => setPassword(event.target.value)} />
                </FormControl>
            </ModalBody>

            <ModalFooter>
                <Button colorScheme='green' mr={3} isDisabled={password == ""} onClick={async (event) => {
                    event.preventDefault();
                    const dto: PasswordDto = {
                        password: password,
                    };
                    console.log("simon");
                    const response = await registerPassword(dto);

                    if (response.ok) {
                        setHasPassword(true);
                        onClose();
                    } else {
                        setError(true);
                    }
                }}>
                    Register
                </Button>
            </ModalFooter>
        </ModalContent>
    </Modal>
}
export default RegisterPasswordModal;