import { useLocation } from "react-router-dom";
import { GameQuestionDto, QType, colors, sURL } from "../global";
import { Flex, Box, Text, Button, Modal, ModalBody, ModalContent, ModalOverlay, useDisclosure, Heading } from "@chakra-ui/react";
import { useState } from "react";
import * as signalR from "@microsoft/signalr";

const GamePlayer = () => {
    let connection = new signalR.HubConnectionBuilder()
        .withUrl(`${sURL}/Game`)
        .build();

    connection.start()
        .then(() => console.log('Connection started!'))
        .catch(() => console.log('Error while establishing connection :('));

    const location = useLocation();
    const data: GameQuestionDto = location.state;

    const [multiIds, setMultiIds] = useState<string[]>([]);
    const [question, setQuestion] = useState<GameQuestionDto>(data);
    const [scores, setScores] = useState<number[]>([0]);
    const [answered, setAnswered] = useState<boolean>(false);
    const { isOpen, onOpen, onClose } = useDisclosure();
    const { isOpen: isOpenTimeout, onOpen: onOpenTimeout, onClose: onCloseTimeout } = useDisclosure();

    connection.on("submitReceived", () => {
        setAnswered(true);
    })

    connection.on("resultReceived", (score: number) => {
        console.log(score);
        setScores((prevScores) => [...prevScores, score]);
        onOpen();
    });

    connection.on("timeOut", () => {
        onOpenTimeout();
    })

    connection.on("newQuestion", (newQuestion: GameQuestionDto) => {
        setMultiIds([]);
        setQuestion(newQuestion);
        onClose();
        onCloseTimeout();
        setAnswered(false);
    })

    const sendToHub = (ids: string[]) => {
        connection.invoke("UpdateScore", localStorage.getItem('playerId'), ids)
            .catch(err => console.error(err));
    }

    const selectMulti = (event: React.MouseEvent<HTMLButtonElement>, id: string) => {
        event.preventDefault();
        multiIds.includes(id) ? setMultiIds([...multiIds.filter((m) => m != id)]) : setMultiIds([...multiIds, id]);
    }

    const submitSingle = (event: React.MouseEvent<HTMLButtonElement>, id: string) => {
        event.preventDefault();
        sendToHub([id]);
    }

    const submitMulti = (event: React.MouseEvent<HTMLButtonElement>) => {
        event.preventDefault();
        sendToHub(multiIds);
    }

    return <>
        <Flex direction={{ base: "column", md: "row" }} wrap="wrap" justify={{ base: "flex-start", md: "center" }} h={question.type == QType.MultipleChoice ? "90vdh" : "100dvh"} p={"1.5rem"}>
            {question.options.map((o, i) =>
                <Box p="1rem" key={i}
                    minW={{ base: "100%", md: question.options.length <= 3 ? `${100 / question.options.length}%` : "33.33%" }}
                    h={{ base: `${100 / question.options.length}%`, md: question.options.length <= 3 ? "100%" : "50%" }}>
                    <Button p={"1.5rem"}
                        bg={(question.type == QType.MultipleChoice && !multiIds.includes(o.oId)) || answered ? "white" : colors[i]}
                        color={(question.type == QType.MultipleChoice && !multiIds.includes(o.oId)) || answered ? "black" : "white"}
                        border={(question.type == QType.MultipleChoice && !multiIds.includes(o.oId)) || answered ? `10px solid ${colors[i]}` : "none"}
                        minW={"100%"}
                        h={"100%"}
                        isDisabled={answered}
                        onClick={question.type == QType.MultipleChoice ? (event) => selectMulti(event, o.oId) : (event) => submitSingle(event, o.oId)}
                        _hover={answered ? {} : question.type == QType.MultipleChoice && !multiIds.includes(o.oId) ? { bg: colors[i], border: `none`, color: "white" } :
                            { bg: "white", border: `10px solid ${colors[i]}`, color: "black" }}>
                        <Text fontSize={"5xl"}>
                            {o.optionText}
                        </Text>
                    </Button>
                </Box>
            )}
        </Flex>
        {question.type == QType.MultipleChoice ?
            <Box w={"100vw"} p={".7rem"} h={"10vh"}>
                <Button colorScheme="green" w={"100%"} h={"100%"} size={"lg"} fontSize={"3xl"} isDisabled={answered} onClick={(event) => submitMulti(event)}>
                    Submit
                </Button>
            </Box>
            : null}

        <Modal isOpen={isOpen} onClose={onClose} closeOnOverlayClick={false}>
            <ModalOverlay />
            <ModalContent maxW={{ base: "80%", md: "50%" }} p={"1.5rem"}>
                <ModalBody display={"flex"} flexDirection={"row"} gap={"2rem"} justifyContent={"center"}>
                    {scores[scores.length - 1] != scores[scores.length - 2] ?
                        <Flex direction={"column"} align={"center"}>
                            <Heading>Congratulations.</Heading>
                            <Text fontSize={"6xl"}>🥳</Text>
                            <Text fontSize={"xl"} textAlign={"center"}>
                                You have answered the Question correctly. Your score is now {scores[scores.length - 1]}.
                            </Text>
                        </Flex>
                        :
                        <Flex direction={"column"} align={"center"}>
                            <Heading>Too Bad.</Heading>
                            <Text fontSize={"6xl"}>😢</Text>
                            <Text fontSize={"xl"} textAlign={"center"}>
                                You got this question wrong {isOpenTimeout ? "or you didn't answer in time" : ""}. Your score is remains at {scores[scores.length - 1]}.
                            </Text>
                        </Flex>
                    }
                </ModalBody>
            </ModalContent>
        </Modal>
        <Modal isOpen={isOpenTimeout && !isOpen ? isOpenTimeout : false} onClose={onCloseTimeout} closeOnOverlayClick={false}>
            <ModalOverlay />
            <ModalContent maxW={{ base: "40%", md: "20%" }} p={"1.5rem"}>
                <ModalBody display={"flex"} flexDirection={"row"} gap={"2rem"} justifyContent={"center"}>
                    <Flex direction={"column"} align={"center"}>
                        <Heading>Too Bad.</Heading>
                        <Text fontSize={"6xl"}>😢</Text>
                        <Text fontSize={"xl"} textAlign={"center"}>
                            Time ran out.
                        </Text>
                    </Flex>
                </ModalBody>
            </ModalContent>
        </Modal>
    </>
}

export default GamePlayer;