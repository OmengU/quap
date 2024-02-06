import { Alert, AlertDescription, AlertIcon, Box, Button, Flex } from "@chakra-ui/react";
import { Option } from "../../../global";
import OptionDisplay from "./OptionDisplay";
import { Form } from "react-router-dom";
import { useContext, useEffect, useState } from "react";
import { OptionsContext } from "../../showQuestion";
import { OptionErrorContext } from "../../createEditQuestion";

type Props = {
    options: Option[];
    isEditing: boolean;
    questionId: string;
}

const OptionsDisplay = ({ options, isEditing, questionId }: Props) => {
    const { options: contextOptions } = useContext(OptionsContext);
    const { setOptionError } = useContext(OptionErrorContext);
    const [hasSizeError, setSizeError] = useState<boolean>(false);
    const [hasEmptyError, setEmptyError] = useState<boolean>(false);

    useEffect(() => {
        setSizeError((Object.keys(contextOptions).length < 2 || Object.keys(contextOptions).length > 6) && (options.length < 2 || options.length > 6));
        setEmptyError((Object.keys(contextOptions).find(key => contextOptions[key].optionText == "") != undefined) || options.length !== Object.keys(contextOptions).length)
    }, [contextOptions, options]);

    useEffect(() => {
        setOptionError(hasEmptyError || hasSizeError);
    }, [hasEmptyError, hasSizeError])

    return <Flex direction={"row"} justifyContent={"center"} gap={"1.5rem"} pr={"1.5rem"}>
        <Box>
            {options.map((o) =>
                <OptionDisplay key={o.oId} option={o} isEditing={isEditing} />
            )}
        </Box>
        <Flex direction={"column"} gap={"1.5rem"}>
            <Form method="PATCH" action={`../addoption/${questionId}`}>
                <Button type="submit" colorScheme="green" display={!isEditing ? "none" : "auto"}>Add Option</Button>
            </Form>
            {/*check if isEditing to avoid the error briefly appearing when saving*/}
            <Alert status='error' display={isEditing && hasSizeError ? "flex" : "none"} h={"4rem"} w={"auto"} borderRadius={"15px"}>
                <AlertIcon />
                <AlertDescription>Only 2-6 options allowed!</AlertDescription>
            </Alert>
            <Alert status='error' display={isEditing && hasEmptyError ? "flex" : "none"} h={"4rem"} w={"auto"} borderRadius={"15px"}>
                <AlertIcon />
                <AlertDescription>Not all options have a valid title!</AlertDescription>
            </Alert>
        </Flex>
    </Flex>
}

export default OptionsDisplay;