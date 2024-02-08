import { Alert, AlertDescription, AlertIcon, Button, ButtonGroup, FormControl, FormHelperText, FormLabel, Heading, Input, Select } from "@chakra-ui/react";
import { QType, Question } from "../../../global";
import { useContext, useEffect, useState } from "react";
import { CheckIcon, CloseIcon, EditIcon } from "@chakra-ui/icons";
import { Form, Link } from "react-router-dom";
import { OptionsContext } from "../../showQuestion";
import { updateOption } from "../../endpoints";
import { OptionErrorContext, TypeContext } from "../../createEditQuestion";

type Props = {
    isEditing: boolean;
    question: Question;
}

const QuestionDisplay = ({ isEditing, question }: Props) => {

    const [name, setName] = useState<string>(question.questionName);
    const [type, setType] = useState<QType>(question.type);
    const [timeLimit, setTimeLimit] = useState<number>(question.timeLimit);
    const [points, setPoints] = useState<number>(question.points);
    const [id, setId] = useState<string>(question.questionId);

    const [hasEmptyError, setEmptyError] = useState<boolean>(false);

    const { options, setOptions } = useContext(OptionsContext);
    const { hasOptionError } = useContext(OptionErrorContext);
    const { setType: setContextType } = useContext(TypeContext);

    useEffect(() => {
        setName(question.questionName);
        setType(question.type);
        setTimeLimit(question.timeLimit);
        setPoints(question.points);
        setId(question.questionId);
    }, [question]);

    useEffect(() => {
        setEmptyError(name == "" || points == 0 || timeLimit == 0);
    }, [name, points, timeLimit])

    return <>
        <Form method="post">
            <FormControl mb='2'>
                <FormLabel>
                    <Heading as={"h2"} size={"lg"} mb={"4"}>Question</Heading>
                </FormLabel>
                {/*check if isEditing to avoid the error briefly appearing when saving*/}
                <Alert status='error' display={hasEmptyError && isEditing ? "flex" : "none"} h={"auto"} w={"auto"} borderRadius={"15px"}>
                    <AlertIcon />
                    <AlertDescription>Fields empty or points/timelimit not numbers!</AlertDescription>
                </Alert>
                <FormLabel>Question Name</FormLabel>
                <Input name="questionName" disabled={!isEditing} value={name} onChange={(event) => setName(event.target.value)} />
                <FormHelperText mb={"2"}>Enter your Question</FormHelperText>
            </FormControl>
            <FormControl mb='2'>
                <FormLabel>Question Type</FormLabel>
                <Select name="type" mb={"2"} disabled={!isEditing} value={type.toString()} onChange={(event) => {
                    setType(Number(event.target.value));
                    setContextType(Number(event.target.value));
                    //set each option to false in order to avoid single choice quesions having multiple correct options
                    setOptions(prevOptions => {
                        let newOptions = { ...prevOptions };
                        for (let key in newOptions) {
                            newOptions[key].isCorrect = false;
                        }
                        return newOptions;
                    });
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
                <Button colorScheme="green" display={!isEditing ? "none" : "auto"} isDisabled={hasEmptyError || hasOptionError} leftIcon={<CheckIcon />} size={"lg"} type="submit" onClick={() => {
                    for (let [key, value] of Object.entries(options)) {
                        updateOption(key, value)
                            .then(data => console.log(data))
                            .catch(error => console.error(error));
                    }
                }}>Save</Button>
                <Button colorScheme="green" variant={"outline"} leftIcon={<EditIcon />} display={isEditing ? "none" : "auto"} size={"lg"}>
                    <Link to={`../editquestion/${id}`}>Edit</ Link>
                </Button>
                <Button colorScheme="red" variant={"outline"} leftIcon={<CloseIcon />} size={"md"} display={!isEditing ? "none" : "auto"} isDisabled={hasEmptyError || hasOptionError}>
                    <Link to={`../question/${id}`}>Cancel</ Link>
                </Button>
            </ButtonGroup>
        </Form>
    </>
}
export default QuestionDisplay;