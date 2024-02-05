import { Box, Button } from "@chakra-ui/react";
import { Option } from "../../../global";
import OptionDisplay from "./OptionDisplay";
import { Form } from "react-router-dom";

type Props = {
    options: Option[];
    isEditing: boolean;
    questionId: string;
}

const OptionsDisplay = ({ options, isEditing, questionId }: Props) => {



    return <>
        <Box>
            {options.map((o) =>
                <OptionDisplay key={o.oId} option={o} isEditing={isEditing}/>
            )}
        </Box>
        <Form method="PATCH" action={`../addoption/${questionId}`}>
            <Button type="submit" colorScheme="green" display={!isEditing ? "none" : "auto"}>Add Option</Button>
        </Form>
    </>
}

export default OptionsDisplay;