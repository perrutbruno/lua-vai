package.path = package.path .. ";packages/?.lua"

local json = require("json")

function interpret(node)
    local file = io.open("files/fib.json", "r")
    if file then
        local ast = file:read("*a") --read the whole file
        -- close file after reading it and keeping its value in memory
        file:close()

        --saving it as a lua table so we can retrieve its values
        local ast_data = json.decode(ast)

        print(ast_data)
    else
        error("Could not find the AST file")
    end
end

interpret(1)
