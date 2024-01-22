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

    connection.on("submitRecieved", () => {
        setAnswered(true);
    })

    connection.on("resultRecieved", (score: number) => {
        setScores([...scores, score]);
        onOpen();
    });

    connection.on("newQuestion", (newQuestion: GameQuestionDto) => {
        setMultiIds([]);
        setQuestion(newQuestion);
        onClose();
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
        <Flex direction={{ base: "column", md: "row" }} wrap="wrap" justify={{ base: "flex-start", md: "center" }} h={question.type == QType.MultipleChoice ? "90vh" : "100vh"} p={"1.5rem"}>
            {question.options.map((o, i) =>
                <Box p="1rem" key={i}
                    minW={{ base: "100%", md: question.options.length <= 3 ? `${100 / question.options.length}%` : "33.33%" }}
                    h={{ base: `${100 / question.options.length}%`, md: question.options.length <= 3 ? "100%" : "50%" }}>
                    <Button p={"1.5rem"}
                        bg={question.type == QType.MultipleChoice && !multiIds.includes(o.oId) ? "white" : colors[i]}
                        color={question.type == QType.MultipleChoice && !multiIds.includes(o.oId) ? "black" : "white"}
                        border={question.type == QType.MultipleChoice && !multiIds.includes(o.oId) ? `10px solid ${colors[i]}` : "none"}
                        minW={"100%"}
                        h={"100%"}
                        isDisabled={answered}
                        onClick={question.type == QType.MultipleChoice ? (event) => selectMulti(event, o.oId) : (event) => submitSingle(event, o.oId)}
                        _hover={question.type == QType.MultipleChoice && !multiIds.includes(o.oId) ? { bg: colors[i], border: `none`, color: "white" } :
                            { bg: "white", border: `4px solid ${colors[i]}`, color: "black" }}>
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

        <Modal isOpen={isOpen} onClose={onClose}>
            <ModalOverlay />
            <ModalContent maxW={"50%"} p={"1.5rem"}>
                <ModalBody display={"flex"} flexDirection={"row"} gap={"2rem"} justifyContent={"center"}>
                    {scores[scores.length - 1] > scores[scores.length - 2] ?
                        <Flex direction={"column"} align={"center"}>
                            <Heading>Congratulations.</Heading>
                            <Text fontSize={"6xl"}>🥳</Text>
                            <Text fontSize={"xl"}>
                                You have answered the Question correctly. Your score is now {scores[scores.length - 1]}
                            </Text>
                        </Flex>
                        :
                        <Flex>
                            <Heading>Too Bad.</Heading>
                            <Text fontSize={"6xl"}>😢</Text>
                            <Text fontSize={"xl"}>
                                You got this question wrong. Your score is remains at {scores[scores.length - 1]}
                            </Text>
                        </Flex>
                    }
                </ModalBody>
            </ModalContent>
        </Modal>
    </>
}

export default GamePlayer;