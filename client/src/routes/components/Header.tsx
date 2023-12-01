import { AddIcon } from "@chakra-ui/icons"
import { Button, Flex, Heading, Image, Spacer } from "@chakra-ui/react"
import quapLogo from "../../assets/quap.svg"

type Props = {
    onOpen: () => void
}

const Header = ({ onOpen }: Props) => {
    return <Flex direction='row' boxShadow='xl' p='4' roundedBottom='md' ml='2' mr='2' mb={"10"} align={"center"}>
        <Image src={quapLogo} boxSize={"4rem"} />
        <Heading size='lg'>
            Quap
        </Heading>
        <Spacer />
        <Button colorScheme="green" leftIcon={<AddIcon />} onClick={onOpen}>New Quiz</Button>
    </Flex>
}
export default Header;