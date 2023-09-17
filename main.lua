package.path = package.path .. ";packages/?.lua"

local json = require("json")
local operations = require("packages.operations")
local table_utils = require("packages.table_utils")

function main()
    local file = io.open("files/" .. arg[1] .. ".json", "r")
    if file then
        local ast = file:read("*a")
        file:close()
        local ast_data = json.decode(ast)
        parse(ast_data.expression, {})
    else
        error("Could not find the AST file")
    end
end

function parse(ast, env)
    if ast.kind == "Str" then
        return ast.value
    end

    if ast.kind == "Bool" then
        return ast.value
    end

    if ast.kind == "Int" then
        return ast.value
    end

    if ast.kind == "Var" then
        return env[ast.text]
    end

    if ast.kind == "Binary" then
        return perform_operation(ast.op, parse(ast.lhs, env), parse(ast.rhs, env))
    end

    if ast.kind == "Let" then
        env[ast.name.text] = parse(ast.value, env)
        return parse(ast.next, env)
    end

    if ast.kind == "Print" then
        local result = parse(ast.value, env)
        print(result)
        return result
    end

    if ast.kind == "If" then
        if parse(ast.condition, env) then
            return parse(ast["then"], env)
        else
            return parse(ast.otherwise, env)
        end
    end

    if ast.kind == "Function" then
        for k, v in ipairs(ast.parameters) do
            table.insert(env, v.text)
        end
        return function(newEnv)
            return parse(ast.value, newEnv)
        end
    end

    if ast.kind == "Call" then
        local arguments = {}
        for k, v in ipairs(ast.arguments) do
            arguments[k] = parse(v, env)
        end
        local newEnv = deepcopy(env)
        for k, v in ipairs(env) do
            newEnv[v] = arguments[k]
        end
        return parse(ast.callee, newEnv)(newEnv)
    end

    if ast.kind == "Tuple" then
        local tuple = {}
        table.insert(tuple, ast.first)
        table.insert(tuple, ast.second)
        return tuple
    end
end

main()
