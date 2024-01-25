import { Modal, ModalOverlay, ModalContent, ModalHeader, ModalBody, FormControl, FormLabel, Input, ModalFooter, Button, useDisclosure, Text, Box, Flex, } from "@chakra-ui/react";
import { SetStateAction, useEffect, useRef, useState } from "react";
import Picker from "@emoji-mart/react";
import Data from "@emoji-mart/data";
import * as signalR from "@microsoft/signalr";
import { GameQuestionDto, Paths, PlayerDto, sURL } from "../global";
import { useNavigate } from "react-router";

const JoinGame = () => {
    const { isOpen, onClose } = useDisclosure({ defaultIsOpen: true })

    const [name, setName] = useState<string>("")
    const [icon, setIcon] = useState<string>("");
    const [isPickerVisible, setPickerVisible] = useState<boolean>(false);
    const [isWaitingTextVisible, setWaitingTextVisible] = useState<boolean>(false);
    const navigate = useNavigate();

    const connection = useRef<signalR.HubConnection | null>(null);

    useEffect(() => {
        connection.current = new signalR.HubConnectionBuilder()
            .withUrl(`${sURL}/Game`)
            .build();

        connection.current.start()
            .then(() => console.log('Connection started!'))
            .catch(() => console.log('Error while establishing connection :('));


        if (connection.current) {
            connection.current.on("addedYou", (id: string) => {
                localStorage.setItem('playerId', id);
            })

            connection.current.on("newQuestion", (question: GameQuestionDto) => {
                navigate(`../${Paths.gameStudent}`, { state: question });
            })
        }

        return () => {
            if (connection.current) {
                connection.current.off("addedYou");
                connection.current.off("newQuestion");
                connection.current.stop()
                    .then(() => console.log('Connection stopped!'))
                    .catch(() => console.log('Error while stopping connection :('));
            }
        };
    }, []);

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
                        if (connection.current)
                            connection.current.invoke("RegisterPlayer", dto)
                                .then(() => {
                                    onClose();
                                    setWaitingTextVisible(true);
                                })
                                .catch(err => console.error(err));
                    }}>
                        Join Game
                    </Button>
                </ModalFooter>
            </ModalContent>
        </Modal>
        <Flex justifyContent={"center"} alignItems={"center"} h={"100vh"} display={isWaitingTextVisible ? "flex" : "none"}>
            <Text fontSize={"8xl"}>
                Game starting soon!!!
            </Text>
        </Flex>

    </>
}

export default JoinGame;