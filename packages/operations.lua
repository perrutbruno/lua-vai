function performOperation(operator, operand1, operand2)
    if operator == "Add" then
        return operand1 + operand2
    elseif operator == "Sub" then
        return operand1 - operand2
    elseif operator == "Mul" then
        return operand1 * operand2
    elseif operator == "Div" then
        if operand2 ~= 0 then
            return operand1 / operand2
        else
            return "Division by zero"
        end
    elseif operator == "Rem" then
        return operand1 % operand2
    elseif operator == "Eq" then
        return operand1 == operand2
    elseif operator == "Neq" then
        return operand1 ~= operand2
    elseif operator == "Lt" then
        return operand1 < operand2
    elseif operator == "Gt" then
        return operand1 > operand2
    elseif operator == "Lte" then
        return operand1 <= operand2
    elseif operator == "Gte" then
        return operand1 >= operand2
    elseif operator == "And" then
        return operand1 and operand2
    elseif operator == "Or" then
        return operand1 or operand2
    else
        return "Invalid operator"
    end
end
