import { useEffect, useRef, useState } from "react";
import * as signalR from "@microsoft/signalr";
import { Player, sURL } from "../global";
import { useLocation, useNavigate } from "react-router";
import { Button, Card, CardBody, Flex, Table, TableContainer, Tbody, Td, Text, Th, Thead, Tr } from "@chakra-ui/react";

const Scoreboard = () => {

    const connection = useRef<signalR.HubConnection | null>(null);

    useEffect(() => {
        connection.current = new signalR.HubConnectionBuilder()
            .withUrl(`${sURL}/Game`)
            .build();

        connection.current.start()
            .then(() => console.log('Connection started!'))
            .catch(() => console.log('Error while establishing connection :('));
    }, [])

    const location = useLocation();
    const data: Player[] = location.state;
    const navigate = useNavigate();

    const [scores] = useState<Player[]>(data);

    console.log(scores);

    return <Flex direction={"row"} w={"100vw"} h={"100vh"}>
        <Flex direction={"column"} h={"100%"} w={"33vw"} bgGradient={"linear(to-t, #7928CA, #FF0080)"} p={"1.5rem"} justify={"center"} align={"center"} gap={"3rem"}>
            <Text fontSize={"8xl"} align={"center"} bg={"white"} borderRadius={"15px"} p={"1.5rem"}>
                Final Results
            </Text>
            <Button size={"lg"} colorScheme="red" border={"3px solid white"} onClick={(event) => {
                event.preventDefault();
                if (connection.current)
                    connection.current.invoke("EndGame")
                        .then(() => { navigate("/"); })
                        .catch(err => console.error(err));
            }}>
                Return to Menu
            </Button>
        </Flex>
        <Flex w={"67vw"} justify={"center"} p={"5rem"}>
            <Card variant={"filled"}>
                <CardBody p={"0px"}>
                    <TableContainer>
                        <Table variant='striped' colorScheme="green" size={"lg"} fontSize={"4xl"}>
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
                                        <Td isNumeric>{i + 1 == 1 ? `${i + 1}🥇` : i + 1 == 2 ? `${i + 1}🥈` : i + 1 == 3 ? `${i + 1}🥉` : i + 1}</Td>
                                        <Td >{s.icon} {s.name}</Td>
                                        <Td isNumeric>{s.score}</Td>
                                    </Tr>
                                )}
                            </Tbody>
                        </Table>
                    </TableContainer>
                </CardBody>
            </Card>
        </Flex>
    </Flex>
}

export default Scoreboard;