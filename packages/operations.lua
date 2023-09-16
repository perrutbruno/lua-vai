function performOperation(operator, operand1, operand2)
    if operator == "+" then
        return operand1 + operand2
    elseif operator == "-" then
        return operand1 - operand2
    elseif operator == "*" then
        return operand1 * operand2
    elseif operator == "/" then
        if operand2 ~= 0 then
            return operand1 / operand2
        else
            return "Division by zero"
        end
    elseif operator == "==" then
        return operand1 == operand2
    elseif operator == "<" then
        return operand1 < operand2
    else
        return "Invalid operator"
    end
end
