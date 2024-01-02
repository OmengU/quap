import { Box, Flex, Heading, Text } from "@chakra-ui/react";
import { useEffect, useState } from "react";
import { getIP } from "./endpoints";
import * as signalR from "@microsoft/signalr";
import { Player, sURL } from "../global";


const WaitingRoom = () => {
    const [gameLink, setGameLink] = useState<string>("")
    const [players, setPlayers] = useState<Player[]>([])

    let connection = new signalR.HubConnectionBuilder()
        .withUrl(`${sURL}/Game`)
        .build();

    connection.start()
        .then(() => console.log('Connection started!'))
        .catch(e => console.log('Error while establishing connection :('));

    connection.on("playerAdded", (player) => {
        setPlayers([...players, player])
    });

    useEffect(() => { getIP().then((ip) => setGameLink(ip)) }, [])

    return <>
        <Flex direction={"column"} align={"center"}>
            <Heading mt={5}>
                Waiting room
            </Heading>
            <Text fontSize={"xl"} mt={10}>
                Connect to this game via: {gameLink}:5173/play
            </Text>
        </Flex>
        <Box>
            <ul>
                {players.map((p) =>
                    <li>{p.icon} {p.name}</li>
                )}
            </ul>

        </Box>
    </>
}

export default WaitingRoom;