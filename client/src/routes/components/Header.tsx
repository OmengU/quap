import { AddIcon } from "@chakra-ui/icons"
import { Button, Flex, Heading, Spacer } from "@chakra-ui/react"

type Props = {
    onOpen: () => void
}

const Header = ({ onOpen }: Props) => {
    return <Flex direction='row' boxShadow='xl' p='4' roundedBottom='md' ml='2' mr='2'>
        <Heading size='lg'>
            Quap
        </Heading>
        <Spacer />
        <Button colorScheme="green" leftIcon={<AddIcon />} onClick={onOpen}>New Quiz</Button>
    </Flex>
}
export default Header;