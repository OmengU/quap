import { Modal, ModalOverlay, ModalContent, ModalHeader, ModalBody, FormControl, FormLabel, Input, ModalFooter, Button, useDisclosure, Text, Box, } from "@chakra-ui/react";
import { getCurrGameId } from "./endpoints";
import { SetStateAction, useEffect, useState } from "react";
import Picker from "@emoji-mart/react";
import Data from "@emoji-mart/data";
import * as signalR from "@microsoft/signalr";
import { PlayerDto, sURL } from "../global";

const JoinGame = () => {
    const { isOpen, onClose } = useDisclosure({ defaultIsOpen: true })

    const [name, setName] = useState<string>("")
    const [icon, setIcon] = useState<string>("");
    const [gameId, setGameId] = useState<string>("");
    const [isPickerVisible, setPickerVisible] = useState<boolean>(false);

    let connection = new signalR.HubConnectionBuilder()
        .withUrl(`${sURL}/Game`)
        .build();

    connection.start()
        .then(() => console.log('Connection started!'))
        .catch(e => console.log('Error while establishing connection :('));

    useEffect(() => {
        getCurrGameId().then((id) => setGameId(id))
    }, [])

    console.log(gameId);

    return <>
        <Modal isOpen={isOpen} onClose={onClose} closeOnOverlayClick={false}>
            <ModalOverlay />
            <ModalContent>
                <ModalHeader>Create a Quiz</ModalHeader>
                <ModalBody pb={6}>
                    <FormControl isRequired>
                        <FormLabel>Name</FormLabel>
                        <Input placeholder='Name' value={name} onChange={(event) => setName(event.target.value)} />
                    </FormControl>

                    <FormControl mt={4} isRequired>
                        <FormLabel>Icon</FormLabel>
                        <Button colorScheme="green" variant={"outline"} onClick={() => setPickerVisible(!isPickerVisible)}>Select Emoji as Icon</Button>
                        <Box display={!isPickerVisible ? "none" : "auto"}>
                            <Picker theme="light" data={Data} onEmojiSelect={(event: { native: SetStateAction<string>; }) => {
                                setIcon(event.native);
                                setPickerVisible(!isPickerVisible);
                            }} />
                        </Box>
                        <Text fontSize={"3xl"}>{icon}</Text>
                    </FormControl>
                </ModalBody>

                <ModalFooter>
                    <Button colorScheme='green' mr={3} isDisabled={name == "" || icon == ""} onClick={(event) => {
                        event.preventDefault();
                        const dto: PlayerDto = {
                            name: name,
                            icon: icon,
                        };
                        connection.invoke("RegisterPlayer", gameId, dto)
                            .catch(err => console.error(err));
                    }}>
                        Join Game
                    </Button>
                </ModalFooter>
            </ModalContent>
        </Modal>
    </>
}

export default JoinGame;