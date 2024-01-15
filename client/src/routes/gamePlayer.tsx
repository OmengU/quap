import { useLocation } from "react-router-dom";
import { GameQuestionDto, QType, colors } from "../global";
import { Flex, Box, Text, Button } from "@chakra-ui/react";

const GamePlayer = () => {
    const location = useLocation();
    const data: GameQuestionDto = location.state;

    const type: QType = QType.MultipleChoice;

    return <>
        <Flex direction={{ base: "column", md: "row" }} wrap="wrap" justifyContent={{ base: "flex-start", md: "center" }} h={type == QType.MultipleChoice ? "90vh" : "100vh"} p={"1.5rem"}>
            {data.options.map((o, i) =>
                <Box p="1rem"
                    minW={{ base: "100%", md: data.options.length <= 3 ? `${100 / data.options.length}%` : "33.33%" }}
                    h={{ base: `${100 / data.options.length}%`, md: data.options.length <= 3 ? "100%" : "50%" }}>
                    <Button p={"1.5rem"}
                        bg={type == QType.MultipleChoice ? "white" : colors[i]}
                        color={type == QType.MultipleChoice ? "black" : "white"}
                        border={type == QType.MultipleChoice ? `4px solid ${colors[i]}` : "none"}
                        minW={{ base: "100%", md: data.options.length <= 3 ? `${100 / data.options.length * 2}%` : "33.33%" }}
                        h={{ base: `${100 / data.options.length * 2}%`, md: data.options.length <= 3 ? "100%" : "50%" }}
                        _hover={type == QType.MultipleChoice ? { bg: colors[i], border: `none`, color: "white" } :
                            { bg: "white", border: `4px solid ${colors[i]}`, color: "black" }}>
                        <Text fontSize={"5xl"}>
                            {o.optionText}
                        </Text>
                    </Button>
                </Box>
            )}
        </Flex>
        {type == QType.MultipleChoice ?
            <Box w={"100vw"} p={"1.5rem"} h={"10vh"}>
                <Button colorScheme="green" w={"100%"} h={"100%"} fontSize={"3xl"}>
                    Submit
                </Button>
            </Box>
            : null}
    </>
}

export default GamePlayer;