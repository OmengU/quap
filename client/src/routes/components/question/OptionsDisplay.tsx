import { Box, Button } from "@chakra-ui/react";
import { QType, Option } from "../../../global";
import OptionDisplay from "./OptionDisplay";
import { useState } from "react";
import { Form } from "react-router-dom";

type Props = {
    options: Option[];
    type: QType;
    isEditing: boolean;
    questionId: string;
}

const OptionsDisplay = ({options, type, isEditing, questionId}: Props) => {
    let boo: boolean = false;

    options.forEach(o => {
        o.isCorrect? boo = true: boo = false;
    });
    
    const [hasCorrect, setHasCorrect] = useState<boolean>(boo)

    console.log(questionId);
    
    return <>
    <Box>
        {options.map((o) => 
            <OptionDisplay key={o.oId} option={o} isEditing={isEditing} isSingle={type == QType.SingleChoice? true: false} isAnswered={hasCorrect} setAnswered={setHasCorrect} />
        )}
    </Box>
    <Form method="PATCH" action={`../addoption/${questionId}`}>
        <Button type="submit" colorScheme="green">Add Option</Button>
    </Form>
    
    </>
}

export default OptionsDisplay;