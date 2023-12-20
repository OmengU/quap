import { Box, Button } from "@chakra-ui/react";
import { QType, Option } from "../../../global";
import OptionDisplay from "./OptionDisplay";
import { useState, useContext } from "react";
import { Form } from "react-router-dom";
import { TypeContext } from "../../createEditQuestion";

type Props = {
    options: Option[];
    isEditing: boolean;
    questionId: string;
}

const OptionsDisplay = ({ options, isEditing, questionId }: Props) => {
    let boo: boolean = false;

    options.forEach(o => {
        o.isCorrect ? boo = true : boo = false;
    });

    const [hasCorrect, setHasCorrect] = useState<boolean>(boo)

    const { type } = useContext(TypeContext)


    return <>
        <Box>
            {options.map((o) =>
                <OptionDisplay key={o.oId} option={o} isEditing={isEditing} isSingle={type == QType.SingleChoice ? true : false} isAnswered={hasCorrect} setAnswered={setHasCorrect} />
            )}
        </Box>
        <Form method="PATCH" action={`../addoption/${questionId}`}>
            <Button type="submit" colorScheme="green" display={!isEditing ? "none" : "auto"}>Add Option</Button>
        </Form>
    </>
}

export default OptionsDisplay;