import { AddIcon } from "@chakra-ui/icons"
import { Button, Flex, Heading, Spacer } from "@chakra-ui/react"

const Header = () => {
    return <Flex direction='row' boxShadow='xl' p='4' roundedBottom='md' ml='2' mr='2'>
        <Heading size='lg'>
            Quap
        </Heading>
        <Spacer />
        <Button colorScheme="green" leftIcon={<AddIcon />}>New Quiz</Button>
    </Flex>
}
export default Header;