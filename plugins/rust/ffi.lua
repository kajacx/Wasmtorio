local function identity(x)
    return x
end

local function typeof(val)
    if val == "uint32_t" then
        return identity
    end
    if val == "uint64_t" then
        return identity
    end
    if val == "int64_t" then
        return identity
    end
    if val == "uint8_t *" then
        return identity
    end
    if val == "union Any *" then
        return identity
    end
    error("unknown typeof value: " .. val)
end

local function new(arg)
    return {}
end

local function nop() end

local function cast(caster, value)
    return value
end

local function copy()
end

return {
    typeof = typeof,
    new = new,
    cdef = nop,
    cast = cast,
    C = {
        calloc = identity,
        realloc = identity,
        free = identity,
    },
    gc = identity,
    copy = copy,
}
