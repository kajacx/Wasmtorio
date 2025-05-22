local function identity(x)
    return x
end

return {
    tobit = identity,
    lshift = identity,
    rshift = identity,
    bnot = identity,
}
