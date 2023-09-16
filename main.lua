package.path = package.path .. ";packages/?.lua"

local json = require("json")

function interpret(node)
    local file = io.open("files/print.json", "r")
    if file then
        local ast = file:read("*a")
        file:close()

        --saving it as a lua table so we can retrieve its values
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

end

-- function dump(o)
--     if type(o) == 'table' then
--        local s = '{ '
--        for k,v in pairs(o) do
--           if type(k) ~= 'number' then k = '"'..k..'"' end
--           s = s .. '['..k..'] = ' .. dump(v) .. ','
--        end
--        return s .. '} '
--     else
--        return tostring(o)
--     end
--  end

interpret(1)
