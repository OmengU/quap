import { useLocation } from "react-router-dom";
import { GameQuestionDto, QType, colors, sURL } from "../global";
import { Flex, Box, Text, Button } from "@chakra-ui/react";
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
    const [score, setScore] = useState<number>(0);
    const [answered, setAnswered] = useState<boolean>(false);

    connection.on("correctResult", () => {
        console.log("question is correct");
    })

    connection.on("submitRecieved", () => {
        setAnswered(true);
    })

    const type: QType = QType.SingleChoice;

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
        <Flex direction={{ base: "column", md: "row" }} wrap="wrap" justify={{ base: "flex-start", md: "center" }} h={type == QType.MultipleChoice ? "90vh" : "100vh"} p={"1.5rem"}>
            {question.options.map((o, i) =>
                <Box p="1rem" key={i}
                    minW={{ base: "100%", md: question.options.length <= 3 ? `${100 / question.options.length}%` : "33.33%" }}
                    h={{ base: `${100 / question.options.length}%`, md: question.options.length <= 3 ? "100%" : "50%" }}>
                    <Button p={"1.5rem"}
                        bg={type == QType.MultipleChoice && !multiIds.includes(o.oId) ? "white" : colors[i]}
                        color={type == QType.MultipleChoice && !multiIds.includes(o.oId) ? "black" : "white"}
                        border={type == QType.MultipleChoice && !multiIds.includes(o.oId) ? `10px solid ${colors[i]}` : "none"}
                        minW={"100%"}
                        h={"100%"}
                        isDisabled={answered}
                        onClick={type == QType.MultipleChoice ? (event) => selectMulti(event, o.oId) : (event) => submitSingle(event, o.oId)}
                        _hover={type == QType.MultipleChoice && !multiIds.includes(o.oId) ? { bg: colors[i], border: `none`, color: "white" } :
                            { bg: "white", border: `4px solid ${colors[i]}`, color: "black" }}>
                        <Text fontSize={"5xl"}>
                            {o.optionText}
                        </Text>
                    </Button>
                </Box>
            )}
        </Flex>
        {type == QType.MultipleChoice ?
            <Box w={"100vw"} p={".7rem"} h={"10vh"}>
                <Button colorScheme="green" w={"100%"} h={"100%"} size={"lg"} fontSize={"3xl"} isDisabled={answered} onClick={(event) => submitMulti(event)}>
                    Submit
                </Button>
            </Box>
            : null}
    </>
}

export default GamePlayer;