package.path = package.path .. ";packages/?.lua"

local json = require("json")
<<<<<<< HEAD
local variables = {}

function interpret(node)
    local file = io.open("files/let.json", "r")
=======
local performOperations = require("packages.operations")

function interpret(node)
    local file = io.open("files/soma.json", "r")
>>>>>>> 7de33f181ad7b2bc39b8e02f3b49264ce2f927e3
    if file then
        local ast = file:read("*a")
        file:close()
        local ast_data = json.decode(ast)
        parse(ast_data.expression)
    else
        error("Could not find the AST file")
    end
end

function parse(ast)
    if ast.kind == "Print" then
        print(parse(ast.value))
    end

    if ast.kind == "Str" then
        return ast.value
    end

    if ast.kind == "Bool" then
        return ast.value
    end

    if ast.kind == "Let" then
        variables[ast.name.text] = parse(ast.value)
        return parse(ast.next)
    end

    if ast.kind == "Call" then
        -- TODO checar se é sempre "Var"
        variables[ast.callee.text](ast.arguments[1].value)
    end

    if ast.kind == "Int" then
        return ast.value
    end

    if ast.kind == "Function" then
        for k, v in ipairs(ast.parameters) do
            table.insert(variables, v.text)
        end
        return function()
            return parse(ast.value)
        end
    end

    if ast.kind == "Var" then
        return variables[ast.text]
    end

    if ast.kind == "Binary" then
        local operators = {
            ["Add"] = "+",
            ["Sub"] = "-",
            ["Div"] = "/",
            ["Mul"] = "*"
        }

        if ast.lhs.kind == "Int" and ast.rhs.kind == "Int" then
            local operator = operators[tostring(ast.op)]
            performOperation(operator, tonumber(ast.lhs.value), tonumber(ast.rhs.value))
        end
    end
end

local variables = {}

-- function dump(o)
--     if type(o) == 'table' then
--         local s = '{ '
--         for k, v in pairs(o) do
--             if type(k) ~= 'number' then k = '"' .. k .. '"' end
--             s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
--         end
--         return s .. '} '
--     else
--         return tostring(o)
--     end
-- end
>>>>>>> 7de33f181ad7b2bc39b8e02f3b49264ce2f927e3

interpret(1)
