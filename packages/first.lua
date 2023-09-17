function first(args)
    -- returns the 1st element of a tuple (only if its a tuple)
    if args.kind == "First" and args.value.kind == "Tuple" then
        local first_value = args.value.first.value
        return first_value
    else
        error("First method can only be called on a tuple!")
    end
end
