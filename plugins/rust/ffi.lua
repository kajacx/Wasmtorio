local MEMORY = {}

local function identity(x)
    return x
end

local function memory_accessor_constructor(address)
    return
end

local function typeof(val)
    if val == "int32_t" then
        return identity
    end
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
        return memory_accessor_constructor
    end
    error("unknown typeof value: " .. val)
end

local function new(arg)
    return {
        data = 0,
    }
end

local function nop() end

local function cast(caster, value)
    return value
end

local function copy(start, data, len)

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
