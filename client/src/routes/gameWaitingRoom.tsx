import { Button, Card, CardBody, Flex, Heading, Text } from "@chakra-ui/react";
import { useEffect, useRef, useState } from "react";
import { getIP } from "./endpoints";
import * as signalR from "@microsoft/signalr";
import { GameQuestionDto, Paths, Player, sURL } from "../global";
import { useNavigate } from "react-router";


const WaitingRoom = () => {
    const [gameLink, setGameLink] = useState<string>("")
    const [players, setPlayers] = useState<Player[]>([])
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
            connection.current.on("playerAdded", (player) => {
                console.log(player);
                setPlayers((prevPlayers) => [...prevPlayers, player])
            });

            connection.current.on("newQuestion", (question: GameQuestionDto) => {
                navigate(`../${Paths.gameTutor}`, { state: question });
            })

        }

        return () => {
            if (connection.current) {
                connection.current.off("playerAdded");
                connection.current.off("newQuestion");
                connection.current.stop()
                    .then(() => console.log('Connection stopped!'))
                    .catch(() => console.log('Error while stopping connection :('));
            }
        };
    }, []);

    useEffect(() => { getIP().then((ip) => setGameLink(ip)) }, [])

    return <>
        <Flex direction={"row"} justify={"center"} align={"center"} gap={"1.5rem"} bgGradient={"linear(to-l, #7928CA, #FF0080)"} p={"1.5rem"}>
            <Flex direction={"column"}>
                <Heading mt={1} bg={"white"} fontSize={"5xl"} p={"1.5rem"} borderRadius={"15px"}>
                    Waiting room
                </Heading>
                <Text fontSize={"xl"} mt={3} bg={"white"} p={"1rem"} borderRadius={"15px"}>
                    Connect to this game via: {location.hostname}:5173/play
                </Text>
            </Flex>
            <Button colorScheme="green" mt={"3"} size={"lg"} onClick={(event) => {
                event.preventDefault();
                if (connection.current) {
                    connection.current.invoke("StartGame")
                        .catch(err => console.error(err));
                }
            }}>
                Start game
            </Button>
        </Flex>
        <Flex wrap="wrap" justifyContent="flex-start" p={"2.5rem"} gap={"1.5rem"}>
            {players.map((p, i) =>
                <Card key={i}>
                    <CardBody display="flex" flexDirection={"column"} justifyContent="center" alignItems="center">
                        <Text fontSize={"4xl"}>
                            {p.icon}
                        </Text>
                        <Text fontSize={"5xl"}>
                            {p.name}
                        </Text>
                    </CardBody>
                </Card>
            )}
        </Flex>
    </>
}

export default WaitingRoom;