import { Modal, ModalOverlay, ModalContent, ModalHeader, Alert, AlertIcon, AlertTitle, AlertDescription, ModalBody, FormControl, FormLabel, Input, ModalFooter, Button, ModalCloseButton } from "@chakra-ui/react";
import { useState } from "react";
import { PasswordDto } from "../../global";
import { verifyPassword } from "../endpoints";

type Props = {
    isOpen: boolean,
    onClose: () => void,
    onSuccess: () => void,
}

const VerifyPasswordModal = ({ isOpen, onClose, onSuccess }: Props) => {
    const [password, setPassword] = useState<string>("");
    const [hasError, setError] = useState<boolean>(false);

    return <Modal isOpen={isOpen} onClose={onClose} closeOnOverlayClick={false}>
        <ModalOverlay />
        <ModalContent>
            <Alert status='error' display={hasError ? "flex" : "none"}>
                <AlertIcon />
                <AlertTitle>Error!</AlertTitle>
                <AlertDescription>The password is not correct.</AlertDescription>
            </Alert>
            <ModalCloseButton />
            <ModalHeader>Verify Password</ModalHeader>
            <ModalBody pb={6}>
                <FormControl isRequired>
                    <FormLabel>Password</FormLabel>
                    <Input placeholder='Password' type="password" value={password} onChange={(event) => setPassword(event.target.value)} />
                </FormControl>
            </ModalBody>

            <ModalFooter>
                <Button colorScheme='green' mr={3} isDisabled={password == ""} onClick={async (event) => {
                    event.preventDefault();
                    const dto: PasswordDto = {
                        password: password,
                    };
                    const response = verifyPassword(dto);

                    if ((await response).ok) {
                        onSuccess();
                        onClose();
                    } else {
                        setError(true);
                    }
                }}>
                    Verify
                </Button>
            </ModalFooter>
        </ModalContent>
    </Modal>
}
export default VerifyPasswordModal;