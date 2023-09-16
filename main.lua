package.path = package.path .. ";packages/?.lua"

local json = require("json")

function interpret(node)
    local file = io.open("files/fib.json", "r")
end
