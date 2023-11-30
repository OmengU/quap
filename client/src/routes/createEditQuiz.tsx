import { Box, Flex } from "@chakra-ui/react";
import { Question } from "../global";
import Sidebar from "./components/createEditQuiz/Sidebar";
import { Outlet, useLoaderData } from "react-router";

const CreateEditQuiz = () => {
    const questions = useLoaderData() as Array<Question>;


    return <>
    <Flex direction={"row"}>
        <Sidebar questions={questions} />
        <Box mt={5} ml={'4rem'}>
            <Outlet/>
        </Box>
    </Flex>   
    </>
}

export default CreateEditQuiz