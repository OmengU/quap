import { FormControl, FormHelperText, FormLabel, Input, NumberDecrementStepper, NumberIncrementStepper, NumberInput, NumberInputField, NumberInputStepper, Select } from "@chakra-ui/react";
import { QType, Question } from "../../../global";
import { useState } from "react";
import { QuestionIcon } from "@chakra-ui/icons";

type Props = {
    isEditing: boolean;
    question: Question;
}

const QuestionDisplay = ({ isEditing, question }: Props) => {
    const [name, setName] = useState<string>(question.questionName);
    const [type, setType] = useState<QType>(question.type);
    const [timeLimit, setTimeLimit] = useState<number>(question.timeLimit)
    const [points, setPoints] = useState<number>(question.points)

    console.log(points);


    return <>
        <FormControl mb='2'>
            <FormLabel>Question</FormLabel>
            <Input disabled={!isEditing} value={name} />
            <FormHelperText>Enter your Question</FormHelperText>
        </FormControl>
        <FormControl mb='2'>
            <Select placeholder='Select type' >
                <option value={QType.SingleChoice}>singlechoice</option>
                <option value={QType.MultipleChoice}>multiplechoice</option>
            </Select>
        </FormControl>
        <FormControl mb='2'>
            <FormLabel>Time Limit</FormLabel>
            <NumberInput min={10} max={60} defaultValue={timeLimit}>
                <NumberInputField disabled={!isEditing} />
                <NumberInputStepper>
                    <NumberIncrementStepper />
                    <NumberDecrementStepper />
                </NumberInputStepper>
            </NumberInput>
        </FormControl>
        <FormControl mb='2'>
            <FormLabel>Points</FormLabel>
            <NumberInput max={1} min={100}>
                <NumberInputField disabled={!isEditing} value={points} />
                <NumberInputStepper>
                    <NumberIncrementStepper />
                    <NumberDecrementStepper />
                </NumberInputStepper>
            </NumberInput>
        </FormControl>
    </>
}
export default QuestionDisplay;