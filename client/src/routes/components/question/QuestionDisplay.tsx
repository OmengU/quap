import { Button, ButtonGroup, FormControl, FormHelperText, FormLabel, Heading, Input, Select } from "@chakra-ui/react";
import { QType, Question } from "../../../global";
import { useContext, useEffect, useState } from "react";
import { CheckIcon, CloseIcon, EditIcon } from "@chakra-ui/icons";
import { Form, Link } from "react-router-dom";
import { OptionNamesContext } from "../../showQuestion";
import { setText } from "../../endpoints";
import { TypeContext } from "../../createEditQuestion";

type Props = {
    isEditing: boolean;
    question: Question;
}

const QuestionDisplay = ({ isEditing, question }: Props) => {

    const [name, setName] = useState<string>(question.questionName);
    const { type, setType } = useContext(TypeContext);
    const [timeLimit, setTimeLimit] = useState<number>(question.timeLimit);
    const [points, setPoints] = useState<number>(question.points);
    const [id, setId] = useState<string>(question.questionId);

    const { optionNames } = useContext(OptionNamesContext);

    useEffect(() => {
        setName(question.questionName);
        setType(question.type);
        setTimeLimit(question.timeLimit);
        setPoints(question.points);
        setId(question.questionId);
    }, [question]);

    //console.log(points);

    return <>
        <Form method="post">
            <FormControl mb='2'>
                <FormLabel>
                    <Heading as={"h2"} size={"lg"} mb={"4"}>Question</Heading>
                </FormLabel>
                <FormLabel>Question Name</FormLabel>
                <Input name="questionName" disabled={!isEditing} value={name} onChange={(event) => setName(event.target.value)} />
                <FormHelperText mb={"2"}>Enter your Question</FormHelperText>
            </FormControl>
            <FormControl mb='2'>
                <FormLabel>Question Type</FormLabel>
                <Select name="type" mb={"2"} placeholder='Select type' disabled={!isEditing} value={type.toString()} onChange={(event) => {
                    //console.log(`Old type:${QType[type]}`);
                    setType(Number(event.target.value));
                    //console.log(`New type:${QType[type]}`);
                }}>
                    <option value={QType.SingleChoice}>{QType[QType.SingleChoice]}</option>
                    <option value={QType.MultipleChoice}>{QType[QType.MultipleChoice]}</option>
                </Select>
                <FormHelperText>Select the type of your question</FormHelperText>
            </FormControl>
            <FormControl mb='2'>
                <FormLabel>Time Limit</FormLabel>
                <Input type="number" name="timeLimit" value={timeLimit != 0 ? timeLimit : ""} disabled={!isEditing} onChange={(event) => setTimeLimit(+event.target.value)} />
                <FormHelperText>Enter the Time Limit for your question</FormHelperText>
            </FormControl>
            <FormControl mb='2'>
                <FormLabel>Points</FormLabel>
                <Input type="number" name="points" value={points != 0 ? points : ""} disabled={!isEditing} onChange={(event) =>
                    setPoints(+event.target.value)} />
                <FormHelperText>Enter how many points should be awarded on correct completion</FormHelperText>
            </FormControl>
            <ButtonGroup mt={"5"}>
                <Button colorScheme="green" display={!isEditing ? "none" : "auto"} leftIcon={<CheckIcon />} size={"lg"} type="submit" onClick={() => {
                    for (let [key, value] of Object.entries(optionNames)) {
                        setText(key, value)
                            .then(data => console.log(data))
                            .catch(error => console.error(error));
                    }
                }}>Save</Button>
                <Button colorScheme="green" variant={"outline"} leftIcon={<EditIcon />} display={isEditing ? "none" : "auto"} size={"lg"}>
                    <Link to={`../editquestion/${id}`}>Edit</ Link>
                </Button>
                <Button colorScheme="red" variant={"outline"} leftIcon={<CloseIcon />} size={"md"} display={!isEditing ? "none" : "auto"}>
                    <Link to={`../question/${id}`}>Cancel</ Link>
                </Button>
            </ButtonGroup>
        </Form>

    </>
}
export default QuestionDisplay;