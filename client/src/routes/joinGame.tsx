import { Modal, ModalOverlay, ModalContent, ModalHeader, ModalBody, FormControl, FormLabel, Input, ModalFooter, Button, useDisclosure, Text, Box, Flex, Alert, AlertDescription, AlertIcon, AlertTitle, } from "@chakra-ui/react";
import { SetStateAction, useEffect, useRef, useState } from "react";
import Picker from "@emoji-mart/react";
import Data from "@emoji-mart/data";
import * as signalR from "@microsoft/signalr";
import { GameQuestionDto, Paths, PlayerDto, sURL } from "../global";
import { useNavigate } from "react-router";

const JoinGame = () => {
    const { isOpen, onClose, onOpen } = useDisclosure({ defaultIsOpen: true })
    const { isOpen: isError, onOpen: setErrorVisible } = useDisclosure()


    const [name, setName] = useState<string>("")
    const [icon, setIcon] = useState<string>("");
    const [isPickerVisible, setPickerVisible] = useState<boolean>(false);
    const [isWaitingTextVisible, setWaitingTextVisible] = useState<boolean>(false);
    const isPlayerAdded = useRef<boolean>(false);
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
                console.log("simon");
                localStorage.setItem('playerId', id);
                isPlayerAdded.current = true;
                setWaitingTextVisible(true);
            })

            connection.current.on("newQuestion", (question: GameQuestionDto) => {
                console.log(isPlayerAdded);
                if (isPlayerAdded.current) navigate(`../${Paths.gameStudent}`, { state: question });
            })

            connection.current.on("gameRunning", () => {
                onOpen();
                setErrorVisible();
            })

        }

        return () => {
            if (connection.current) {
                connection.current.off("addedYou");
                connection.current.off("newQuestion");
                connection.current.off("gameRunning");
                connection.current.stop()
                    .then(() => console.log('Connection stopped!'))
                    .catch(() => console.log('Error while stopping connection :('));
            }
        };
    }, []);

    return <>
        <Alert status='error' display={isError ? "flex" : "none"}>
            <AlertIcon />
            <AlertTitle>Error!</AlertTitle>
            <AlertDescription>No Game is available for joining (either running or none started)</AlertDescription>
        </Alert>
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
                                })
                                .catch(err => console.error(err));
                    }}>
                        Join Game
                    </Button>
                </ModalFooter>
            </ModalContent>
        </Modal>
        <Flex justifyContent={"center"} alignItems={"center"} h={"100dvh"} w={"100dvw"} display={isWaitingTextVisible ? "flex" : "none"}>
            <Text fontSize={"8xl"} textAlign={"center"}>
                Game starting soon!!!
            </Text>
        </Flex>

    </>
}

export default JoinGame;