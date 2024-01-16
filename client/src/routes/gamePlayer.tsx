import { useLocation } from "react-router-dom";
import { GameQuestionDto, QType, colors } from "../global";
import { Flex, Box, Text, Button } from "@chakra-ui/react";
import { useState } from "react";

const GamePlayer = () => {
    const location = useLocation();
    const data: GameQuestionDto = location.state;

    const [multiIds, setMultiIds] = useState<string[]>([]);

    const type: QType = QType.MultipleChoice;

    const selectMulti = (event: React.MouseEvent<HTMLButtonElement>, id: string) => {
            event.preventDefault();
            multiIds.includes(id) ? setMultiIds([...multiIds.filter((m) => m != id)]) : setMultiIds([...multiIds, id]);
    }

    const submitSelection = (event: React.MouseEvent<HTMLButtonElement>, id: string) => {
            event.preventDefault();
            //todo
    }

    return <>
        <Flex direction={{ base: "column", md: "row" }} wrap="wrap" justify={{ base: "flex-start", md: "center" }} h={type == QType.MultipleChoice ? "90vh" : "100vh"} p={"1.5rem"}>
            {data.options.map((o, i) =>
                <Box p="1rem" key={i}
                    minW={{ base: "100%", md: data.options.length <= 3 ? `${100 / data.options.length}%` : "33.33%" }}
                    h={{ base: `${100 / data.options.length}%`, md: data.options.length <= 3 ? "100%" : "50%" }}>
                    <Button p={"1.5rem"}
                        bg={type == QType.MultipleChoice && !multiIds.includes(o.oId) ? "white" : colors[i]}
                        color={type == QType.MultipleChoice && !multiIds.includes(o.oId) ? "black" : "white"}
                        border={type == QType.MultipleChoice && !multiIds.includes(o.oId) ? `10px solid ${colors[i]}` : "none"}
                        minW={"100%"}
                        h={"100%"}
                        onClick={type == QType.MultipleChoice ? (event) => selectMulti(event, o.oId) : (event) => submitSelection(event, o.oId)}
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
                <Button colorScheme="green" w={"100%"} h={"100%"} size={"lg"} fontSize={"3xl"}>
                    Submit
                </Button>
            </Box>
            : null}
    </>
}

export default GamePlayer;