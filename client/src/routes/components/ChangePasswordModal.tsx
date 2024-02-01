import { Modal, ModalOverlay, ModalContent, ModalHeader, ModalBody, FormControl, FormLabel, Input, Button, ModalFooter, Alert, AlertDescription, AlertIcon, AlertTitle, ModalCloseButton } from "@chakra-ui/react";
import { useState } from "react";
import { ChangePasswordDto } from "../../global";
import { changePassword } from "../endpoints";

type Props = {
    isOpen: boolean,
    onClose: () => void
}

const ChangePasswordModal = ({ isOpen, onClose }: Props) => {
    const [newPassword, setNewPassword] = useState<string>("");
    const [oldPassword, setOldPassword] = useState<string>("");
    const [hasError, setError] = useState<boolean>(false);

    return <Modal isOpen={isOpen} onClose={onClose} closeOnOverlayClick={false}>
        <ModalOverlay />
        <ModalContent>
            <ModalCloseButton />
            <ModalHeader>Change Password</ModalHeader>
            <Alert status='error' display={hasError ? "flex" : "none"}>
                <AlertIcon />
                <AlertTitle>Error!</AlertTitle>
                <AlertDescription>The old password is not correct.</AlertDescription>
            </Alert>
            <ModalBody pb={6}>
                <FormControl isRequired>
                    <FormLabel>Old Password</FormLabel>
                    <Input placeholder='Old Password' type="password" value={oldPassword} onChange={(event) => setOldPassword(event.target.value)} />
                </FormControl>

                <FormControl mt={4} isRequired>
                    <FormLabel>New Password</FormLabel>
                    <Input placeholder='New Password' type="password" value={newPassword} onChange={(event) => setNewPassword(event.target.value)} />
                </FormControl>

            </ModalBody>

            <ModalFooter>
                <Button colorScheme='green' mr={3} isDisabled={oldPassword == "" || newPassword == ""} onClick={async (event) => {
                    event.preventDefault();
                    const dto: ChangePasswordDto = {
                        oldPassword: oldPassword,
                        newPassword: newPassword,
                    };
                    const response = changePassword(dto);

                    if ((await response).ok) {
                        onClose();
                    } else {
                        setError(true);
                    }
                }}>
                    Change Password
                </Button>
            </ModalFooter>
        </ModalContent>
    </Modal>
}
export default ChangePasswordModal;