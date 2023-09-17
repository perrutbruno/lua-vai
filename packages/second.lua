function second(args)
    -- returns the 2st element of a tuple (only if its a tuple)
    if args.kind == "Second" and args.value.kind == "Tuple" then
        local second_value = args.value.second.value
        return second_value
    else
        error("First method can only be called on a tuple!")
    end
end
