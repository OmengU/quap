import { useLocation, useNavigate } from "react-router-dom";
import { GameQuestionDto, Paths, Player, QType, colors, sURL } from "../global";
import { Badge, Box, Button, Card, CardBody, Flex, Modal, ModalBody, ModalContent, ModalHeader, ModalOverlay, Table, TableContainer, Tbody, Td, Text, Th, Thead, Tr, useDisclosure } from "@chakra-ui/react";
import * as signalR from "@microsoft/signalr";
import { useState } from "react";

const GameTutor = () => {
    let connection = new signalR.HubConnectionBuilder()
        .withUrl(`${sURL}/Game`)
        .build();

    connection.start()
        .then(() => console.log('Connection started!'))
        .catch(() => console.log('Error while establishing connection :('));

    const location = useLocation();
    const data: GameQuestionDto = location.state;
    const navigate = useNavigate();

    const [question, setQuestion] = useState<GameQuestionDto>(data);
    const [scores, setScores] = useState<Player[]>([]);
    const { isOpen, onOpen, onClose } = useDisclosure();

    connection.on("topPlayers", (scoreList: Player[]) => {
        setScores(scoreList);
        onOpen();
    });

    connection.on("newQuestion", (newQuestion: GameQuestionDto) => {
        setQuestion(newQuestion);
        onClose();
    })

    connection.on("endGame", (scoreList: Player[]) => {
        navigate(`../${Paths.scoreboard}`, { state: scoreList });
    })

    return <>
        <Box>
            <Flex h={"33vh"} bgGradient={"linear(to-l, #7928CA, #FF0080)"} direction={"row"} align={"center"} justify={"center"} p={"1rem"} gap={"2rem"}>
                <Flex align={"center"} h={"60%"} bg={"white"} borderRadius={"15px"} p={"1.5rem"}>
                    <Text fontSize={"5xl"}>
                        ⏱️{question.timeLimit}
                    </Text>
                </Flex>
                <Flex align={"center"} h={"60%"} bg={"white"} borderRadius={"15px"} p={"1.5rem"} >
                    <Text fontSize={"5xl"}>
                        {question.questionName}
                    </Text>
                </Flex>
                <Flex direction={"column"} justify={"center"} align={"center"} h={"60%"} bg={"white"} borderRadius={"15px"} p={"1.5rem"} gap={".5rem"}>
                    <Text fontSize={"4xl"}>
                        🏆{question.points}
                    </Text>
                    <Badge colorScheme={question.type == QType.MultipleChoice ? 'pink' : 'purple'} fontSize={"l"}>
                        {question.type == QType.MultipleChoice ? 'Multi Choice' : 'Single Choice'}
                    </Badge>
                </Flex>
                <Flex bg={"white"} p={"1.5rem"} borderRadius={"15px"} align={"center"} h={"60%"}>
                    <Button size={"lg"} h={"100%"} fontSize={"xl"} p={"1.25rem"}
                        bgGradient={"linear(to-l, #7928CA, #FF0080)"}
                        color={"white"}
                        _hover={{ bgGradient: "linear(to-r, #7928CA, #FF0080)" }}
                        onClick={(event) => {
                            event.preventDefault();
                            connection.invoke("RequestScores")
                                .catch(err => console.error(err));
                        }}>
                        Next Question
                    </Button>
                </Flex>
            </Flex>
        </Box>

        <Flex wrap="wrap" justifyContent="center" h={"67vh"} p={"2.5rem"} gap={"1.5rem"}>
            {question.options.map((o, i) =>
                <Box minW={question.options.length <= 3 ? `${100 / question.options.length}%` : "33.33%"} key={i}>
                    <Card bg={colors[i]} h={"100%"}>
                        <CardBody display="flex" justifyContent="center" alignItems="center">
                            <Text fontSize={"8xl"} color={"white"}>
                                {o.optionText}
                            </Text>
                        </CardBody>
                    </Card>
                </Box>
            )}
        </Flex>

        <Modal isOpen={isOpen} onClose={onClose}>
            <ModalOverlay />
            <ModalContent maxW={"50%"}>
                <ModalHeader>Current Leaderboard</ModalHeader>
                <ModalBody display={"flex"} flexDirection={"row"} gap={"2rem"} justifyContent={"center"}>
                    <TableContainer>
                        <Table variant='striped' colorScheme="green">
                            <Thead>
                                <Tr>
                                    <Th isNumeric>Placement</Th>
                                    <Th>Player</Th>
                                    <Th isNumeric>Current Score</Th>
                                </Tr>
                            </Thead>
                            <Tbody>
                                {scores.map((s, i) =>
                                    <Tr key={i}>
                                        <Td isNumeric>{i + 1}.</Td>
                                        <Td>{s.icon} {s.name}</Td>
                                        <Td isNumeric>{s.score}</Td>
                                    </Tr>
                                )}
                            </Tbody>
                        </Table>
                    </TableContainer>
                    <Button colorScheme="green" p={"1.5rem"} onClick={(event) => {
                        event.preventDefault();
                        connection.invoke("NextQuestion")
                            .catch(err => console.error(err));
                    }}>Next Question</Button>
                </ModalBody>
            </ModalContent>
        </Modal>
    </>
}

export default GameTutor;