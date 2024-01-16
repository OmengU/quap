import { useLocation } from "react-router-dom";
import { GameQuestionDto, QType, colors } from "../global";
import { Badge, Box, Button, Card, CardBody, Flex, Text } from "@chakra-ui/react";

const GameTutor = () => {
    const location = useLocation();
    const data: GameQuestionDto = location.state;
    console.log(data);

    return <>
        <Box>
            <Flex h={"33vh"} bgGradient={"linear(to-l, #7928CA, #FF0080)"} direction={"row"} align={"center"} justify={"center"} p={"1rem"} gap={"2rem"}>
                <Flex align={"center"} h={"60%"} bg={"white"} borderRadius={"15px"} p={"1.5rem"}>
                    <Text fontSize={"5xl"}>
                        ⏱️{data.timeLimit}
                    </Text>
                </Flex>
                <Flex align={"center"} h={"60%"} bg={"white"} borderRadius={"15px"} p={"1.5rem"} >
                    <Text fontSize={"5xl"}>
                        {data.questionName}
                    </Text>
                </Flex>
                <Flex direction={"column"} justify={"center"} align={"center"} h={"60%"} bg={"white"} borderRadius={"15px"} p={"1.5rem"} gap={".5rem"}>
                    <Text fontSize={"4xl"}>
                        🏆{data.points}
                    </Text>
                    <Badge colorScheme={data.type == QType.MultipleChoice ? 'pink' : 'purple'} fontSize={"l"}>
                        {data.type == QType.MultipleChoice ? 'Multi Choice' : 'Single Choice'}
                    </Badge>
                </Flex>
                <Flex bg={"white"} p={"1.5rem"} borderRadius={"15px"} align={"center"} h={"60%"}>
                    <Button size={"lg"} h={"100%"} fontSize={"xl"} p={"1.25rem"}
                        bgGradient={"linear(to-l, #7928CA, #FF0080)"}
                        color={"white"}
                        _hover={{ bgGradient: "linear(to-r, #7928CA, #FF0080)" }}>
                        Next Question
                    </Button>
                </Flex>
            </Flex>
        </Box>

        <Flex wrap="wrap" justifyContent="center" h={"67vh"} p={"2.5rem"} gap={"1.5rem"}>
            {data.options.map((o, i) =>
                <Box minW={data.options.length <= 3 ? `${100 / data.options.length}%` : "33.33%"} key={i}>
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


    </>
}

export default GameTutor;