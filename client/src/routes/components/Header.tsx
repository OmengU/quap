import { AddIcon, WarningTwoIcon } from "@chakra-ui/icons"
import { Button, ButtonGroup, Flex, Heading, Image, Spacer, useDisclosure } from "@chakra-ui/react"
import quapLogo from "../../assets/quap.svg"
import { PasswordContext } from "../root"
import { useContext } from "react"
import ChangePasswordModal from "./ChangePasswordModal"
import RegisterPasswordModal from "./RegisterPasswordModal"

type Props = {
    onOpen: () => void
}

const Header = ({ onOpen }: Props) => {
    const { hasPassword } = useContext(PasswordContext);

    const { isOpen: isOpenPassword, onOpen: onOpenPassword, onClose: onClosePassword } = useDisclosure()

    return <>
        <Flex direction='row' boxShadow='xl' p='3' pt={1} pb={1} roundedBottom='md' ml='2' mr='2' mb={"10"} align={"center"}>
            <Image src={quapLogo} boxSize={"4.5rem"} />
            <Heading size='lg'>
                Quap
            </Heading>
            <Spacer />
            <ButtonGroup gap={"1.5rem"}>
                {!hasPassword ? <Button colorScheme="red" leftIcon={<WarningTwoIcon />} onClick={onOpenPassword}>Set Password</Button> : <Button colorScheme="green" onClick={onOpenPassword}>Change Password</Button>}
                <Button colorScheme="green" leftIcon={<AddIcon />} onClick={onOpen}>New Quiz</Button>
            </ButtonGroup>
        </Flex>
        {hasPassword ? <ChangePasswordModal isOpen={isOpenPassword} onClose={onClosePassword}></ChangePasswordModal> : <RegisterPasswordModal isOpen={isOpenPassword} onClose={onClosePassword}></RegisterPasswordModal>}
    </>

}
export default Header;