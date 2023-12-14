import { useState, useEffect, useContext } from "react";
import { Option } from "../../../global"
import { Flex, FormControl, IconButton, Input } from "@chakra-ui/react";
import { CheckIcon, DeleteIcon } from "@chakra-ui/icons";
import { Form } from "react-router-dom";
import { toggleOption } from "../../endpoints";
import { OptionNamesContext } from "../../showQuestion";

type Props = {
    option: Option;
    isEditing: boolean;
    isSingle: boolean;
    isAnswered: boolean;
    setAnswered: React.Dispatch<React.SetStateAction<boolean>>;
}

const OptionDisplay = ({ option, isEditing, isSingle, isAnswered, setAnswered}: Props) => {

    const [text, setText] = useState<string>(option.optionText);
    const [isCorrect, setCorrect] = useState<boolean>(option.isCorrect);
    const [id, setId] = useState<string>(option.oId);

    const {optionNames, setOptionNames} = useContext(OptionNamesContext);

    useEffect(() => {
        setText(option.optionText);
        setCorrect(option.isCorrect);
        setId(option.oId);
    }, [option]);

    return <>
        <Flex direction={"row"} mb={4}>
            <FormControl>
                <Input name="questionName" disabled={!isEditing} value={text} onChange={(event) => {
                    setText(event.target.value)
                    setOptionNames({...optionNames, [id]: event.target.value});
                    }} />
            </FormControl>
            <IconButton icon={<CheckIcon />} aria-label={"correct"} variant={isCorrect ? "solid" : "outline"} colorScheme="green" isDisabled={!isEditing} onClick={(event) => {
                event.preventDefault();
                if ((isSingle && !isAnswered && !isCorrect) || (!isSingle)) {
                    setCorrect(!isCorrect);
                    setAnswered(true);
                    toggleOption(option.oId);
                    console.log("simon");
                }else if(isSingle && isAnswered && isCorrect){
                    setCorrect(!isCorrect);
                    setAnswered(false);
                    toggleOption(option.oId);
                }else if(!isSingle){
                    setCorrect(!isCorrect);
                    setAnswered(false);
                    toggleOption(option.oId);
                }
            }} />
            <Form method="DELETE" action={`../deleteoption/${option.questionId}/${id}`}>
                <IconButton type="submit" aria-label={"delete"} icon={<DeleteIcon />} colorScheme="red" display={!isEditing ? "none" : "auto"} onClick={() => {
                    (isAnswered && isCorrect)? setAnswered(false): setAnswered(isAnswered);
                }}/>
            </Form>

        </Flex>

    </>
}

export default OptionDisplay;