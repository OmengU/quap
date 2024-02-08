import { useContext } from "react";
import { Option, OptionDto, QType } from "../../../global"
import { Flex, FormControl, IconButton, Input } from "@chakra-ui/react";
import { CheckIcon, DeleteIcon } from "@chakra-ui/icons";
import { Form } from "react-router-dom";
import { OptionsContext } from "../../showQuestion";
import { TypeContext } from "../../createEditQuestion";

type Props = {
    option: Option;
    isEditing: boolean;
}

const OptionDisplay = ({ option, isEditing }: Props) => {
    const id = option.oId;

    const { options, setOptions } = useContext(OptionsContext);
    const { type } = useContext(TypeContext);

    return <>
        <Flex direction={"row"} mb={4}>
            <FormControl>
                <Input name="questionName" disabled={!isEditing} value={options[id] == undefined ? "" : options[id].optionText} onChange={(event) => {
                    setOptions((prevOptions: { [key: string]: OptionDto }) => {
                        //update the optiontext on the option with the current id (..prev[id], o) copies all other values from option with id and changes the text
                        return { ...prevOptions, [id]: { ...prevOptions[id], optionText: event.target.value } };
                    });
                }} />
            </FormControl>
            {/*check if id is present in options and if not or if and not correct make outline */}
            <IconButton icon={<CheckIcon />} aria-label={"correct"} variant={options[id] == undefined ? "outline" : (options[id].isCorrect ? "solid" : "outline")} colorScheme="green" isDisabled={!isEditing} onClick={(event) => {
                event.preventDefault();
                setOptions((prevOptions: { [key: string]: OptionDto }) => {
                    // check if question is SC and if there is a correct option and if the current option is not correct and return error and old object if the case. otherwise return updated options
                    const correctOptionId = Object.keys(prevOptions).find(key => prevOptions[key].isCorrect);
                    if (correctOptionId && correctOptionId !== id && !prevOptions[id].isCorrect && type == QType.SingleChoice) {
                        console.error(`Option with id ${id} cannot be marked as correct because there is already a correct option.`);
                        return prevOptions;
                    }
                    return { ...prevOptions, [id]: { ...prevOptions[id], isCorrect: !prevOptions[id].isCorrect } };
                });
            }} />
            <Form method="DELETE" action={`../deleteoption/${option.questionId}/${id}`}>
                <IconButton type="submit" aria-label={"delete"} icon={<DeleteIcon />} colorScheme="red" display={!isEditing ? "none" : "auto"} onClick={() => {
                    if (options[id] != undefined) {
                        // if an option is deleted it it is removed from options context state by creating a new object with the same options, removing the option and replaceing the old options with new object
                        setOptions(prevOptions => {
                            let newOptions = { ...prevOptions };
                            delete newOptions[id];
                            return newOptions;
                        });
                    }
                }} />
            </Form>
        </Flex>
    </>
}

export default OptionDisplay;