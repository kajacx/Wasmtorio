local rt = (function()
local module = {}

local bit = require("bit")
-- local ffi = require("ffi")

local function identity(x) return x end

local u32 = identity -- ffi.typeof("uint32_t")
local u64 = identity -- ffi.typeof("uint64_t")
local i64 = identity -- ffi.typeof("int64_t")

local math_ceil = math.ceil
local math_floor = math.floor
local to_number = tonumber
-- local to_signed = bit.tobit

local i32_to_u32 = bit.i32_to_u32
local u32_to_i32 = bit.u32_to_i32
local i64_to_u64 = bit.i64_to_u64
local u64_to_i64 = bit.u64_to_i64

local extract_bytes = bit.extract_bytes
local extract_bytes_signed = bit.extract_bytes_signed
local set_bytes = bit.set_bytes
local set_bytes_signed = bit.set_bytes_signed

local f32_from_bits = bit.f32_from_bits
local f32_to_bits = bit.f32_to_bits
local f64_from_bits = bit.f64_from_bits
local f64_to_bits = bit.f64_to_bits

-- local NUM_ZERO = i64(0)
-- local NUM_ONE = i64(1)

local function truncate_f64(num)
	if num >= 0 then
		return (math_floor(num))
	else
		return (math_ceil(num))
	end
end

do
	local add = {}
	local sub = {}
	local mul = {}
	local div = {}
	local rem = {}
	local neg = {}
	local min = {}
	local max = {}
	local copysign = {}
	local nearest = {}

	local math_abs = math.abs
	local math_min = math.min
	local math_max = math.max

	-- local RE_INSTANCE = ffi.new([[union {
	-- 	double f64;
	-- 	struct { int32_t a32, b32; };
	-- }]])

	local function round(num)
		if num >= 0 then
			return (math_floor(num + 0.5))
		else
			return (math_ceil(num - 0.5))
		end
	end

	function add.i32(lhs, rhs)
		return (lhs + rhs)
	end

	function sub.i32(lhs, rhs)
		return (lhs - rhs)
	end

	function mul.i32(lhs, rhs)
		return lhs * rhs
	end

	function div.i32(lhs, rhs)
		assert(rhs ~= 0, "division by zero")

		return lhs / rhs
	end

	function div.u32(lhs, rhs)
		assert(rhs ~= 0, "division by zero")

		return math_floor(lhs / rhs)
	end

	function rem.u32(lhs, rhs)
		assert(rhs ~= 0, "division by zero")

		return (lhs % rhs)
	end

	function div.u64(lhs, rhs)
		assert(rhs ~= 0, "division by zero")

		-- return (i64(u64(lhs) / u64(rhs)))
		return lhs / rhs
	end

	function rem.u64(lhs, rhs)
		assert(rhs ~= 0, "division by zero")

		-- return (i64(u64(lhs) % u64(rhs)))
		return lhs % rhs
	end

	function neg.f32(num)
		return -num
	end

	function min.f32(lhs, rhs)
		if lhs ~= lhs then
			return lhs
		elseif rhs ~= rhs then
			return rhs
		else
			return math_min(lhs, rhs)
		end
	end

	function max.f32(lhs, rhs)
		if lhs ~= lhs then
			return lhs
		elseif rhs ~= rhs then
			return rhs
		else
			return math_max(lhs, rhs)
		end
	end

	function copysign.f32(lhs, rhs)
		if rhs >= 0 then
			return math_abs(lhs)
		else
			return -math_abs(lhs)
		end
	end

	function nearest.f32(num)
		local result = round(num)

		if (math_abs(num) + 0.5) % 2 == 1 then
			if result >= 0 then
				result = result - 1
			else
				result = result + 1
			end
		end

		return result
	end

	neg.f64 = neg.f32
	min.f64 = min.f32
	max.f64 = max.f32
	copysign.f64 = copysign.f32
	nearest.f64 = nearest.f32

	module.add = add
	module.sub = sub
	module.mul = mul
	module.div = div
	module.rem = rem
	module.min = min
	module.max = max
	module.neg = neg
	module.copysign = copysign
	module.nearest = nearest
end

do
	local clz = {}
	local ctz = {}
	local popcnt = {}

	local bit_and = bit.band
	local bit_lshift = bit.lshift
	local bit_rshift = bit.rshift

	function clz.i32(num)
		if num == 0 then
			return 32
		end

		local count = 0

		if bit_rshift(num, 16) == 0 then
			num = bit_lshift(num, 16)
			count = count + 16
		end

		if bit_rshift(num, 24) == 0 then
			num = bit_lshift(num, 8)
			count = count + 8
		end

		if bit_rshift(num, 28) == 0 then
			num = bit_lshift(num, 4)
			count = count + 4
		end

		if bit_rshift(num, 30) == 0 then
			num = bit_lshift(num, 2)
			count = count + 2
		end

		if bit_rshift(num, 31) == 0 then
			count = count + 1
		end

		return count
	end

	function ctz.i32(num)
		if num == 0 then
			return 32
		end

		local count = 0

		if bit_lshift(num, 16) == 0 then
			num = bit_rshift(num, 16)
			count = count + 16
		end

		if bit_lshift(num, 24) == 0 then
			num = bit_rshift(num, 8)
			count = count + 8
		end

		if bit_lshift(num, 28) == 0 then
			num = bit_rshift(num, 4)
			count = count + 4
		end

		if bit_lshift(num, 30) == 0 then
			num = bit_rshift(num, 2)
			count = count + 2
		end

		if bit_lshift(num, 31) == 0 then
			count = count + 1
		end

		return count
	end

	function popcnt.i32(num)
		local count = 0

		while num ~= 0 do
			num = bit_and(num, num - 1)
			count = count + 1
		end

		return count
	end

	function clz.i64(num)
		if num == 0 then
			return 64 * NUM_ONE
		end

		local count = NUM_ZERO

		if bit_rshift(num, 32) == NUM_ZERO then
			num = bit_lshift(num, 32)
			count = count + 32
		end

		if bit_rshift(num, 48) == NUM_ZERO then
			num = bit_lshift(num, 16)
			count = count + 16
		end

		if bit_rshift(num, 56) == NUM_ZERO then
			num = bit_lshift(num, 8)
			count = count + 8
		end

		if bit_rshift(num, 60) == NUM_ZERO then
			num = bit_lshift(num, 4)
			count = count + 4
		end

		if bit_rshift(num, 62) == NUM_ZERO then
			num = bit_lshift(num, 2)
			count = count + 2
		end

		if bit_rshift(num, 63) == NUM_ZERO then
			count = count + NUM_ONE
		end

		return count
	end

	function ctz.i64(num)
		if num == 0 then
			return 64 * NUM_ONE
		end

		local count = NUM_ZERO

		if bit_lshift(num, 32) == NUM_ZERO then
			num = bit_rshift(num, 32)
			count = count + 32
		end

		if bit_lshift(num, 48) == NUM_ZERO then
			num = bit_rshift(num, 16)
			count = count + 16
		end

		if bit_lshift(num, 56) == NUM_ZERO then
			num = bit_rshift(num, 8)
			count = count + 8
		end

		if bit_lshift(num, 60) == NUM_ZERO then
			num = bit_rshift(num, 4)
			count = count + 4
		end

		if bit_lshift(num, 62) == NUM_ZERO then
			num = bit_rshift(num, 2)
			count = count + 2
		end

		if bit_lshift(num, 63) == NUM_ZERO then
			count = count + NUM_ONE
		end

		return count
	end

	function popcnt.i64(num)
		local count = NUM_ZERO

		while num ~= NUM_ZERO do
			num = bit_and(num, num - NUM_ONE)
			count = count + NUM_ONE
		end

		return count
	end

	module.clz = clz
	module.ctz = ctz
	module.popcnt = popcnt
end

do
	local le = {}
	local lt = {}
	local ge = {}
	local gt = {}

	function le.u32(lhs, rhs)
		return u32(lhs) <= u32(rhs)
	end

	function lt.u32(lhs, rhs)
		return u32(lhs) < u32(rhs)
	end

	function ge.u32(lhs, rhs)
		return u32(lhs) >= u32(rhs)
	end

	function gt.u32(lhs, rhs)
		return u32(lhs) > u32(rhs)
	end

	function le.u64(lhs, rhs)
		return u64(lhs) <= u64(rhs)
	end

	function lt.u64(lhs, rhs)
		return u64(lhs) < u64(rhs)
	end

	function ge.u64(lhs, rhs)
		return u64(lhs) >= u64(rhs)
	end

	function gt.u64(lhs, rhs)
		return u64(lhs) > u64(rhs)
	end

	module.le = le
	module.lt = lt
	module.ge = ge
	module.gt = gt
end

do
	local wrap = {}
	local truncate = {}
	local saturate = {}
	local extend = {}
	local convert = {}
	local promote = {}
	local demote = {}
	local reinterpret = {}

	local bit_and = bit.band

	local NUM_MIN_I64 = -2 ^ 63
	local NUM_MAX_I64 = 2 ^ 63 - 1 -- TODO: "- 1" will be ignored because of floating point loss?
	local NUM_MAX_U64 = 2 ^ 64 - 1

	-- This would surely be an issue in a multi-thread environment...
	-- ... thankfully this isn't one.
	-- local RE_INSTANCE = ffi.new([[union {
	-- 	int32_t i32;
	-- 	int64_t i64;
	-- 	float f32;
	-- 	double f64;
	-- }]])

	-- function wrap.i32_i64(num)
	-- 	RE_INSTANCE.i64 = num

	-- 	return RE_INSTANCE.i32
	-- end

	truncate.i32_f32 = truncate_f64
	truncate.i32_f64 = truncate_f64

	function truncate.u32_f32(num)
		return (to_signed(truncate_f64(num)))
	end

	truncate.u32_f64 = truncate.u32_f32

	truncate.i64_f32 = i64
	truncate.i64_f64 = i64
	truncate.u64_f32 = i64

	function truncate.u64_f64(num)
		return (i64(u64(num)))
	end

	truncate.f32 = truncate_f64
	truncate.f64 = truncate_f64

	function saturate.i32_f32(num)
		if num <= -0x80000000 then
			return -0x80000000
		elseif num >= 0x7FFFFFFF then
			return 0x7FFFFFFF
		else
			return to_signed(truncate_f64(num))
		end
	end

	saturate.i32_f64 = saturate.i32_f32

	function saturate.u32_f32(num)
		if num <= 0 then
			return 0
		elseif num >= 0xFFFFFFFF then
			return -1
		else
			return to_signed(truncate_f64(num))
		end
	end

	saturate.u32_f64 = saturate.u32_f32

	function saturate.i64_f32(num)
		if num >= 2 ^ 63 - 1 then
			return NUM_MAX_I64
		elseif num <= -2 ^ 63 then
			return NUM_MIN_I64
		elseif num ~= num then
			return NUM_ZERO
		else
			return i64(num)
		end
	end

	saturate.i64_f64 = saturate.i64_f32

	function saturate.u64_f32(num)
		if num >= 2 ^ 64 then
			return NUM_MAX_U64
		elseif num <= 0 or num ~= num then
			return NUM_ZERO
		else
			return i64(u64(num))
		end
	end

	saturate.u64_f64 = saturate.u64_f32

	function extend.i32_n8(num)
		num = bit_and(num, 0xFF)

		if num >= 0x80 then
			return num - 0x100
		else
			return num
		end
	end

	function extend.i32_n16(num)
		num = bit_and(num, 0xFFFF)

		if num >= 0x8000 then
			return num - 0x10000
		else
			return num
		end
	end

	function extend.i64_n8(num)
		num = bit_and(num, 0xFF * NUM_ONE)

		if num >= 0x80 then
			return num - 0x100
		else
			return num
		end
	end

	function extend.i64_n16(num)
		num = bit_and(num, 0xFFFF * NUM_ONE)

		if num >= 0x8000 then
			return num - 0x10000
		else
			return num
		end
	end

	function extend.i64_n32(num)
		num = bit_and(num, 0xFFFFFFFF * NUM_ONE)

		if num >= 0x80000000 then
			return num - 0x100000000
		else
			return num
		end
	end

	extend.i64_i32 = i64

	function extend.i64_u32(num)
		-- RE_INSTANCE.i64 = NUM_ZERO
		-- RE_INSTANCE.i32 = num

		-- return RE_INSTANCE.i64
		return num
	end

	function convert.f32_i32(num)
		return num
	end

	function convert.f32_u32(num)
		return (to_number(u32(num)))
	end

	function convert.f32_u64(num)
		return (to_number(u64(num)))
	end

	convert.f64_i32 = convert.f32_i32
	convert.f64_u32 = convert.f32_u32
	convert.f64_u64 = convert.f32_u64

	function demote.f32_f64(num)
		return num
	end

	promote.f64_f32 = demote.f32_f64

	function reinterpret.i32_f32(num)
		-- RE_INSTANCE.f32 = num
		-- return RE_INSTANCE.i32

		return f32_to_bits(num)
	end

	function reinterpret.i64_f64(num)
		-- RE_INSTANCE.f64 = num
		-- return RE_INSTANCE.i64

		return f64_to_bits(num)
	end

	function reinterpret.f32_i32(num)
		-- RE_INSTANCE.i32 = num
		-- return RE_INSTANCE.f32

		return f32_from_bits(num)
	end

	function reinterpret.f64_i64(num)
		-- RE_INSTANCE.i64 = num
		-- return RE_INSTANCE.f64

		return f64_from_bits(num)
	end

	module.wrap = wrap
	module.truncate = truncate
	module.saturate = saturate
	module.extend = extend
	module.convert = convert
	module.demote = demote
	module.promote = promote
	module.reinterpret = reinterpret
end

do
	local load = {}
	local store = {}
	local allocator = {}

	-- ffi.cdef([[
	-- union Any {
	-- 	int8_t i8;
	-- 	int16_t i16;
	-- 	int32_t i32;
	-- 	int64_t i64;

	-- 	uint8_t u8;
	-- 	uint16_t u16;
	-- 	uint32_t u32;
	-- 	uint64_t u64;

	-- 	float f32;
	-- 	double f64;
	-- };

	-- struct Memory {
	-- 	uint32_t min;
	-- 	uint32_t max;
	-- 	union Any *data;
	-- };

	-- void *calloc(size_t num, size_t size);
	-- void *realloc(void *ptr, size_t size);
	-- void free(void *ptr);
	-- ]])

	-- local alias_t = ffi.typeof("uint8_t *")
	-- local any_t = ffi.typeof("union Any *")
	-- local cast = ffi.cast

	local function by_offset(pointer, offset)
		-- local aliased = cast(alias_t, pointer)

		-- return cast(any_t, aliased + offset)
	end


	-- local function load_byte(memory, addr)
	-- 	local offset = addr % 4
	-- 	return bit32.rshift(memory.data[(addr - offset) / 4] or 0, 8 * offset)
	-- end

	-- local function store_byte(memory, addr, value)
	-- 	local offset = addr % 4
	-- 	local base = (addr - offset) / 4
	-- 	local old = clear_byte(memory.data[base] or 0, offset)
	-- 	memory.data[base] = bit32.bor(old, bit32.lshift(value, 8 * offset))
	-- end

	function load.i32_i8(memory, addr)
		local offset = addr % 4
		return extract_bytes_signed(memory[(addr - offset) / 4], offset, 1)
	end

	function load.i32_u8(memory, addr)
		local offset = addr % 4
		return extract_bytes(memory[(addr - offset) / 4], offset, 1)
	end

	function load.i32_i16(memory, addr)
		if (addr % 2 ~= 0) then
			error("Unaligned read in load.i32_i16: " .. addr)
		end
		local offset = addr % 4
		return extract_bytes_signed(memory[(addr - offset) / 4], offset, 2)
	end

	function load.i32_u16(memory, addr)
		if (addr % 2 ~= 0) then
			error("Unaligned read in load.i32_u16: " .. addr)
		end
		local offset = addr % 4
		return extract_bytes(memory[(addr - offset) / 4], offset, 2)
	end

	function load.i32(memory, addr)
		if (addr % 4 ~= 0) then
			error("Unaligned read in load.i32: " .. addr)
		end
		return u32_to_i32(memory[addr / 4])
	end

	load.i64_i8 = load.i32_i8
	load.i64_u8 = load.i32_u8
	load.i64_i16 = load.i32_i16
	load.i64_u16 = load.i32_u16

	load.i64_i32 = load.i32

	function load.i64_u32(memory, addr)
		if (addr % 4 ~= 0) then
			error("Unaligned read in load.i64_u32: " .. addr)
		end
		return memory[addr / 4]
	end

	function load.i64(memory, addr)
		if (addr % 4 ~= 0) then
			error("Unaligned read in load.i64: " .. addr)
		end
		local low = memory[addr / 4]
		local high = memory[addr / 4 + 1]
		return low + high * 2 ^ 32
	end

	function load.f32(memory, addr)
		if (addr % 4 ~= 0) then
			error("Unaligned read in load.f32: " .. addr)
		end
		return f32_from_bits(memory[addr / 4])
	end

	function load.f64(memory, addr)
		if (addr % 4 ~= 0) then
			error("Unaligned read in load.f64: " .. addr)
		end
		local low = memory[addr / 4]
		local high = memory[addr / 4 + 1]
		return f64_from_bits(low + high * 2 ^ 32)
	end

	function load.string(memory, addr, len)
		-- local start = cast(alias_t, memory) + addr

		-- return ffi.string(start, len)
	end

	function store.i32_n8(memory, addr, value)
		local offset = addr % 4
		local mem_addr = (addr - offset) - 4
		memory[mem_addr] = set_bytes(memory[mem_addr], offset, 1, value)
	end

	function store.i32_n16(memory, addr, value)
		if (addr % 2 ~= 0) then
			error("Unaligned write in store.i32_n16: " .. addr)
		end

		local offset = addr % 4
		local mem_addr = (addr - offset) - 4
		memory[mem_addr] = set_bytes(memory[mem_addr], offset, 2, value)
	end

	function store.i32(memory, addr, value)
		if (addr % 4 ~= 0) then
			error("Unaligned write in store.i32: " .. addr)
		end

		memory[addr / 4] = i32_to_u32(value)
	end

	store.i64_n8 = store.i32_n8
	store.i64_n16 = store.i32_n16

	function store.i64_n32(memory, addr, value)
		if (addr % 4 ~= 0) then
			error("Unaligned write in store.i64_n32: " .. addr)
		end

		local unsigned = i64_to_u64(value)
		memory[addr / 4] = unsigned % 2 ^ 32
	end

	function store.i64(memory, addr, value)
		if (addr % 4 ~= 0) then
			error("Unaligned write in store.i64: " .. addr)
		end

		local unsigned = i64_to_u64(value)
		memory[addr / 4] = unsigned % 2 ^ 32
		memory[addr / 4 + 1] = math.floor(unsigned / 2 ^ 32)
	end

	function store.f32(memory, addr, value)
		if (addr % 4 ~= 0) then
			error("Unaligned write in store.f32: " .. addr)
		end

		memory[addr / 4] = f32_to_bits(value)
	end

	function store.f64(memory, addr, value)
		if (addr % 4 ~= 0) then
			error("Unaligned write in store.f64: " .. addr)
		end

		local raw_bits = f64_to_bits(value)
		memory[addr / 4] = raw_bits % 2 ^ 32
		memory[addr / 4 + 1] = math.floor(raw_bits / 2 ^ 32)
	end

	function store.string(memory, addr, data, len)
		-- local start = by_offset(memory, addr)

		for i = 1, #data do
			local code = string.byte(data, i)

			local byte_addr = addr + i - 1
			local offset = byte_addr % 4
			local mem_addr = (byte_addr - offset) / 4

			memory[mem_addr] = set_bytes(memory[mem_addr] or 0, offset, 1, code)
		end
		-- ffi.copy(start, data, len or #data)
	end

	function store.copy(memory_1, addr_1, memory_2, addr_2, len)
		local start_1 = by_offset(memory_1.data, addr_1)
		local start_2 = by_offset(memory_2.data, addr_2)

		-- ffi.copy(start_1, start_2, len)
	end

	function store.fill(memory, addr, len, value)
		local start = by_offset(memory, addr)

		-- ffi.fill(start, len, value)
	end

	local WASM_PAGE_SIZE = 65536

	local function finalizer(memory)
		-- ffi.C.free(memory)
	end

	local function grow_unchecked(memory, old, new)
		-- memory = ffi.C.realloc(memory, new)

		-- assert(memory ~= nil, "failed to reallocate")

		-- ffi.fill(by_offset(memory, old), new - old, 0)
	end

	function allocator.new(min, max)
		-- local data = ffi.C.calloc(min, WASM_PAGE_SIZE)

		-- assert(data ~= nil, "failed to allocate")

		-- local memory = ffi.new("struct Memory", min, max, data)

		-- return ffi.gc(memory, finalizer)

		local memory = {}
		for i = min, max do
			memory[i] = 0
		end

		return memory
	end

	function allocator.grow(memory, num)
		if num == 0 then
			return memory.min
		end

		local old = memory.min
		local new = old + num

		if new > memory.max then
			return -1
		else
			grow_unchecked(memory, old * WASM_PAGE_SIZE, new * WASM_PAGE_SIZE)
			memory.min = new

			return old
		end
	end

	module.load = load
	module.store = store
	module.allocator = allocator
end

return module

end)()
local add_i32 = rt.add.i32
local band_i32 = bit.band
local bor_i32 = bit.bor
local bxor_i32 = bit.bxor
local clz_i32 = rt.clz.i32
local ctz_i32 = rt.ctz.i32
local div_u32 = rt.div.u32
local div_u64 = rt.div.u64
local ge_u32 = rt.ge.u32
local ge_u64 = rt.ge.u64
local gt_u32 = rt.gt.u32
local gt_u64 = rt.gt.u64
local le_u32 = rt.le.u32
local load_i32 = rt.load.i32
local load_i32_i8 = rt.load.i32_i8
local load_i32_u16 = rt.load.i32_u16
local load_i32_u8 = rt.load.i32_u8
local load_i64 = rt.load.i64
local load_i64_u32 = rt.load.i64_u32
local lt_u32 = rt.lt.u32
local mul_i32 = rt.mul.i32
local rotl_i32 = bit.rol
local shl_i32 = bit.lshift
local shr_u32 = bit.rshift
local store_i32 = rt.store.i32
local store_i32_n16 = rt.store.i32_n16
local store_i32_n8 = rt.store.i32_n8
local store_i64 = rt.store.i64
local sub_i32 = rt.sub.i32
local wrap_i32_i64 = rt.wrap.i32_i64
local memory_at_0
local table_new = require("table.new")
local FUNC_LIST = table_new(57, 1)
local TABLE_LIST = table_new(0, 1)
local MEMORY_LIST = table_new(0, 1)
local GLOBAL_LIST = table_new(2, 1)
FUNC_LIST[1] = --[[ add_five_i32 ]] function(loc_0)
	local reg_0
	if gt_u32(loc_0, 5) then
		goto continue_at_1
	end
	FUNC_LIST[0](1048576, 6)
	reg_0 = add_i32(load_i32_u8(memory_at_0, add_i32(loc_0, 1048576)), loc_0)
	goto continue_at_0
	::continue_at_1::
	FUNC_LIST[46](loc_0, 6, 1048592)
	error("out of code bounds")
	::continue_at_0::
	return reg_0
end
FUNC_LIST[2] = --[[ __rust_alloc ]] function(loc_0, loc_1)
	local loc_2 = 0
	local reg_0
	reg_0 = FUNC_LIST[28](loc_0, loc_1)
	loc_2 = reg_0
	reg_0 = loc_2
	goto continue_at_0
	::continue_at_0::
	return reg_0
end
FUNC_LIST[3] = --[[ __rust_dealloc ]] function(loc_0, loc_1, loc_2)
	FUNC_LIST[29](loc_0, loc_1, loc_2)
	goto continue_at_0
	::continue_at_0::
end
FUNC_LIST[4] = --[[ __rust_realloc ]] function(loc_0, loc_1, loc_2, loc_3)
	local loc_4 = 0
	local reg_0
	reg_0 = FUNC_LIST[30](loc_0, loc_1, loc_2, loc_3)
	loc_4 = reg_0
	reg_0 = loc_4
	goto continue_at_0
	::continue_at_0::
	return reg_0
end
FUNC_LIST[5] = --[[ __rust_alloc_error_handler ]] function(loc_0, loc_1)
	FUNC_LIST[38](loc_0, loc_1)
	goto continue_at_0
	::continue_at_0::
end
FUNC_LIST[6] = --[[ _ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h011dbf83804c12bdE ]] function(loc_0, loc_1)
	store_i64(memory_at_0, loc_0 + 8, 4363014821963114893LL)
	store_i64(memory_at_0, loc_0, -354935419601612971LL)
end
FUNC_LIST[7] = --[[ _ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h072ddd58e54dc002E ]] function(loc_0, loc_1)
	store_i64(memory_at_0, loc_0 + 8, -6257463008485468702LL)
	store_i64(memory_at_0, loc_0, 7943766429527570954LL)
end
FUNC_LIST[8] = --[[ _ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hb2a10073c215d22fE ]] function(loc_0, loc_1)
	store_i64(memory_at_0, loc_0 + 8, -4493808902380553279LL)
	store_i64(memory_at_0, loc_0, -163230743173927068LL)
end
FUNC_LIST[9] = --[[ _ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17hf1f7748d32c67a9aE ]] function(loc_0, loc_1, loc_2)
	local loc_3 = 0
	local loc_4 = 0
	local loc_5 = 0
	loc_3 = sub_i32(GLOBAL_LIST[0].value, 32)
	GLOBAL_LIST[0].value = loc_3
	loc_2 = add_i32(loc_1, loc_2)
	if lt_u32(loc_2, loc_1) then
		goto continue_at_1
	end
	loc_4 = 1
	loc_5 = load_i32(memory_at_0, loc_0)
	loc_1 = shl_i32(loc_5, 1)
	loc_1 = (gt_u32(loc_1, loc_2) and loc_1 or loc_2)
	loc_1 = (gt_u32(loc_1, 8) and loc_1 or 8)
	loc_2 = shr_u32(bxor_i32(loc_1, -1), 31)
	if loc_5 ~= 0 then
		goto continue_at_3
	end
	loc_4 = 0
	goto continue_at_2
	::continue_at_3::
	store_i32(memory_at_0, loc_3 + 28, loc_5)
	store_i32(memory_at_0, loc_3 + 20, load_i32(memory_at_0, loc_0 + 4))
	::continue_at_2::
	store_i32(memory_at_0, loc_3 + 24, loc_4)
	FUNC_LIST[18](add_i32(loc_3, 8), loc_2, loc_1, add_i32(loc_3, 20))
	if load_i32(memory_at_0, loc_3 + 8) == 0 then
		goto continue_at_4
	end
	loc_0 = load_i32(memory_at_0, loc_3 + 12)
	if loc_0 == 0 then
		goto continue_at_1
	end
	FUNC_LIST[42](loc_0, load_i32(memory_at_0, loc_3 + 16))
	error("out of code bounds")
	::continue_at_4::
	loc_2 = load_i32(memory_at_0, loc_3 + 12)
	store_i32(memory_at_0, loc_0, loc_1)
	store_i32(memory_at_0, loc_0 + 4, loc_2)
	GLOBAL_LIST[0].value = add_i32(loc_3, 32)
	goto continue_at_0
	::continue_at_1::
	FUNC_LIST[41]()
	error("out of code bounds")
	::continue_at_0::
end
FUNC_LIST[10] = --[[ _ZN4core3fmt5Write9write_fmt17h42133e6d7539921cE ]] function(loc_0, loc_1)
	local reg_0
	reg_0 = FUNC_LIST[49](loc_0, 1048608, loc_1)
	return reg_0
end
FUNC_LIST[11] = --[[ _ZN4core3ptr122drop_in_place$LT$$RF$alloc..boxed..Box$LT$dyn$u20$core..error..Error$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17h0e53f70cbe448a87E ]] function(loc_0)
end
FUNC_LIST[12] = --[[ _ZN4core3ptr29drop_in_place$LT$$LP$$RP$$GT$17he30009c0bf287b8aE ]] function(loc_0)
end
FUNC_LIST[13] = --[[ _ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h6333d575df67e7b2E ]] function(loc_0)
	local loc_1 = 0
	loc_1 = load_i32(memory_at_0, loc_0)
	if loc_1 == 0 then
		goto continue_at_1
	end
	FUNC_LIST[3](load_i32(memory_at_0, loc_0 + 4), loc_1, 1)
	::continue_at_1::
end
FUNC_LIST[14] = --[[ _ZN4core3ptr77drop_in_place$LT$std..panicking..begin_panic_handler..FormatStringPayload$GT$17h5c8ad1fd83ca6772E ]] function(loc_0)
	local loc_1 = 0
	loc_1 = load_i32(memory_at_0, loc_0)
	if bor_i32(loc_1, -2147483648) == -2147483648 then
		goto continue_at_1
	end
	FUNC_LIST[3](load_i32(memory_at_0, loc_0 + 4), loc_1, 1)
	::continue_at_1::
end
FUNC_LIST[15] = --[[ _ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17h7dbb00feee8a69b4E ]] function(loc_0, loc_1)
	local loc_2 = 0
	local loc_3 = 0
	local reg_0
	loc_2 = sub_i32(GLOBAL_LIST[0].value, 16)
	GLOBAL_LIST[0].value = loc_2
	if lt_u32(loc_1, 128) then
		goto continue_at_4
	end
	store_i32(memory_at_0, loc_2 + 12, 0)
	if lt_u32(loc_1, 2048) then
		goto continue_at_3
	end
	if ge_u32(loc_1, 65536) then
		goto continue_at_5
	end
	store_i32_n8(memory_at_0, loc_2 + 14, bor_i32(band_i32(loc_1, 63), 128))
	store_i32_n8(memory_at_0, loc_2 + 12, bor_i32(shr_u32(loc_1, 12), 224))
	store_i32_n8(memory_at_0, loc_2 + 13, bor_i32(band_i32(shr_u32(loc_1, 6), 63), 128))
	loc_1 = 3
	goto continue_at_2
	::continue_at_5::
	store_i32_n8(memory_at_0, loc_2 + 15, bor_i32(band_i32(loc_1, 63), 128))
	store_i32_n8(memory_at_0, loc_2 + 14, bor_i32(band_i32(shr_u32(loc_1, 6), 63), 128))
	store_i32_n8(memory_at_0, loc_2 + 13, bor_i32(band_i32(shr_u32(loc_1, 12), 63), 128))
	store_i32_n8(memory_at_0, loc_2 + 12, bor_i32(band_i32(shr_u32(loc_1, 18), 7), 240))
	loc_1 = 4
	goto continue_at_2
	::continue_at_4::
	loc_3 = load_i32(memory_at_0, loc_0 + 8)
	if loc_3 ~= load_i32(memory_at_0, loc_0) then
		goto continue_at_6
	end
	FUNC_LIST[16](loc_0, loc_3)
	loc_3 = load_i32(memory_at_0, loc_0 + 8)
	::continue_at_6::
	store_i32(memory_at_0, loc_0 + 8, add_i32(loc_3, 1))
	store_i32_n8(memory_at_0, add_i32(load_i32(memory_at_0, loc_0 + 4), loc_3), loc_1)
	goto continue_at_1
	::continue_at_3::
	store_i32_n8(memory_at_0, loc_2 + 13, bor_i32(band_i32(loc_1, 63), 128))
	store_i32_n8(memory_at_0, loc_2 + 12, bor_i32(shr_u32(loc_1, 6), 192))
	loc_1 = 2
	::continue_at_2::
	loc_3 = load_i32(memory_at_0, loc_0 + 8)
	if ge_u32(sub_i32(load_i32(memory_at_0, loc_0), loc_3), loc_1) then
		goto continue_at_7
	end
	FUNC_LIST[9](loc_0, loc_3, loc_1)
	loc_3 = load_i32(memory_at_0, loc_0 + 8)
	::continue_at_7::
	reg_0 = FUNC_LIST[57](add_i32(load_i32(memory_at_0, loc_0 + 4), loc_3), add_i32(loc_2, 12), loc_1)
	store_i32(memory_at_0, loc_0 + 8, add_i32(loc_3, loc_1))
	::continue_at_1::
	GLOBAL_LIST[0].value = add_i32(loc_2, 16)
	reg_0 = 0
	return reg_0
end
FUNC_LIST[16] = --[[ _ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17hc7a1ee1e6ae58a27E ]] function(loc_0, loc_1)
	local loc_2 = 0
	local loc_3 = 0
	local loc_4 = 0
	loc_2 = sub_i32(GLOBAL_LIST[0].value, 32)
	GLOBAL_LIST[0].value = loc_2
	loc_1 = add_i32(loc_1, 1)
	if loc_1 == 0 then
		goto continue_at_1
	end
	loc_3 = load_i32(memory_at_0, loc_0)
	loc_4 = shl_i32(loc_3, 1)
	loc_1 = (gt_u32(loc_4, loc_1) and loc_4 or loc_1)
	loc_1 = (gt_u32(loc_1, 8) and loc_1 or 8)
	loc_4 = shr_u32(bxor_i32(loc_1, -1), 31)
	if loc_3 ~= 0 then
		goto continue_at_3
	end
	loc_3 = 0
	goto continue_at_2
	::continue_at_3::
	store_i32(memory_at_0, loc_2 + 28, loc_3)
	store_i32(memory_at_0, loc_2 + 20, load_i32(memory_at_0, loc_0 + 4))
	loc_3 = 1
	::continue_at_2::
	store_i32(memory_at_0, loc_2 + 24, loc_3)
	FUNC_LIST[18](add_i32(loc_2, 8), loc_4, loc_1, add_i32(loc_2, 20))
	if load_i32(memory_at_0, loc_2 + 8) == 0 then
		goto continue_at_4
	end
	loc_0 = load_i32(memory_at_0, loc_2 + 12)
	if loc_0 == 0 then
		goto continue_at_1
	end
	FUNC_LIST[42](loc_0, load_i32(memory_at_0, loc_2 + 16))
	error("out of code bounds")
	::continue_at_4::
	loc_3 = load_i32(memory_at_0, loc_2 + 12)
	store_i32(memory_at_0, loc_0, loc_1)
	store_i32(memory_at_0, loc_0 + 4, loc_3)
	GLOBAL_LIST[0].value = add_i32(loc_2, 32)
	goto continue_at_0
	::continue_at_1::
	FUNC_LIST[41]()
	error("out of code bounds")
	::continue_at_0::
end
FUNC_LIST[17] = --[[ _ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17ha4c1d4db74f407e6E ]] function(loc_0, loc_1, loc_2)
	local loc_3 = 0
	local reg_0
	loc_3 = load_i32(memory_at_0, loc_0 + 8)
	if ge_u32(sub_i32(load_i32(memory_at_0, loc_0), loc_3), loc_2) then
		goto continue_at_1
	end
	FUNC_LIST[9](loc_0, loc_3, loc_2)
	loc_3 = load_i32(memory_at_0, loc_0 + 8)
	::continue_at_1::
	reg_0 = FUNC_LIST[57](add_i32(load_i32(memory_at_0, loc_0 + 4), loc_3), loc_1, loc_2)
	store_i32(memory_at_0, loc_0 + 8, add_i32(loc_3, loc_2))
	reg_0 = 0
	return reg_0
end
FUNC_LIST[18] = --[[ _ZN5alloc7raw_vec11finish_grow17ha538008a94e67213E ]] function(loc_0, loc_1, loc_2, loc_3)
	local loc_4 = 0
	local reg_0
	if loc_1 == 0 then
		goto continue_at_3
	end
	if loc_2 < 0 then
		goto continue_at_2
	end
	if load_i32(memory_at_0, loc_3 + 4) == 0 then
		goto continue_at_6
	end
	loc_4 = load_i32(memory_at_0, loc_3 + 8)
	if loc_4 ~= 0 then
		goto continue_at_7
	end
	if loc_2 ~= 0 then
		goto continue_at_8
	end
	loc_3 = loc_1
	goto continue_at_4
	::continue_at_8::
	goto continue_at_5
	::continue_at_7::
	reg_0 = FUNC_LIST[4](load_i32(memory_at_0, loc_3), loc_4, loc_1, loc_2)
	loc_3 = reg_0
	goto continue_at_4
	::continue_at_6::
	if loc_2 ~= 0 then
		goto continue_at_9
	end
	loc_3 = loc_1
	goto continue_at_4
	::continue_at_9::
	::continue_at_5::
	reg_0 = FUNC_LIST[2](loc_2, loc_1)
	loc_3 = reg_0
	::continue_at_4::
	if loc_3 == 0 then
		goto continue_at_10
	end
	store_i32(memory_at_0, loc_0 + 8, loc_2)
	store_i32(memory_at_0, loc_0 + 4, loc_3)
	store_i32(memory_at_0, loc_0, 0)
	goto continue_at_0
	::continue_at_10::
	store_i32(memory_at_0, loc_0 + 8, loc_2)
	store_i32(memory_at_0, loc_0 + 4, loc_1)
	goto continue_at_1
	::continue_at_3::
	store_i32(memory_at_0, loc_0 + 4, 0)
	goto continue_at_1
	::continue_at_2::
	store_i32(memory_at_0, loc_0 + 4, 0)
	::continue_at_1::
	store_i32(memory_at_0, loc_0, 1)
	::continue_at_0::
end
FUNC_LIST[19] = --[[ _ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h809dd6ea4681f089E ]] function(loc_0, loc_1)
	local loc_2 = 0
	local loc_3 = 0
	local loc_4 = 0
	local loc_5 = 0
	loc_2 = load_i32(memory_at_0, loc_0 + 12)
	if lt_u32(loc_1, 256) then
		goto continue_at_3
	end
	loc_3 = load_i32(memory_at_0, loc_0 + 24)
	if loc_2 ~= loc_0 then
		goto continue_at_6
	end
	loc_2 = load_i32(memory_at_0, loc_0 + 20)
	loc_1 = load_i32(memory_at_0, add_i32(loc_0, (loc_2 ~= 0 and 20 or 16)))
	if loc_1 ~= 0 then
		goto continue_at_5
	end
	loc_2 = 0
	goto continue_at_4
	::continue_at_6::
	loc_1 = load_i32(memory_at_0, loc_0 + 8)
	store_i32(memory_at_0, loc_1 + 12, loc_2)
	store_i32(memory_at_0, loc_2 + 8, loc_1)
	goto continue_at_4
	::continue_at_5::
	loc_4 = (loc_2 ~= 0 and add_i32(loc_0, 20) or add_i32(loc_0, 16))
	::continue_at_7::
	while true do
		loc_5 = loc_4
		loc_2 = loc_1
		loc_1 = load_i32(memory_at_0, loc_2 + 20)
		loc_4 = (loc_1 ~= 0 and add_i32(loc_2, 20) or add_i32(loc_2, 16))
		loc_1 = load_i32(memory_at_0, add_i32(loc_2, (loc_1 ~= 0 and 20 or 16)))
		if loc_1 ~= 0 then
			goto continue_at_7
		end
		break
	end
	store_i32(memory_at_0, loc_5, 0)
	::continue_at_4::
	if loc_3 == 0 then
		goto continue_at_1
	end
	loc_1 = add_i32(shl_i32(load_i32(memory_at_0, loc_0 + 28), 2), 1049448)
	if load_i32(memory_at_0, loc_1) == loc_0 then
		goto continue_at_8
	end
	store_i32(memory_at_0, add_i32(loc_3, (load_i32(memory_at_0, loc_3 + 16) == loc_0 and 16 or 20)), loc_2)
	if loc_2 == 0 then
		goto continue_at_1
	end
	goto continue_at_2
	::continue_at_8::
	store_i32(memory_at_0, loc_1, loc_2)
	if loc_2 ~= 0 then
		goto continue_at_2
	end
	store_i32(memory_at_0, 0 + 1049860, band_i32(load_i32(memory_at_0, 0 + 1049860), rotl_i32(-2, load_i32(memory_at_0, loc_0 + 28))))
	goto continue_at_1
	::continue_at_3::
	loc_4 = load_i32(memory_at_0, loc_0 + 8)
	if loc_2 == loc_4 then
		goto continue_at_9
	end
	store_i32(memory_at_0, loc_4 + 12, loc_2)
	store_i32(memory_at_0, loc_2 + 8, loc_4)
	goto continue_at_0
	::continue_at_9::
	store_i32(memory_at_0, 0 + 1049856, band_i32(load_i32(memory_at_0, 0 + 1049856), rotl_i32(-2, shr_u32(loc_1, 3))))
	goto continue_at_0
	::continue_at_2::
	store_i32(memory_at_0, loc_2 + 24, loc_3)
	loc_1 = load_i32(memory_at_0, loc_0 + 16)
	if loc_1 == 0 then
		goto continue_at_10
	end
	store_i32(memory_at_0, loc_2 + 16, loc_1)
	store_i32(memory_at_0, loc_1 + 24, loc_2)
	::continue_at_10::
	loc_1 = load_i32(memory_at_0, loc_0 + 20)
	if loc_1 == 0 then
		goto continue_at_1
	end
	store_i32(memory_at_0, loc_2 + 20, loc_1)
	store_i32(memory_at_0, loc_1 + 24, loc_2)
	goto continue_at_0
	::continue_at_1::
	::continue_at_0::
end
FUNC_LIST[20] = --[[ _ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17h64b08e2579e7152eE ]] function(loc_0, loc_1)
	local loc_2 = 0
	local loc_3 = 0
	loc_2 = add_i32(loc_0, loc_1)
	loc_3 = load_i32(memory_at_0, loc_0 + 4)
	if band_i32(loc_3, 1) ~= 0 then
		goto continue_at_2
	end
	if band_i32(loc_3, 2) == 0 then
		goto continue_at_1
	end
	loc_3 = load_i32(memory_at_0, loc_0)
	loc_1 = add_i32(loc_3, loc_1)
	loc_0 = sub_i32(loc_0, loc_3)
	if loc_0 ~= load_i32(memory_at_0, 0 + 1049872) then
		goto continue_at_3
	end
	if band_i32(load_i32(memory_at_0, loc_2 + 4), 3) ~= 3 then
		goto continue_at_2
	end
	store_i32(memory_at_0, 0 + 1049864, loc_1)
	store_i32(memory_at_0, loc_2 + 4, band_i32(load_i32(memory_at_0, loc_2 + 4), -2))
	store_i32(memory_at_0, loc_0 + 4, bor_i32(loc_1, 1))
	store_i32(memory_at_0, loc_2, loc_1)
	goto continue_at_1
	::continue_at_3::
	FUNC_LIST[19](loc_0, loc_3)
	::continue_at_2::
	loc_3 = load_i32(memory_at_0, loc_2 + 4)
	if band_i32(loc_3, 2) ~= 0 then
		goto continue_at_7
	end
	if loc_2 == load_i32(memory_at_0, 0 + 1049876) then
		goto continue_at_5
	end
	if loc_2 == load_i32(memory_at_0, 0 + 1049872) then
		goto continue_at_4
	end
	loc_3 = band_i32(loc_3, -8)
	FUNC_LIST[19](loc_2, loc_3)
	loc_1 = add_i32(loc_3, loc_1)
	store_i32(memory_at_0, loc_0 + 4, bor_i32(loc_1, 1))
	store_i32(memory_at_0, add_i32(loc_0, loc_1), loc_1)
	if loc_0 ~= load_i32(memory_at_0, 0 + 1049872) then
		goto continue_at_6
	end
	store_i32(memory_at_0, 0 + 1049864, loc_1)
	goto continue_at_0
	::continue_at_7::
	store_i32(memory_at_0, loc_2 + 4, band_i32(loc_3, -2))
	store_i32(memory_at_0, loc_0 + 4, bor_i32(loc_1, 1))
	store_i32(memory_at_0, add_i32(loc_0, loc_1), loc_1)
	::continue_at_6::
	if lt_u32(loc_1, 256) then
		goto continue_at_8
	end
	FUNC_LIST[21](loc_0, loc_1)
	goto continue_at_0
	::continue_at_8::
	loc_2 = add_i32(band_i32(loc_1, -8), 1049592)
	loc_3 = load_i32(memory_at_0, 0 + 1049856)
	loc_1 = shl_i32(1, shr_u32(loc_1, 3))
	if band_i32(loc_3, loc_1) ~= 0 then
		goto continue_at_10
	end
	store_i32(memory_at_0, 0 + 1049856, bor_i32(loc_3, loc_1))
	loc_1 = loc_2
	goto continue_at_9
	::continue_at_10::
	loc_1 = load_i32(memory_at_0, loc_2 + 8)
	::continue_at_9::
	store_i32(memory_at_0, loc_2 + 8, loc_0)
	store_i32(memory_at_0, loc_1 + 12, loc_0)
	store_i32(memory_at_0, loc_0 + 12, loc_2)
	store_i32(memory_at_0, loc_0 + 8, loc_1)
	goto continue_at_0
	::continue_at_5::
	store_i32(memory_at_0, 0 + 1049876, loc_0)
	loc_1 = add_i32(load_i32(memory_at_0, 0 + 1049868), loc_1)
	store_i32(memory_at_0, 0 + 1049868, loc_1)
	store_i32(memory_at_0, loc_0 + 4, bor_i32(loc_1, 1))
	if loc_0 ~= load_i32(memory_at_0, 0 + 1049872) then
		goto continue_at_1
	end
	store_i32(memory_at_0, 0 + 1049864, 0)
	store_i32(memory_at_0, 0 + 1049872, 0)
	goto continue_at_0
	::continue_at_4::
	store_i32(memory_at_0, 0 + 1049872, loc_0)
	loc_1 = add_i32(load_i32(memory_at_0, 0 + 1049864), loc_1)
	store_i32(memory_at_0, 0 + 1049864, loc_1)
	store_i32(memory_at_0, loc_0 + 4, bor_i32(loc_1, 1))
	store_i32(memory_at_0, add_i32(loc_0, loc_1), loc_1)
	goto continue_at_0
	::continue_at_1::
	::continue_at_0::
end
FUNC_LIST[21] = --[[ _ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h646063e53ae23623E ]] function(loc_0, loc_1)
	local loc_2 = 0
	local loc_3 = 0
	local loc_4 = 0
	local loc_5 = 0
	loc_2 = 0
	if lt_u32(loc_1, 256) then
		goto continue_at_1
	end
	loc_2 = 31
	if gt_u32(loc_1, 16777215) then
		goto continue_at_1
	end
	loc_2 = clz_i32(shr_u32(loc_1, 8))
	loc_2 = add_i32(sub_i32(band_i32(shr_u32(loc_1, sub_i32(6, loc_2)), 1), shl_i32(loc_2, 1)), 62)
	::continue_at_1::
	store_i64(memory_at_0, loc_0 + 16, 0LL)
	store_i32(memory_at_0, loc_0 + 28, loc_2)
	loc_3 = add_i32(shl_i32(loc_2, 2), 1049448)
	loc_4 = shl_i32(1, loc_2)
	if band_i32(load_i32(memory_at_0, 0 + 1049860), loc_4) ~= 0 then
		goto continue_at_2
	end
	store_i32(memory_at_0, loc_3, loc_0)
	store_i32(memory_at_0, loc_0 + 24, loc_3)
	store_i32(memory_at_0, loc_0 + 12, loc_0)
	store_i32(memory_at_0, loc_0 + 8, loc_0)
	store_i32(memory_at_0, 0 + 1049860, bor_i32(load_i32(memory_at_0, 0 + 1049860), loc_4))
	goto continue_at_0
	::continue_at_2::
	loc_4 = load_i32(memory_at_0, loc_3)
	if band_i32(load_i32(memory_at_0, loc_4 + 4), -8) ~= loc_1 then
		goto continue_at_5
	end
	loc_2 = loc_4
	goto continue_at_4
	::continue_at_5::
	loc_3 = shl_i32(loc_1, (loc_2 == 31 and 0 or sub_i32(25, shr_u32(loc_2, 1))))
	::continue_at_6::
	while true do
		loc_5 = add_i32(add_i32(loc_4, band_i32(shr_u32(loc_3, 29), 4)), 16)
		loc_2 = load_i32(memory_at_0, loc_5)
		if loc_2 == 0 then
			goto continue_at_3
		end
		loc_3 = shl_i32(loc_3, 1)
		loc_4 = loc_2
		if band_i32(load_i32(memory_at_0, loc_2 + 4), -8) ~= loc_1 then
			goto continue_at_6
		end
		break
	end
	::continue_at_4::
	loc_3 = load_i32(memory_at_0, loc_2 + 8)
	store_i32(memory_at_0, loc_3 + 12, loc_0)
	store_i32(memory_at_0, loc_2 + 8, loc_0)
	store_i32(memory_at_0, loc_0 + 24, 0)
	store_i32(memory_at_0, loc_0 + 12, loc_2)
	store_i32(memory_at_0, loc_0 + 8, loc_3)
	goto continue_at_0
	::continue_at_3::
	store_i32(memory_at_0, loc_5, loc_0)
	store_i32(memory_at_0, loc_0 + 24, loc_4)
	store_i32(memory_at_0, loc_0 + 12, loc_0)
	store_i32(memory_at_0, loc_0 + 8, loc_0)
	::continue_at_0::
end
FUNC_LIST[22] = --[[ _ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17hf616c0cb4f892aa7E ]] function(loc_0)
	local loc_1 = 0
	local loc_2 = 0
	local loc_3 = 0
	local loc_4 = 0
	local loc_5 = 0
	loc_1 = add_i32(loc_0, -8)
	loc_2 = load_i32(memory_at_0, add_i32(loc_0, -4))
	loc_0 = band_i32(loc_2, -8)
	loc_3 = add_i32(loc_1, loc_0)
	if band_i32(loc_2, 1) ~= 0 then
		goto continue_at_4
	end
	if band_i32(loc_2, 2) == 0 then
		goto continue_at_3
	end
	loc_2 = load_i32(memory_at_0, loc_1)
	loc_0 = add_i32(loc_2, loc_0)
	loc_1 = sub_i32(loc_1, loc_2)
	if loc_1 ~= load_i32(memory_at_0, 0 + 1049872) then
		goto continue_at_5
	end
	if band_i32(load_i32(memory_at_0, loc_3 + 4), 3) ~= 3 then
		goto continue_at_4
	end
	store_i32(memory_at_0, 0 + 1049864, loc_0)
	store_i32(memory_at_0, loc_3 + 4, band_i32(load_i32(memory_at_0, loc_3 + 4), -2))
	store_i32(memory_at_0, loc_1 + 4, bor_i32(loc_0, 1))
	store_i32(memory_at_0, loc_3, loc_0)
	goto continue_at_0
	::continue_at_5::
	FUNC_LIST[19](loc_1, loc_2)
	::continue_at_4::
	loc_2 = load_i32(memory_at_0, loc_3 + 4)
	if band_i32(loc_2, 2) ~= 0 then
		goto continue_at_8
	end
	if loc_3 == load_i32(memory_at_0, 0 + 1049876) then
		goto continue_at_6
	end
	if loc_3 == load_i32(memory_at_0, 0 + 1049872) then
		goto continue_at_1
	end
	loc_2 = band_i32(loc_2, -8)
	FUNC_LIST[19](loc_3, loc_2)
	loc_0 = add_i32(loc_2, loc_0)
	store_i32(memory_at_0, loc_1 + 4, bor_i32(loc_0, 1))
	store_i32(memory_at_0, add_i32(loc_1, loc_0), loc_0)
	if loc_1 ~= load_i32(memory_at_0, 0 + 1049872) then
		goto continue_at_7
	end
	store_i32(memory_at_0, 0 + 1049864, loc_0)
	goto continue_at_0
	::continue_at_8::
	store_i32(memory_at_0, loc_3 + 4, band_i32(loc_2, -2))
	store_i32(memory_at_0, loc_1 + 4, bor_i32(loc_0, 1))
	store_i32(memory_at_0, add_i32(loc_1, loc_0), loc_0)
	::continue_at_7::
	if lt_u32(loc_0, 256) then
		goto continue_at_2
	end
	FUNC_LIST[21](loc_1, loc_0)
	loc_1 = 0
	loc_0 = add_i32(load_i32(memory_at_0, 0 + 1049896), -1)
	store_i32(memory_at_0, 0 + 1049896, loc_0)
	if loc_0 ~= 0 then
		goto continue_at_3
	end
	loc_0 = load_i32(memory_at_0, 0 + 1049584)
	if loc_0 == 0 then
		goto continue_at_9
	end
	loc_1 = 0
	::continue_at_10::
	while true do
		loc_1 = add_i32(loc_1, 1)
		loc_0 = load_i32(memory_at_0, loc_0 + 8)
		if loc_0 ~= 0 then
			goto continue_at_10
		end
		break
	end
	::continue_at_9::
	store_i32(memory_at_0, 0 + 1049896, (gt_u32(loc_1, 4095) and loc_1 or 4095))
	goto continue_at_0
	::continue_at_6::
	store_i32(memory_at_0, 0 + 1049876, loc_1)
	loc_0 = add_i32(load_i32(memory_at_0, 0 + 1049868), loc_0)
	store_i32(memory_at_0, 0 + 1049868, loc_0)
	store_i32(memory_at_0, loc_1 + 4, bor_i32(loc_0, 1))
	if loc_1 ~= load_i32(memory_at_0, 0 + 1049872) then
		goto continue_at_11
	end
	store_i32(memory_at_0, 0 + 1049864, 0)
	store_i32(memory_at_0, 0 + 1049872, 0)
	::continue_at_11::
	loc_4 = load_i32(memory_at_0, 0 + 1049888)
	if le_u32(loc_0, loc_4) then
		goto continue_at_3
	end
	loc_3 = load_i32(memory_at_0, 0 + 1049876)
	if loc_3 == 0 then
		goto continue_at_3
	end
	loc_1 = 0
	loc_5 = load_i32(memory_at_0, 0 + 1049868)
	if lt_u32(loc_5, 41) then
		goto continue_at_12
	end
	loc_0 = 1049576
	::continue_at_13::
	while true do
		loc_2 = load_i32(memory_at_0, loc_0)
		if gt_u32(loc_2, loc_3) then
			goto continue_at_14
		end
		if gt_u32(add_i32(loc_2, load_i32(memory_at_0, loc_0 + 4)), loc_3) then
			goto continue_at_12
		end
		::continue_at_14::
		loc_0 = load_i32(memory_at_0, loc_0 + 8)
		if loc_0 ~= 0 then
			goto continue_at_13
		end
		break
	end
	::continue_at_12::
	loc_0 = load_i32(memory_at_0, 0 + 1049584)
	if loc_0 == 0 then
		goto continue_at_15
	end
	loc_1 = 0
	::continue_at_16::
	while true do
		loc_1 = add_i32(loc_1, 1)
		loc_0 = load_i32(memory_at_0, loc_0 + 8)
		if loc_0 ~= 0 then
			goto continue_at_16
		end
		break
	end
	::continue_at_15::
	store_i32(memory_at_0, 0 + 1049896, (gt_u32(loc_1, 4095) and loc_1 or 4095))
	if le_u32(loc_5, loc_4) then
		goto continue_at_3
	end
	store_i32(memory_at_0, 0 + 1049888, -1)
	::continue_at_3::
	goto continue_at_0
	::continue_at_2::
	loc_3 = add_i32(band_i32(loc_0, -8), 1049592)
	loc_2 = load_i32(memory_at_0, 0 + 1049856)
	loc_0 = shl_i32(1, shr_u32(loc_0, 3))
	if band_i32(loc_2, loc_0) ~= 0 then
		goto continue_at_18
	end
	store_i32(memory_at_0, 0 + 1049856, bor_i32(loc_2, loc_0))
	loc_0 = loc_3
	goto continue_at_17
	::continue_at_18::
	loc_0 = load_i32(memory_at_0, loc_3 + 8)
	::continue_at_17::
	store_i32(memory_at_0, loc_3 + 8, loc_1)
	store_i32(memory_at_0, loc_0 + 12, loc_1)
	store_i32(memory_at_0, loc_1 + 12, loc_3)
	store_i32(memory_at_0, loc_1 + 8, loc_0)
	goto continue_at_0
	::continue_at_1::
	store_i32(memory_at_0, 0 + 1049872, loc_1)
	loc_0 = add_i32(load_i32(memory_at_0, 0 + 1049864), loc_0)
	store_i32(memory_at_0, 0 + 1049864, loc_0)
	store_i32(memory_at_0, loc_1 + 4, bor_i32(loc_0, 1))
	store_i32(memory_at_0, add_i32(loc_1, loc_0), loc_0)
	::continue_at_0::
end
FUNC_LIST[23] = --[[ _ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17h176173f383a75cf2E ]] function(loc_0)
	local loc_1 = 0
	local loc_2 = 0
	local loc_3 = 0
	local loc_4 = 0
	local loc_5 = 0
	local loc_6 = 0
	local loc_7 = 0
	local loc_8 = 0
	local loc_9 = 0
	local loc_10 = 0LL
	local reg_0
	local reg_1
	loc_1 = sub_i32(GLOBAL_LIST[0].value, 16)
	GLOBAL_LIST[0].value = loc_1
	if lt_u32(loc_0, 245) then
		goto continue_at_8
	end
	loc_2 = 0
	if ge_u32(loc_0, -65587) then
		goto continue_at_1
	end
	loc_0 = add_i32(loc_0, 11)
	loc_3 = band_i32(loc_0, -8)
	loc_4 = load_i32(memory_at_0, 0 + 1049860)
	if loc_4 == 0 then
		goto continue_at_4
	end
	loc_5 = 0
	if lt_u32(loc_3, 256) then
		goto continue_at_9
	end
	loc_5 = 31
	if gt_u32(loc_3, 16777215) then
		goto continue_at_9
	end
	loc_0 = clz_i32(shr_u32(loc_0, 8))
	loc_5 = add_i32(sub_i32(band_i32(shr_u32(loc_3, sub_i32(6, loc_0)), 1), shl_i32(loc_0, 1)), 62)
	::continue_at_9::
	loc_2 = sub_i32(0, loc_3)
	loc_6 = load_i32(memory_at_0, add_i32(shl_i32(loc_5, 2), 1049448))
	if loc_6 ~= 0 then
		goto continue_at_10
	end
	loc_0 = 0
	loc_7 = 0
	goto continue_at_7
	::continue_at_10::
	loc_0 = 0
	loc_8 = shl_i32(loc_3, (loc_5 == 31 and 0 or sub_i32(25, shr_u32(loc_5, 1))))
	loc_7 = 0
	::continue_at_11::
	while true do
		loc_6 = loc_6
		loc_9 = band_i32(load_i32(memory_at_0, loc_6 + 4), -8)
		if lt_u32(loc_9, loc_3) then
			goto continue_at_12
		end
		loc_9 = sub_i32(loc_9, loc_3)
		if ge_u32(loc_9, loc_2) then
			goto continue_at_12
		end
		loc_2 = loc_9
		loc_7 = loc_6
		if loc_9 ~= 0 then
			goto continue_at_12
		end
		loc_2 = 0
		loc_7 = loc_6
		loc_0 = loc_6
		goto continue_at_6
		::continue_at_12::
		loc_9 = load_i32(memory_at_0, loc_6 + 20)
		loc_6 = load_i32(memory_at_0, add_i32(add_i32(loc_6, band_i32(shr_u32(loc_8, 29), 4)), 16))
		loc_0 = (loc_9 ~= 0 and (loc_9 ~= loc_6 and loc_9 or loc_0) or loc_0)
		loc_8 = shl_i32(loc_8, 1)
		if loc_6 == 0 then
			goto continue_at_7
		end
		goto continue_at_11
	end
	::continue_at_8::
	loc_6 = load_i32(memory_at_0, 0 + 1049856)
	loc_3 = (lt_u32(loc_0, 11) and 16 or band_i32(add_i32(loc_0, 11), 504))
	loc_2 = shr_u32(loc_3, 3)
	loc_0 = shr_u32(loc_6, loc_2)
	if band_i32(loc_0, 3) == 0 then
		goto continue_at_13
	end
	loc_3 = add_i32(band_i32(bxor_i32(loc_0, -1), 1), loc_2)
	loc_0 = shl_i32(loc_3, 3)
	loc_2 = add_i32(loc_0, 1049592)
	loc_0 = load_i32(memory_at_0, add_i32(loc_0, 1049600))
	loc_7 = load_i32(memory_at_0, loc_0 + 8)
	if loc_2 == loc_7 then
		goto continue_at_15
	end
	store_i32(memory_at_0, loc_7 + 12, loc_2)
	store_i32(memory_at_0, loc_2 + 8, loc_7)
	goto continue_at_14
	::continue_at_15::
	store_i32(memory_at_0, 0 + 1049856, band_i32(loc_6, rotl_i32(-2, loc_3)))
	::continue_at_14::
	loc_2 = add_i32(loc_0, 8)
	loc_3 = shl_i32(loc_3, 3)
	store_i32(memory_at_0, loc_0 + 4, bor_i32(loc_3, 3))
	loc_0 = add_i32(loc_0, loc_3)
	store_i32(memory_at_0, loc_0 + 4, bor_i32(load_i32(memory_at_0, loc_0 + 4), 1))
	goto continue_at_1
	::continue_at_13::
	if le_u32(loc_3, load_i32(memory_at_0, 0 + 1049864)) then
		goto continue_at_4
	end
	if loc_0 ~= 0 then
		goto continue_at_18
	end
	loc_0 = load_i32(memory_at_0, 0 + 1049860)
	if loc_0 == 0 then
		goto continue_at_4
	end
	loc_7 = load_i32(memory_at_0, add_i32(shl_i32(ctz_i32(loc_0), 2), 1049448))
	loc_2 = sub_i32(band_i32(load_i32(memory_at_0, loc_7 + 4), -8), loc_3)
	loc_6 = loc_7
	::continue_at_19::
	while true do
		loc_0 = load_i32(memory_at_0, loc_7 + 16)
		if loc_0 ~= 0 then
			goto continue_at_20
		end
		loc_0 = load_i32(memory_at_0, loc_7 + 20)
		if loc_0 ~= 0 then
			goto continue_at_20
		end
		loc_5 = load_i32(memory_at_0, loc_6 + 24)
		loc_0 = load_i32(memory_at_0, loc_6 + 12)
		if loc_0 ~= loc_6 then
			goto continue_at_23
		end
		loc_0 = load_i32(memory_at_0, loc_6 + 20)
		loc_7 = load_i32(memory_at_0, add_i32(loc_6, (loc_0 ~= 0 and 20 or 16)))
		if loc_7 ~= 0 then
			goto continue_at_22
		end
		loc_0 = 0
		goto continue_at_21
		::continue_at_23::
		loc_7 = load_i32(memory_at_0, loc_6 + 8)
		store_i32(memory_at_0, loc_7 + 12, loc_0)
		store_i32(memory_at_0, loc_0 + 8, loc_7)
		goto continue_at_21
		::continue_at_22::
		loc_8 = (loc_0 ~= 0 and add_i32(loc_6, 20) or add_i32(loc_6, 16))
		::continue_at_24::
		while true do
			loc_9 = loc_8
			loc_0 = loc_7
			loc_7 = load_i32(memory_at_0, loc_0 + 20)
			loc_8 = (loc_7 ~= 0 and add_i32(loc_0, 20) or add_i32(loc_0, 16))
			loc_7 = load_i32(memory_at_0, add_i32(loc_0, (loc_7 ~= 0 and 20 or 16)))
			if loc_7 ~= 0 then
				goto continue_at_24
			end
			break
		end
		store_i32(memory_at_0, loc_9, 0)
		::continue_at_21::
		if loc_5 == 0 then
			goto continue_at_16
		end
		loc_7 = add_i32(shl_i32(load_i32(memory_at_0, loc_6 + 28), 2), 1049448)
		if load_i32(memory_at_0, loc_7) == loc_6 then
			goto continue_at_25
		end
		store_i32(memory_at_0, add_i32(loc_5, (load_i32(memory_at_0, loc_5 + 16) == loc_6 and 16 or 20)), loc_0)
		if loc_0 == 0 then
			goto continue_at_16
		end
		goto continue_at_17
		::continue_at_25::
		store_i32(memory_at_0, loc_7, loc_0)
		if loc_0 ~= 0 then
			goto continue_at_17
		end
		store_i32(memory_at_0, 0 + 1049860, band_i32(load_i32(memory_at_0, 0 + 1049860), rotl_i32(-2, load_i32(memory_at_0, loc_6 + 28))))
		goto continue_at_16
		::continue_at_20::
		loc_7 = sub_i32(band_i32(load_i32(memory_at_0, loc_0 + 4), -8), loc_3)
		reg_0 = loc_7
		loc_7 = (lt_u32(loc_7, loc_2) and 1 or 0)
		loc_2 = (loc_7 ~= 0 and reg_0 or loc_2)
		loc_6 = (loc_7 ~= 0 and loc_0 or loc_6)
		loc_7 = loc_0
		goto continue_at_19
	end
	::continue_at_18::
	reg_0 = shl_i32(loc_0, loc_2)
	loc_0 = shl_i32(2, loc_2)
	loc_2 = ctz_i32(band_i32(reg_0, bor_i32(loc_0, sub_i32(0, loc_0))))
	loc_0 = shl_i32(loc_2, 3)
	loc_7 = add_i32(loc_0, 1049592)
	loc_0 = load_i32(memory_at_0, add_i32(loc_0, 1049600))
	loc_8 = load_i32(memory_at_0, loc_0 + 8)
	if loc_7 == loc_8 then
		goto continue_at_27
	end
	store_i32(memory_at_0, loc_8 + 12, loc_7)
	store_i32(memory_at_0, loc_7 + 8, loc_8)
	goto continue_at_26
	::continue_at_27::
	store_i32(memory_at_0, 0 + 1049856, band_i32(loc_6, rotl_i32(-2, loc_2)))
	::continue_at_26::
	store_i32(memory_at_0, loc_0 + 4, bor_i32(loc_3, 3))
	loc_8 = add_i32(loc_0, loc_3)
	loc_2 = shl_i32(loc_2, 3)
	loc_7 = sub_i32(loc_2, loc_3)
	store_i32(memory_at_0, loc_8 + 4, bor_i32(loc_7, 1))
	store_i32(memory_at_0, add_i32(loc_0, loc_2), loc_7)
	loc_6 = load_i32(memory_at_0, 0 + 1049864)
	if loc_6 == 0 then
		goto continue_at_28
	end
	loc_2 = add_i32(band_i32(loc_6, -8), 1049592)
	loc_3 = load_i32(memory_at_0, 0 + 1049872)
	loc_9 = load_i32(memory_at_0, 0 + 1049856)
	loc_6 = shl_i32(1, shr_u32(loc_6, 3))
	if band_i32(loc_9, loc_6) ~= 0 then
		goto continue_at_30
	end
	store_i32(memory_at_0, 0 + 1049856, bor_i32(loc_9, loc_6))
	loc_6 = loc_2
	goto continue_at_29
	::continue_at_30::
	loc_6 = load_i32(memory_at_0, loc_2 + 8)
	::continue_at_29::
	store_i32(memory_at_0, loc_2 + 8, loc_3)
	store_i32(memory_at_0, loc_6 + 12, loc_3)
	store_i32(memory_at_0, loc_3 + 12, loc_2)
	store_i32(memory_at_0, loc_3 + 8, loc_6)
	::continue_at_28::
	loc_2 = add_i32(loc_0, 8)
	store_i32(memory_at_0, 0 + 1049872, loc_8)
	store_i32(memory_at_0, 0 + 1049864, loc_7)
	goto continue_at_1
	::continue_at_17::
	store_i32(memory_at_0, loc_0 + 24, loc_5)
	loc_7 = load_i32(memory_at_0, loc_6 + 16)
	if loc_7 == 0 then
		goto continue_at_31
	end
	store_i32(memory_at_0, loc_0 + 16, loc_7)
	store_i32(memory_at_0, loc_7 + 24, loc_0)
	::continue_at_31::
	loc_7 = load_i32(memory_at_0, loc_6 + 20)
	if loc_7 == 0 then
		goto continue_at_16
	end
	store_i32(memory_at_0, loc_0 + 20, loc_7)
	store_i32(memory_at_0, loc_7 + 24, loc_0)
	::continue_at_16::
	if lt_u32(loc_2, 16) then
		goto continue_at_34
	end
	store_i32(memory_at_0, loc_6 + 4, bor_i32(loc_3, 3))
	loc_3 = add_i32(loc_6, loc_3)
	store_i32(memory_at_0, loc_3 + 4, bor_i32(loc_2, 1))
	store_i32(memory_at_0, add_i32(loc_3, loc_2), loc_2)
	loc_8 = load_i32(memory_at_0, 0 + 1049864)
	if loc_8 == 0 then
		goto continue_at_33
	end
	loc_7 = add_i32(band_i32(loc_8, -8), 1049592)
	loc_0 = load_i32(memory_at_0, 0 + 1049872)
	loc_9 = load_i32(memory_at_0, 0 + 1049856)
	loc_8 = shl_i32(1, shr_u32(loc_8, 3))
	if band_i32(loc_9, loc_8) ~= 0 then
		goto continue_at_36
	end
	store_i32(memory_at_0, 0 + 1049856, bor_i32(loc_9, loc_8))
	loc_8 = loc_7
	goto continue_at_35
	::continue_at_36::
	loc_8 = load_i32(memory_at_0, loc_7 + 8)
	::continue_at_35::
	store_i32(memory_at_0, loc_7 + 8, loc_0)
	store_i32(memory_at_0, loc_8 + 12, loc_0)
	store_i32(memory_at_0, loc_0 + 12, loc_7)
	store_i32(memory_at_0, loc_0 + 8, loc_8)
	goto continue_at_33
	::continue_at_34::
	loc_0 = add_i32(loc_2, loc_3)
	store_i32(memory_at_0, loc_6 + 4, bor_i32(loc_0, 3))
	loc_0 = add_i32(loc_6, loc_0)
	store_i32(memory_at_0, loc_0 + 4, bor_i32(load_i32(memory_at_0, loc_0 + 4), 1))
	goto continue_at_32
	::continue_at_33::
	store_i32(memory_at_0, 0 + 1049872, loc_3)
	store_i32(memory_at_0, 0 + 1049864, loc_2)
	::continue_at_32::
	loc_2 = add_i32(loc_6, 8)
	goto continue_at_1
	::continue_at_7::
	if bor_i32(loc_0, loc_7) ~= 0 then
		goto continue_at_37
	end
	loc_7 = 0
	loc_0 = shl_i32(2, loc_5)
	loc_0 = band_i32(bor_i32(loc_0, sub_i32(0, loc_0)), loc_4)
	if loc_0 == 0 then
		goto continue_at_4
	end
	loc_0 = load_i32(memory_at_0, add_i32(shl_i32(ctz_i32(loc_0), 2), 1049448))
	::continue_at_37::
	if loc_0 == 0 then
		goto continue_at_5
	end
	::continue_at_6::
	::continue_at_38::
	while true do
		loc_6 = band_i32(load_i32(memory_at_0, loc_0 + 4), -8)
		loc_9 = sub_i32(loc_6, loc_3)
		loc_5 = (lt_u32(loc_9, loc_2) and 1 or 0)
		loc_4 = (loc_5 ~= 0 and loc_0 or loc_7)
		loc_8 = (lt_u32(loc_6, loc_3) and 1 or 0)
		loc_9 = (loc_5 ~= 0 and loc_9 or loc_2)
		loc_6 = load_i32(memory_at_0, loc_0 + 16)
		if loc_6 ~= 0 then
			goto continue_at_39
		end
		loc_6 = load_i32(memory_at_0, loc_0 + 20)
		::continue_at_39::
		loc_7 = (loc_8 ~= 0 and loc_7 or loc_4)
		loc_2 = (loc_8 ~= 0 and loc_2 or loc_9)
		loc_0 = loc_6
		if loc_6 ~= 0 then
			goto continue_at_38
		end
		break
	end
	::continue_at_5::
	if loc_7 == 0 then
		goto continue_at_4
	end
	loc_0 = load_i32(memory_at_0, 0 + 1049864)
	if lt_u32(loc_0, loc_3) then
		goto continue_at_40
	end
	if ge_u32(loc_2, sub_i32(loc_0, loc_3)) then
		goto continue_at_4
	end
	::continue_at_40::
	loc_5 = load_i32(memory_at_0, loc_7 + 24)
	loc_0 = load_i32(memory_at_0, loc_7 + 12)
	if loc_0 ~= loc_7 then
		goto continue_at_43
	end
	loc_0 = load_i32(memory_at_0, loc_7 + 20)
	loc_6 = load_i32(memory_at_0, add_i32(loc_7, (loc_0 ~= 0 and 20 or 16)))
	if loc_6 ~= 0 then
		goto continue_at_42
	end
	loc_0 = 0
	goto continue_at_41
	::continue_at_43::
	loc_6 = load_i32(memory_at_0, loc_7 + 8)
	store_i32(memory_at_0, loc_6 + 12, loc_0)
	store_i32(memory_at_0, loc_0 + 8, loc_6)
	goto continue_at_41
	::continue_at_42::
	loc_8 = (loc_0 ~= 0 and add_i32(loc_7, 20) or add_i32(loc_7, 16))
	::continue_at_44::
	while true do
		loc_9 = loc_8
		loc_0 = loc_6
		loc_6 = load_i32(memory_at_0, loc_0 + 20)
		loc_8 = (loc_6 ~= 0 and add_i32(loc_0, 20) or add_i32(loc_0, 16))
		loc_6 = load_i32(memory_at_0, add_i32(loc_0, (loc_6 ~= 0 and 20 or 16)))
		if loc_6 ~= 0 then
			goto continue_at_44
		end
		break
	end
	store_i32(memory_at_0, loc_9, 0)
	::continue_at_41::
	if loc_5 == 0 then
		goto continue_at_2
	end
	loc_6 = add_i32(shl_i32(load_i32(memory_at_0, loc_7 + 28), 2), 1049448)
	if load_i32(memory_at_0, loc_6) == loc_7 then
		goto continue_at_45
	end
	store_i32(memory_at_0, add_i32(loc_5, (load_i32(memory_at_0, loc_5 + 16) == loc_7 and 16 or 20)), loc_0)
	if loc_0 == 0 then
		goto continue_at_2
	end
	goto continue_at_3
	::continue_at_45::
	store_i32(memory_at_0, loc_6, loc_0)
	if loc_0 ~= 0 then
		goto continue_at_3
	end
	store_i32(memory_at_0, 0 + 1049860, band_i32(load_i32(memory_at_0, 0 + 1049860), rotl_i32(-2, load_i32(memory_at_0, loc_7 + 28))))
	goto continue_at_2
	::continue_at_4::
	loc_0 = load_i32(memory_at_0, 0 + 1049864)
	if ge_u32(loc_0, loc_3) then
		goto continue_at_51
	end
	loc_0 = load_i32(memory_at_0, 0 + 1049868)
	if gt_u32(loc_0, loc_3) then
		goto continue_at_52
	end
	FUNC_LIST[40](add_i32(loc_1, 4), 1049900, band_i32(add_i32(loc_3, 65583), -65536))
	loc_6 = load_i32(memory_at_0, loc_1 + 4)
	if loc_6 ~= 0 then
		goto continue_at_53
	end
	loc_2 = 0
	goto continue_at_1
	::continue_at_53::
	loc_5 = load_i32(memory_at_0, loc_1 + 12)
	loc_9 = load_i32(memory_at_0, loc_1 + 8)
	loc_0 = add_i32(load_i32(memory_at_0, 0 + 1049880), loc_9)
	store_i32(memory_at_0, 0 + 1049880, loc_0)
	loc_2 = load_i32(memory_at_0, 0 + 1049884)
	store_i32(memory_at_0, 0 + 1049884, (gt_u32(loc_2, loc_0) and loc_2 or loc_0))
	loc_2 = load_i32(memory_at_0, 0 + 1049876)
	if loc_2 == 0 then
		goto continue_at_56
	end
	loc_0 = 1049576
	::continue_at_57::
	while true do
		loc_7 = load_i32(memory_at_0, loc_0)
		loc_8 = load_i32(memory_at_0, loc_0 + 4)
		if loc_6 == add_i32(loc_7, loc_8) then
			goto continue_at_55
		end
		loc_0 = load_i32(memory_at_0, loc_0 + 8)
		if loc_0 ~= 0 then
			goto continue_at_57
		end
		goto continue_at_54
	end
	::continue_at_56::
	loc_0 = load_i32(memory_at_0, 0 + 1049892)
	if loc_0 == 0 then
		goto continue_at_59
	end
	if ge_u32(loc_6, loc_0) then
		goto continue_at_58
	end
	::continue_at_59::
	store_i32(memory_at_0, 0 + 1049892, loc_6)
	::continue_at_58::
	store_i32(memory_at_0, 0 + 1049896, 4095)
	store_i32(memory_at_0, 0 + 1049588, loc_5)
	store_i32(memory_at_0, 0 + 1049580, loc_9)
	store_i32(memory_at_0, 0 + 1049576, loc_6)
	store_i32(memory_at_0, 0 + 1049604, 1049592)
	store_i32(memory_at_0, 0 + 1049612, 1049600)
	store_i32(memory_at_0, 0 + 1049600, 1049592)
	store_i32(memory_at_0, 0 + 1049620, 1049608)
	store_i32(memory_at_0, 0 + 1049608, 1049600)
	store_i32(memory_at_0, 0 + 1049628, 1049616)
	store_i32(memory_at_0, 0 + 1049616, 1049608)
	store_i32(memory_at_0, 0 + 1049636, 1049624)
	store_i32(memory_at_0, 0 + 1049624, 1049616)
	store_i32(memory_at_0, 0 + 1049644, 1049632)
	store_i32(memory_at_0, 0 + 1049632, 1049624)
	store_i32(memory_at_0, 0 + 1049652, 1049640)
	store_i32(memory_at_0, 0 + 1049640, 1049632)
	store_i32(memory_at_0, 0 + 1049660, 1049648)
	store_i32(memory_at_0, 0 + 1049648, 1049640)
	store_i32(memory_at_0, 0 + 1049668, 1049656)
	store_i32(memory_at_0, 0 + 1049656, 1049648)
	store_i32(memory_at_0, 0 + 1049664, 1049656)
	store_i32(memory_at_0, 0 + 1049676, 1049664)
	store_i32(memory_at_0, 0 + 1049672, 1049664)
	store_i32(memory_at_0, 0 + 1049684, 1049672)
	store_i32(memory_at_0, 0 + 1049680, 1049672)
	store_i32(memory_at_0, 0 + 1049692, 1049680)
	store_i32(memory_at_0, 0 + 1049688, 1049680)
	store_i32(memory_at_0, 0 + 1049700, 1049688)
	store_i32(memory_at_0, 0 + 1049696, 1049688)
	store_i32(memory_at_0, 0 + 1049708, 1049696)
	store_i32(memory_at_0, 0 + 1049704, 1049696)
	store_i32(memory_at_0, 0 + 1049716, 1049704)
	store_i32(memory_at_0, 0 + 1049712, 1049704)
	store_i32(memory_at_0, 0 + 1049724, 1049712)
	store_i32(memory_at_0, 0 + 1049720, 1049712)
	store_i32(memory_at_0, 0 + 1049732, 1049720)
	store_i32(memory_at_0, 0 + 1049740, 1049728)
	store_i32(memory_at_0, 0 + 1049728, 1049720)
	store_i32(memory_at_0, 0 + 1049748, 1049736)
	store_i32(memory_at_0, 0 + 1049736, 1049728)
	store_i32(memory_at_0, 0 + 1049756, 1049744)
	store_i32(memory_at_0, 0 + 1049744, 1049736)
	store_i32(memory_at_0, 0 + 1049764, 1049752)
	store_i32(memory_at_0, 0 + 1049752, 1049744)
	store_i32(memory_at_0, 0 + 1049772, 1049760)
	store_i32(memory_at_0, 0 + 1049760, 1049752)
	store_i32(memory_at_0, 0 + 1049780, 1049768)
	store_i32(memory_at_0, 0 + 1049768, 1049760)
	store_i32(memory_at_0, 0 + 1049788, 1049776)
	store_i32(memory_at_0, 0 + 1049776, 1049768)
	store_i32(memory_at_0, 0 + 1049796, 1049784)
	store_i32(memory_at_0, 0 + 1049784, 1049776)
	store_i32(memory_at_0, 0 + 1049804, 1049792)
	store_i32(memory_at_0, 0 + 1049792, 1049784)
	store_i32(memory_at_0, 0 + 1049812, 1049800)
	store_i32(memory_at_0, 0 + 1049800, 1049792)
	store_i32(memory_at_0, 0 + 1049820, 1049808)
	store_i32(memory_at_0, 0 + 1049808, 1049800)
	store_i32(memory_at_0, 0 + 1049828, 1049816)
	store_i32(memory_at_0, 0 + 1049816, 1049808)
	store_i32(memory_at_0, 0 + 1049836, 1049824)
	store_i32(memory_at_0, 0 + 1049824, 1049816)
	store_i32(memory_at_0, 0 + 1049844, 1049832)
	store_i32(memory_at_0, 0 + 1049832, 1049824)
	store_i32(memory_at_0, 0 + 1049852, 1049840)
	store_i32(memory_at_0, 0 + 1049840, 1049832)
	loc_0 = band_i32(add_i32(loc_6, 15), -8)
	loc_2 = add_i32(loc_0, -8)
	store_i32(memory_at_0, 0 + 1049876, loc_2)
	store_i32(memory_at_0, 0 + 1049848, 1049840)
	reg_1 = sub_i32(loc_6, loc_0)
	loc_0 = add_i32(loc_9, -40)
	loc_7 = add_i32(add_i32(reg_1, loc_0), 8)
	store_i32(memory_at_0, 0 + 1049868, loc_7)
	store_i32(memory_at_0, loc_2 + 4, bor_i32(loc_7, 1))
	store_i32(memory_at_0, add_i32(loc_6, loc_0) + 4, 40)
	store_i32(memory_at_0, 0 + 1049888, 2097152)
	goto continue_at_46
	::continue_at_55::
	if ge_u32(loc_2, loc_6) then
		goto continue_at_54
	end
	if gt_u32(loc_7, loc_2) then
		goto continue_at_54
	end
	loc_7 = load_i32(memory_at_0, loc_0 + 12)
	if band_i32(loc_7, 1) ~= 0 then
		goto continue_at_54
	end
	if shr_u32(loc_7, 1) == loc_5 then
		goto continue_at_50
	end
	::continue_at_54::
	loc_0 = load_i32(memory_at_0, 0 + 1049892)
	store_i32(memory_at_0, 0 + 1049892, (gt_u32(loc_6, loc_0) and loc_0 or loc_6))
	loc_7 = add_i32(loc_6, loc_9)
	loc_0 = 1049576
	::continue_at_63::
	while true do
		if load_i32(memory_at_0, loc_0) == loc_7 then
			goto continue_at_62
		end
		loc_0 = load_i32(memory_at_0, loc_0 + 8)
		if loc_0 ~= 0 then
			goto continue_at_63
		end
		goto continue_at_61
	end
	::continue_at_62::
	loc_8 = load_i32(memory_at_0, loc_0 + 12)
	if band_i32(loc_8, 1) ~= 0 then
		goto continue_at_61
	end
	if shr_u32(loc_8, 1) == loc_5 then
		goto continue_at_60
	end
	::continue_at_61::
	loc_0 = 1049576
	::continue_at_65::
	while true do
		loc_7 = load_i32(memory_at_0, loc_0)
		if gt_u32(loc_7, loc_2) then
			goto continue_at_66
		end
		loc_7 = add_i32(loc_7, load_i32(memory_at_0, loc_0 + 4))
		if gt_u32(loc_7, loc_2) then
			goto continue_at_64
		end
		::continue_at_66::
		loc_0 = load_i32(memory_at_0, loc_0 + 8)
		goto continue_at_65
	end
	::continue_at_64::
	loc_0 = band_i32(add_i32(loc_6, 15), -8)
	loc_8 = add_i32(loc_0, -8)
	store_i32(memory_at_0, 0 + 1049876, loc_8)
	reg_1 = sub_i32(loc_6, loc_0)
	loc_0 = add_i32(loc_9, -40)
	loc_4 = add_i32(add_i32(reg_1, loc_0), 8)
	store_i32(memory_at_0, 0 + 1049868, loc_4)
	store_i32(memory_at_0, loc_8 + 4, bor_i32(loc_4, 1))
	store_i32(memory_at_0, add_i32(loc_6, loc_0) + 4, 40)
	store_i32(memory_at_0, 0 + 1049888, 2097152)
	loc_0 = add_i32(band_i32(add_i32(loc_7, -32), -8), -8)
	loc_8 = (lt_u32(loc_0, add_i32(loc_2, 16)) and loc_2 or loc_0)
	store_i32(memory_at_0, loc_8 + 4, 27)
	loc_10 = load_i64(memory_at_0, 0 + 1049576)
	store_i64(memory_at_0, add_i32(loc_8, 16), load_i64(memory_at_0, 0 + 1049584))
	store_i64(memory_at_0, loc_8 + 8, loc_10)
	store_i32(memory_at_0, 0 + 1049588, loc_5)
	store_i32(memory_at_0, 0 + 1049580, loc_9)
	store_i32(memory_at_0, 0 + 1049576, loc_6)
	store_i32(memory_at_0, 0 + 1049584, add_i32(loc_8, 8))
	loc_0 = add_i32(loc_8, 28)
	::continue_at_67::
	while true do
		store_i32(memory_at_0, loc_0, 7)
		loc_0 = add_i32(loc_0, 4)
		if lt_u32(loc_0, loc_7) then
			goto continue_at_67
		end
		break
	end
	if loc_8 == loc_2 then
		goto continue_at_46
	end
	store_i32(memory_at_0, loc_8 + 4, band_i32(load_i32(memory_at_0, loc_8 + 4), -2))
	loc_0 = sub_i32(loc_8, loc_2)
	store_i32(memory_at_0, loc_2 + 4, bor_i32(loc_0, 1))
	store_i32(memory_at_0, loc_8, loc_0)
	if lt_u32(loc_0, 256) then
		goto continue_at_68
	end
	FUNC_LIST[21](loc_2, loc_0)
	goto continue_at_46
	::continue_at_68::
	loc_7 = add_i32(band_i32(loc_0, -8), 1049592)
	loc_6 = load_i32(memory_at_0, 0 + 1049856)
	loc_0 = shl_i32(1, shr_u32(loc_0, 3))
	if band_i32(loc_6, loc_0) ~= 0 then
		goto continue_at_70
	end
	store_i32(memory_at_0, 0 + 1049856, bor_i32(loc_6, loc_0))
	loc_0 = loc_7
	goto continue_at_69
	::continue_at_70::
	loc_0 = load_i32(memory_at_0, loc_7 + 8)
	::continue_at_69::
	store_i32(memory_at_0, loc_7 + 8, loc_2)
	store_i32(memory_at_0, loc_0 + 12, loc_2)
	store_i32(memory_at_0, loc_2 + 12, loc_7)
	store_i32(memory_at_0, loc_2 + 8, loc_0)
	goto continue_at_46
	::continue_at_60::
	store_i32(memory_at_0, loc_0, loc_6)
	store_i32(memory_at_0, loc_0 + 4, add_i32(load_i32(memory_at_0, loc_0 + 4), loc_9))
	loc_6 = add_i32(band_i32(add_i32(loc_6, 15), -8), -8)
	store_i32(memory_at_0, loc_6 + 4, bor_i32(loc_3, 3))
	loc_2 = add_i32(band_i32(add_i32(loc_7, 15), -8), -8)
	loc_0 = add_i32(loc_6, loc_3)
	loc_3 = sub_i32(loc_2, loc_0)
	if loc_2 == load_i32(memory_at_0, 0 + 1049876) then
		goto continue_at_49
	end
	if loc_2 == load_i32(memory_at_0, 0 + 1049872) then
		goto continue_at_48
	end
	loc_7 = load_i32(memory_at_0, loc_2 + 4)
	if band_i32(loc_7, 3) ~= 1 then
		goto continue_at_71
	end
	loc_7 = band_i32(loc_7, -8)
	FUNC_LIST[19](loc_2, loc_7)
	loc_3 = add_i32(loc_7, loc_3)
	loc_2 = add_i32(loc_2, loc_7)
	loc_7 = load_i32(memory_at_0, loc_2 + 4)
	::continue_at_71::
	store_i32(memory_at_0, loc_2 + 4, band_i32(loc_7, -2))
	store_i32(memory_at_0, loc_0 + 4, bor_i32(loc_3, 1))
	store_i32(memory_at_0, add_i32(loc_0, loc_3), loc_3)
	if lt_u32(loc_3, 256) then
		goto continue_at_72
	end
	FUNC_LIST[21](loc_0, loc_3)
	goto continue_at_47
	::continue_at_72::
	loc_2 = add_i32(band_i32(loc_3, -8), 1049592)
	loc_7 = load_i32(memory_at_0, 0 + 1049856)
	loc_3 = shl_i32(1, shr_u32(loc_3, 3))
	if band_i32(loc_7, loc_3) ~= 0 then
		goto continue_at_74
	end
	store_i32(memory_at_0, 0 + 1049856, bor_i32(loc_7, loc_3))
	loc_3 = loc_2
	goto continue_at_73
	::continue_at_74::
	loc_3 = load_i32(memory_at_0, loc_2 + 8)
	::continue_at_73::
	store_i32(memory_at_0, loc_2 + 8, loc_0)
	store_i32(memory_at_0, loc_3 + 12, loc_0)
	store_i32(memory_at_0, loc_0 + 12, loc_2)
	store_i32(memory_at_0, loc_0 + 8, loc_3)
	goto continue_at_47
	::continue_at_52::
	loc_2 = sub_i32(loc_0, loc_3)
	store_i32(memory_at_0, 0 + 1049868, loc_2)
	loc_0 = load_i32(memory_at_0, 0 + 1049876)
	loc_7 = add_i32(loc_0, loc_3)
	store_i32(memory_at_0, 0 + 1049876, loc_7)
	store_i32(memory_at_0, loc_7 + 4, bor_i32(loc_2, 1))
	store_i32(memory_at_0, loc_0 + 4, bor_i32(loc_3, 3))
	loc_2 = add_i32(loc_0, 8)
	goto continue_at_1
	::continue_at_51::
	loc_2 = load_i32(memory_at_0, 0 + 1049872)
	loc_7 = sub_i32(loc_0, loc_3)
	if gt_u32(loc_7, 15) then
		goto continue_at_76
	end
	store_i32(memory_at_0, 0 + 1049872, 0)
	store_i32(memory_at_0, 0 + 1049864, 0)
	store_i32(memory_at_0, loc_2 + 4, bor_i32(loc_0, 3))
	loc_0 = add_i32(loc_2, loc_0)
	store_i32(memory_at_0, loc_0 + 4, bor_i32(load_i32(memory_at_0, loc_0 + 4), 1))
	goto continue_at_75
	::continue_at_76::
	store_i32(memory_at_0, 0 + 1049864, loc_7)
	loc_6 = add_i32(loc_2, loc_3)
	store_i32(memory_at_0, 0 + 1049872, loc_6)
	store_i32(memory_at_0, loc_6 + 4, bor_i32(loc_7, 1))
	store_i32(memory_at_0, add_i32(loc_2, loc_0), loc_7)
	store_i32(memory_at_0, loc_2 + 4, bor_i32(loc_3, 3))
	::continue_at_75::
	loc_2 = add_i32(loc_2, 8)
	goto continue_at_1
	::continue_at_50::
	store_i32(memory_at_0, loc_0 + 4, add_i32(loc_8, loc_9))
	loc_0 = load_i32(memory_at_0, 0 + 1049876)
	loc_2 = band_i32(add_i32(loc_0, 15), -8)
	loc_7 = add_i32(loc_2, -8)
	store_i32(memory_at_0, 0 + 1049876, loc_7)
	reg_1 = sub_i32(loc_0, loc_2)
	loc_2 = add_i32(load_i32(memory_at_0, 0 + 1049868), loc_9)
	loc_6 = add_i32(add_i32(reg_1, loc_2), 8)
	store_i32(memory_at_0, 0 + 1049868, loc_6)
	store_i32(memory_at_0, loc_7 + 4, bor_i32(loc_6, 1))
	store_i32(memory_at_0, add_i32(loc_0, loc_2) + 4, 40)
	store_i32(memory_at_0, 0 + 1049888, 2097152)
	goto continue_at_46
	::continue_at_49::
	store_i32(memory_at_0, 0 + 1049876, loc_0)
	loc_3 = add_i32(load_i32(memory_at_0, 0 + 1049868), loc_3)
	store_i32(memory_at_0, 0 + 1049868, loc_3)
	store_i32(memory_at_0, loc_0 + 4, bor_i32(loc_3, 1))
	goto continue_at_47
	::continue_at_48::
	store_i32(memory_at_0, 0 + 1049872, loc_0)
	loc_3 = add_i32(load_i32(memory_at_0, 0 + 1049864), loc_3)
	store_i32(memory_at_0, 0 + 1049864, loc_3)
	store_i32(memory_at_0, loc_0 + 4, bor_i32(loc_3, 1))
	store_i32(memory_at_0, add_i32(loc_0, loc_3), loc_3)
	::continue_at_47::
	loc_2 = add_i32(loc_6, 8)
	goto continue_at_1
	::continue_at_46::
	loc_2 = 0
	loc_0 = load_i32(memory_at_0, 0 + 1049868)
	if le_u32(loc_0, loc_3) then
		goto continue_at_1
	end
	loc_2 = sub_i32(loc_0, loc_3)
	store_i32(memory_at_0, 0 + 1049868, loc_2)
	loc_0 = load_i32(memory_at_0, 0 + 1049876)
	loc_7 = add_i32(loc_0, loc_3)
	store_i32(memory_at_0, 0 + 1049876, loc_7)
	store_i32(memory_at_0, loc_7 + 4, bor_i32(loc_2, 1))
	store_i32(memory_at_0, loc_0 + 4, bor_i32(loc_3, 3))
	loc_2 = add_i32(loc_0, 8)
	goto continue_at_1
	::continue_at_3::
	store_i32(memory_at_0, loc_0 + 24, loc_5)
	loc_6 = load_i32(memory_at_0, loc_7 + 16)
	if loc_6 == 0 then
		goto continue_at_77
	end
	store_i32(memory_at_0, loc_0 + 16, loc_6)
	store_i32(memory_at_0, loc_6 + 24, loc_0)
	::continue_at_77::
	loc_6 = load_i32(memory_at_0, loc_7 + 20)
	if loc_6 == 0 then
		goto continue_at_2
	end
	store_i32(memory_at_0, loc_0 + 20, loc_6)
	store_i32(memory_at_0, loc_6 + 24, loc_0)
	::continue_at_2::
	if lt_u32(loc_2, 16) then
		goto continue_at_79
	end
	store_i32(memory_at_0, loc_7 + 4, bor_i32(loc_3, 3))
	loc_0 = add_i32(loc_7, loc_3)
	store_i32(memory_at_0, loc_0 + 4, bor_i32(loc_2, 1))
	store_i32(memory_at_0, add_i32(loc_0, loc_2), loc_2)
	if lt_u32(loc_2, 256) then
		goto continue_at_80
	end
	FUNC_LIST[21](loc_0, loc_2)
	goto continue_at_78
	::continue_at_80::
	loc_3 = add_i32(band_i32(loc_2, -8), 1049592)
	loc_6 = load_i32(memory_at_0, 0 + 1049856)
	loc_2 = shl_i32(1, shr_u32(loc_2, 3))
	if band_i32(loc_6, loc_2) ~= 0 then
		goto continue_at_82
	end
	store_i32(memory_at_0, 0 + 1049856, bor_i32(loc_6, loc_2))
	loc_2 = loc_3
	goto continue_at_81
	::continue_at_82::
	loc_2 = load_i32(memory_at_0, loc_3 + 8)
	::continue_at_81::
	store_i32(memory_at_0, loc_3 + 8, loc_0)
	store_i32(memory_at_0, loc_2 + 12, loc_0)
	store_i32(memory_at_0, loc_0 + 12, loc_3)
	store_i32(memory_at_0, loc_0 + 8, loc_2)
	goto continue_at_78
	::continue_at_79::
	loc_0 = add_i32(loc_2, loc_3)
	store_i32(memory_at_0, loc_7 + 4, bor_i32(loc_0, 3))
	loc_0 = add_i32(loc_7, loc_0)
	store_i32(memory_at_0, loc_0 + 4, bor_i32(load_i32(memory_at_0, loc_0 + 4), 1))
	::continue_at_78::
	loc_2 = add_i32(loc_7, 8)
	::continue_at_1::
	GLOBAL_LIST[0].value = add_i32(loc_1, 16)
	reg_0 = loc_2
	return reg_0
end
FUNC_LIST[24] = --[[ _ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$8memalign17h0228239cb1d83097E ]] function(loc_0, loc_1)
	local loc_2 = 0
	local loc_3 = 0
	local loc_4 = 0
	local loc_5 = 0
	local loc_6 = 0
	local reg_0
	loc_2 = 0
	loc_0 = (gt_u32(loc_0, 16) and loc_0 or 16)
	if le_u32(sub_i32(-65587, loc_0), loc_1) then
		goto continue_at_1
	end
	loc_3 = (lt_u32(loc_1, 11) and 16 or band_i32(add_i32(loc_1, 11), -8))
	reg_0 = FUNC_LIST[23](add_i32(add_i32(loc_0, loc_3), 12))
	loc_1 = reg_0
	if loc_1 == 0 then
		goto continue_at_1
	end
	loc_2 = add_i32(loc_1, -8)
	loc_4 = add_i32(loc_0, -1)
	if band_i32(loc_4, loc_1) ~= 0 then
		goto continue_at_3
	end
	loc_0 = loc_2
	goto continue_at_2
	::continue_at_3::
	loc_5 = add_i32(loc_1, -4)
	loc_6 = load_i32(memory_at_0, loc_5)
	loc_1 = add_i32(band_i32(add_i32(loc_4, loc_1), sub_i32(0, loc_0)), -8)
	loc_0 = add_i32(loc_1, (gt_u32(sub_i32(loc_1, loc_2), 16) and 0 or loc_0))
	loc_1 = sub_i32(loc_0, loc_2)
	loc_4 = sub_i32(band_i32(loc_6, -8), loc_1)
	if band_i32(loc_6, 3) == 0 then
		goto continue_at_4
	end
	store_i32(memory_at_0, loc_0 + 4, bor_i32(bor_i32(loc_4, band_i32(load_i32(memory_at_0, loc_0 + 4), 1)), 2))
	loc_4 = add_i32(loc_0, loc_4)
	store_i32(memory_at_0, loc_4 + 4, bor_i32(load_i32(memory_at_0, loc_4 + 4), 1))
	store_i32(memory_at_0, loc_5, bor_i32(bor_i32(loc_1, band_i32(load_i32(memory_at_0, loc_5), 1)), 2))
	loc_4 = add_i32(loc_2, loc_1)
	store_i32(memory_at_0, loc_4 + 4, bor_i32(load_i32(memory_at_0, loc_4 + 4), 1))
	FUNC_LIST[20](loc_2, loc_1)
	goto continue_at_2
	::continue_at_4::
	loc_2 = load_i32(memory_at_0, loc_2)
	store_i32(memory_at_0, loc_0 + 4, loc_4)
	store_i32(memory_at_0, loc_0, add_i32(loc_2, loc_1))
	::continue_at_2::
	loc_1 = load_i32(memory_at_0, loc_0 + 4)
	if band_i32(loc_1, 3) == 0 then
		goto continue_at_5
	end
	loc_2 = band_i32(loc_1, -8)
	if le_u32(loc_2, add_i32(loc_3, 16)) then
		goto continue_at_5
	end
	store_i32(memory_at_0, loc_0 + 4, bor_i32(bor_i32(loc_3, band_i32(loc_1, 1)), 2))
	loc_1 = add_i32(loc_0, loc_3)
	loc_3 = sub_i32(loc_2, loc_3)
	store_i32(memory_at_0, loc_1 + 4, bor_i32(loc_3, 3))
	loc_2 = add_i32(loc_0, loc_2)
	store_i32(memory_at_0, loc_2 + 4, bor_i32(load_i32(memory_at_0, loc_2 + 4), 1))
	FUNC_LIST[20](loc_1, loc_3)
	::continue_at_5::
	loc_2 = add_i32(loc_0, 8)
	::continue_at_1::
	reg_0 = loc_2
	return reg_0
end
FUNC_LIST[25] = --[[ _ZN3std10sys_common9backtrace26__rust_end_short_backtrace17h0d4686a7fe3981a4E ]] function(loc_0)
	FUNC_LIST[26](loc_0)
	error("out of code bounds")
end
FUNC_LIST[26] = --[[ _ZN3std9panicking19begin_panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17hd496964d114e98b9E ]] function(loc_0)
	local loc_1 = 0
	local loc_2 = 0
	local loc_3 = 0
	local br_map, temp = {}, nil
	loc_1 = sub_i32(GLOBAL_LIST[0].value, 16)
	GLOBAL_LIST[0].value = loc_1
	loc_2 = load_i32(memory_at_0, loc_0)
	loc_3 = load_i32(memory_at_0, loc_2 + 12)
	if not br_map[1] then
		br_map[1] = (function()
			return { [0] = 0, 1, }
		end)()
	end
	temp = br_map[1][load_i32(memory_at_0, loc_2 + 4)] or 2
	if temp < 1 then
		goto continue_at_4
	elseif temp > 1 then
		goto continue_at_2
	else
		goto continue_at_3
	end
	::continue_at_4::
	if loc_3 ~= 0 then
		goto continue_at_2
	end
	loc_2 = 1048608
	loc_3 = 0
	goto continue_at_1
	::continue_at_3::
	if loc_3 ~= 0 then
		goto continue_at_2
	end
	loc_2 = load_i32(memory_at_0, loc_2)
	loc_3 = load_i32(memory_at_0, loc_2 + 4)
	loc_2 = load_i32(memory_at_0, loc_2)
	goto continue_at_1
	::continue_at_2::
	store_i32(memory_at_0, loc_1 + 12, loc_2)
	store_i32(memory_at_0, loc_1, -2147483648)
	loc_2 = load_i32(memory_at_0, loc_0 + 4)
	FUNC_LIST[36](loc_1, 1048988, load_i32(memory_at_0, loc_2 + 8), load_i32(memory_at_0, loc_0 + 8), load_i32_u8(memory_at_0, loc_2 + 16), load_i32_u8(memory_at_0, loc_2 + 17))
	error("out of code bounds")
	::continue_at_1::
	store_i32(memory_at_0, loc_1 + 4, loc_3)
	store_i32(memory_at_0, loc_1, loc_2)
	loc_2 = load_i32(memory_at_0, loc_0 + 4)
	FUNC_LIST[36](loc_1, 1048968, load_i32(memory_at_0, loc_2 + 8), load_i32(memory_at_0, loc_0 + 8), load_i32_u8(memory_at_0, loc_2 + 16), load_i32_u8(memory_at_0, loc_2 + 17))
	error("out of code bounds")
end
FUNC_LIST[27] = --[[ _ZN3std5alloc24default_alloc_error_hook17hbf3c582fe46a50aeE ]] function(loc_0, loc_1)
	local loc_2 = 0
	loc_2 = sub_i32(GLOBAL_LIST[0].value, 48)
	GLOBAL_LIST[0].value = loc_2
	if load_i32_u8(memory_at_0, 0 + 1049424) == 0 then
		goto continue_at_1
	end
	store_i32(memory_at_0, loc_2 + 16, 2)
	store_i32(memory_at_0, loc_2 + 12, 1048836)
	store_i64(memory_at_0, loc_2 + 24, 1LL)
	store_i32(memory_at_0, loc_2 + 40, 1)
	store_i32(memory_at_0, loc_2 + 44, loc_1)
	store_i32(memory_at_0, loc_2 + 20, add_i32(loc_2, 36))
	store_i32(memory_at_0, loc_2 + 36, add_i32(loc_2, 44))
	FUNC_LIST[45](add_i32(loc_2, 12), 1048876)
	error("out of code bounds")
	::continue_at_1::
	GLOBAL_LIST[0].value = add_i32(loc_2, 48)
end
FUNC_LIST[28] = --[[ __rdl_alloc ]] function(loc_0, loc_1)
	local reg_0
	if lt_u32(loc_1, 9) then
		goto continue_at_1
	end
	reg_0 = FUNC_LIST[24](loc_1, loc_0)
	goto continue_at_0
	::continue_at_1::
	reg_0 = FUNC_LIST[23](loc_0)
	::continue_at_0::
	return reg_0
end
FUNC_LIST[29] = --[[ __rdl_dealloc ]] function(loc_0, loc_1, loc_2)
	local loc_3 = 0
	local loc_4 = 0
	loc_3 = load_i32(memory_at_0, add_i32(loc_0, -4))
	loc_4 = band_i32(loc_3, -8)
	loc_3 = band_i32(loc_3, 3)
	if lt_u32(loc_4, add_i32((loc_3 ~= 0 and 4 or 8), loc_1)) then
		goto continue_at_2
	end
	if loc_3 == 0 then
		goto continue_at_3
	end
	if gt_u32(loc_4, add_i32(loc_1, 39)) then
		goto continue_at_1
	end
	::continue_at_3::
	FUNC_LIST[22](loc_0)
	goto continue_at_0
	::continue_at_2::
	FUNC_LIST[47](1048673, 46, 1048720)
	error("out of code bounds")
	::continue_at_1::
	FUNC_LIST[47](1048736, 46, 1048784)
	error("out of code bounds")
	::continue_at_0::
end
FUNC_LIST[30] = --[[ __rdl_realloc ]] function(loc_0, loc_1, loc_2, loc_3)
	local loc_4 = 0
	local loc_5 = 0
	local loc_6 = 0
	local loc_7 = 0
	local loc_8 = 0
	local loc_9 = 0
	local reg_0
	loc_4 = add_i32(loc_0, -4)
	loc_5 = load_i32(memory_at_0, loc_4)
	loc_6 = band_i32(loc_5, -8)
	loc_7 = band_i32(loc_5, 3)
	if lt_u32(loc_6, add_i32((loc_7 ~= 0 and 4 or 8), loc_1)) then
		goto continue_at_5
	end
	loc_8 = add_i32(loc_1, 39)
	if loc_7 == 0 then
		goto continue_at_6
	end
	if gt_u32(loc_6, loc_8) then
		goto continue_at_4
	end
	::continue_at_6::
	if lt_u32(loc_2, 9) then
		goto continue_at_9
	end
	reg_0 = FUNC_LIST[24](loc_2, loc_3)
	loc_2 = reg_0
	if loc_2 ~= 0 then
		goto continue_at_8
	end
	reg_0 = 0
	goto continue_at_0
	::continue_at_9::
	loc_2 = 0
	if gt_u32(loc_3, -65588) then
		goto continue_at_7
	end
	loc_1 = (lt_u32(loc_3, 11) and 16 or band_i32(add_i32(loc_3, 11), -8))
	if loc_7 ~= 0 then
		goto continue_at_11
	end
	if lt_u32(loc_1, 256) then
		goto continue_at_10
	end
	if lt_u32(loc_6, bor_i32(loc_1, 4)) then
		goto continue_at_10
	end
	if ge_u32(sub_i32(loc_6, loc_1), 131073) then
		goto continue_at_10
	end
	reg_0 = loc_0
	goto continue_at_0
	::continue_at_11::
	loc_8 = add_i32(loc_0, -8)
	loc_7 = add_i32(loc_8, loc_6)
	if ge_u32(loc_6, loc_1) then
		goto continue_at_16
	end
	if loc_7 == load_i32(memory_at_0, 0 + 1049876) then
		goto continue_at_12
	end
	if loc_7 == load_i32(memory_at_0, 0 + 1049872) then
		goto continue_at_14
	end
	loc_5 = load_i32(memory_at_0, loc_7 + 4)
	if band_i32(loc_5, 2) ~= 0 then
		goto continue_at_10
	end
	loc_9 = band_i32(loc_5, -8)
	loc_5 = add_i32(loc_9, loc_6)
	if lt_u32(loc_5, loc_1) then
		goto continue_at_10
	end
	FUNC_LIST[19](loc_7, loc_9)
	loc_3 = sub_i32(loc_5, loc_1)
	if lt_u32(loc_3, 16) then
		goto continue_at_15
	end
	store_i32(memory_at_0, loc_4, bor_i32(bor_i32(loc_1, band_i32(load_i32(memory_at_0, loc_4), 1)), 2))
	loc_1 = add_i32(loc_8, loc_1)
	store_i32(memory_at_0, loc_1 + 4, bor_i32(loc_3, 3))
	loc_2 = add_i32(loc_8, loc_5)
	store_i32(memory_at_0, loc_2 + 4, bor_i32(load_i32(memory_at_0, loc_2 + 4), 1))
	FUNC_LIST[20](loc_1, loc_3)
	reg_0 = loc_0
	goto continue_at_0
	::continue_at_16::
	loc_3 = sub_i32(loc_6, loc_1)
	if gt_u32(loc_3, 15) then
		goto continue_at_13
	end
	reg_0 = loc_0
	goto continue_at_0
	::continue_at_15::
	store_i32(memory_at_0, loc_4, bor_i32(bor_i32(loc_5, band_i32(load_i32(memory_at_0, loc_4), 1)), 2))
	loc_1 = add_i32(loc_8, loc_5)
	store_i32(memory_at_0, loc_1 + 4, bor_i32(load_i32(memory_at_0, loc_1 + 4), 1))
	reg_0 = loc_0
	goto continue_at_0
	::continue_at_14::
	loc_7 = add_i32(load_i32(memory_at_0, 0 + 1049864), loc_6)
	if lt_u32(loc_7, loc_1) then
		goto continue_at_10
	end
	loc_3 = sub_i32(loc_7, loc_1)
	if gt_u32(loc_3, 15) then
		goto continue_at_18
	end
	store_i32(memory_at_0, loc_4, bor_i32(bor_i32(band_i32(loc_5, 1), loc_7), 2))
	loc_1 = add_i32(loc_8, loc_7)
	store_i32(memory_at_0, loc_1 + 4, bor_i32(load_i32(memory_at_0, loc_1 + 4), 1))
	loc_3 = 0
	loc_1 = 0
	goto continue_at_17
	::continue_at_18::
	store_i32(memory_at_0, loc_4, bor_i32(bor_i32(loc_1, band_i32(loc_5, 1)), 2))
	loc_1 = add_i32(loc_8, loc_1)
	store_i32(memory_at_0, loc_1 + 4, bor_i32(loc_3, 1))
	loc_2 = add_i32(loc_8, loc_7)
	store_i32(memory_at_0, loc_2, loc_3)
	store_i32(memory_at_0, loc_2 + 4, band_i32(load_i32(memory_at_0, loc_2 + 4), -2))
	::continue_at_17::
	store_i32(memory_at_0, 0 + 1049872, loc_1)
	store_i32(memory_at_0, 0 + 1049864, loc_3)
	reg_0 = loc_0
	goto continue_at_0
	::continue_at_13::
	store_i32(memory_at_0, loc_4, bor_i32(bor_i32(loc_1, band_i32(loc_5, 1)), 2))
	loc_1 = add_i32(loc_8, loc_1)
	store_i32(memory_at_0, loc_1 + 4, bor_i32(loc_3, 3))
	store_i32(memory_at_0, loc_7 + 4, bor_i32(load_i32(memory_at_0, loc_7 + 4), 1))
	FUNC_LIST[20](loc_1, loc_3)
	reg_0 = loc_0
	goto continue_at_0
	::continue_at_12::
	loc_7 = add_i32(load_i32(memory_at_0, 0 + 1049868), loc_6)
	if gt_u32(loc_7, loc_1) then
		goto continue_at_1
	end
	::continue_at_10::
	reg_0 = FUNC_LIST[23](loc_3)
	loc_1 = reg_0
	if loc_1 == 0 then
		goto continue_at_7
	end
	loc_2 = load_i32(memory_at_0, loc_4)
	loc_2 = add_i32((band_i32(loc_2, 3) ~= 0 and -4 or -8), band_i32(loc_2, -8))
	reg_0 = FUNC_LIST[57](loc_1, loc_0, (lt_u32(loc_2, loc_3) and loc_2 or loc_3))
	loc_1 = reg_0
	FUNC_LIST[22](loc_0)
	reg_0 = loc_1
	goto continue_at_0
	::continue_at_8::
	reg_0 = FUNC_LIST[57](loc_2, loc_0, (lt_u32(loc_1, loc_3) and loc_1 or loc_3))
	loc_3 = load_i32(memory_at_0, loc_4)
	loc_7 = band_i32(loc_3, -8)
	loc_3 = band_i32(loc_3, 3)
	if lt_u32(loc_7, add_i32((loc_3 ~= 0 and 4 or 8), loc_1)) then
		goto continue_at_3
	end
	if loc_3 == 0 then
		goto continue_at_19
	end
	if gt_u32(loc_7, loc_8) then
		goto continue_at_2
	end
	::continue_at_19::
	FUNC_LIST[22](loc_0)
	::continue_at_7::
	reg_0 = loc_2
	goto continue_at_0
	::continue_at_5::
	FUNC_LIST[47](1048673, 46, 1048720)
	error("out of code bounds")
	::continue_at_4::
	FUNC_LIST[47](1048736, 46, 1048784)
	error("out of code bounds")
	::continue_at_3::
	FUNC_LIST[47](1048673, 46, 1048720)
	error("out of code bounds")
	::continue_at_2::
	FUNC_LIST[47](1048736, 46, 1048784)
	error("out of code bounds")
	::continue_at_1::
	store_i32(memory_at_0, loc_4, bor_i32(bor_i32(loc_1, band_i32(loc_5, 1)), 2))
	loc_3 = add_i32(loc_8, loc_1)
	loc_1 = sub_i32(loc_7, loc_1)
	store_i32(memory_at_0, loc_3 + 4, bor_i32(loc_1, 1))
	store_i32(memory_at_0, 0 + 1049868, loc_1)
	store_i32(memory_at_0, 0 + 1049876, loc_3)
	reg_0 = loc_0
	::continue_at_0::
	return reg_0
end
FUNC_LIST[31] = --[[ rust_begin_unwind ]] function(loc_0)
	local loc_1 = 0
	local loc_2 = 0
	loc_1 = sub_i32(GLOBAL_LIST[0].value, 16)
	GLOBAL_LIST[0].value = loc_1
	loc_2 = load_i32(memory_at_0, loc_0 + 8)
	if loc_2 ~= 0 then
		goto continue_at_1
	end
	FUNC_LIST[51](1048920)
	error("out of code bounds")
	::continue_at_1::
	store_i32(memory_at_0, loc_1 + 12, load_i32(memory_at_0, loc_0 + 12))
	store_i32(memory_at_0, loc_1 + 8, loc_0)
	store_i32(memory_at_0, loc_1 + 4, loc_2)
	FUNC_LIST[25](add_i32(loc_1, 4))
	error("out of code bounds")
end
FUNC_LIST[32] = --[[ _ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17h88c98c245a43662aE ]] function(loc_0, loc_1)
	local loc_2 = 0
	local loc_3 = 0
	local loc_4 = 0
	local loc_5 = 0LL
	local reg_0
	loc_2 = sub_i32(GLOBAL_LIST[0].value, 48)
	GLOBAL_LIST[0].value = loc_2
	if load_i32(memory_at_0, loc_1) ~= -2147483648 then
		goto continue_at_1
	end
	loc_3 = load_i32(memory_at_0, loc_1 + 12)
	loc_4 = add_i32(add_i32(loc_2, 36), 8)
	store_i32(memory_at_0, loc_4, 0)
	store_i64(memory_at_0, loc_2 + 36, 4294967296LL)
	reg_0 = FUNC_LIST[49](add_i32(loc_2, 36), 1048608, loc_3)
	loc_3 = load_i32(memory_at_0, loc_4)
	store_i32(memory_at_0, add_i32(add_i32(loc_2, 24), 8), loc_3)
	loc_5 = load_i64(memory_at_0, loc_2 + 36)
	store_i64(memory_at_0, loc_2 + 24, loc_5)
	store_i32(memory_at_0, add_i32(loc_1, 8), loc_3)
	store_i64(memory_at_0, loc_1, loc_5)
	::continue_at_1::
	loc_5 = load_i64(memory_at_0, loc_1)
	store_i64(memory_at_0, loc_1, 4294967296LL)
	loc_3 = add_i32(add_i32(loc_2, 8), 8)
	loc_1 = add_i32(loc_1, 8)
	store_i32(memory_at_0, loc_3, load_i32(memory_at_0, loc_1))
	store_i32(memory_at_0, loc_1, 0)
	store_i64(memory_at_0, loc_2 + 8, loc_5)
	reg_0 = FUNC_LIST[2](12, 4)
	loc_1 = reg_0
	if loc_1 ~= 0 then
		goto continue_at_2
	end
	FUNC_LIST[42](4, 12)
	error("out of code bounds")
	::continue_at_2::
	store_i64(memory_at_0, loc_1, load_i64(memory_at_0, loc_2 + 8))
	store_i32(memory_at_0, add_i32(loc_1, 8), load_i32(memory_at_0, loc_3))
	store_i32(memory_at_0, loc_0 + 4, 1048936)
	store_i32(memory_at_0, loc_0, loc_1)
	GLOBAL_LIST[0].value = add_i32(loc_2, 48)
end
FUNC_LIST[33] = --[[ _ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17h3085c1ca651773afE ]] function(loc_0, loc_1)
	local loc_2 = 0
	local loc_3 = 0
	local loc_4 = 0
	local loc_5 = 0LL
	local reg_0
	loc_2 = sub_i32(GLOBAL_LIST[0].value, 32)
	GLOBAL_LIST[0].value = loc_2
	if load_i32(memory_at_0, loc_1) ~= -2147483648 then
		goto continue_at_1
	end
	loc_3 = load_i32(memory_at_0, loc_1 + 12)
	loc_4 = add_i32(add_i32(loc_2, 20), 8)
	store_i32(memory_at_0, loc_4, 0)
	store_i64(memory_at_0, loc_2 + 20, 4294967296LL)
	reg_0 = FUNC_LIST[49](add_i32(loc_2, 20), 1048608, loc_3)
	loc_3 = load_i32(memory_at_0, loc_4)
	store_i32(memory_at_0, add_i32(add_i32(loc_2, 8), 8), loc_3)
	loc_5 = load_i64(memory_at_0, loc_2 + 20)
	store_i64(memory_at_0, loc_2 + 8, loc_5)
	store_i32(memory_at_0, add_i32(loc_1, 8), loc_3)
	store_i64(memory_at_0, loc_1, loc_5)
	::continue_at_1::
	store_i32(memory_at_0, loc_0 + 4, 1048936)
	store_i32(memory_at_0, loc_0, loc_1)
	GLOBAL_LIST[0].value = add_i32(loc_2, 32)
end
FUNC_LIST[34] = --[[ _ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17hb580fe12f82e5214E ]] function(loc_0, loc_1)
	local loc_2 = 0
	local loc_3 = 0
	local reg_0
	loc_2 = load_i32(memory_at_0, loc_1 + 4)
	loc_3 = load_i32(memory_at_0, loc_1)
	reg_0 = FUNC_LIST[2](8, 4)
	loc_1 = reg_0
	if loc_1 ~= 0 then
		goto continue_at_1
	end
	FUNC_LIST[42](4, 8)
	error("out of code bounds")
	::continue_at_1::
	store_i32(memory_at_0, loc_1 + 4, loc_2)
	store_i32(memory_at_0, loc_1, loc_3)
	store_i32(memory_at_0, loc_0 + 4, 1048952)
	store_i32(memory_at_0, loc_0, loc_1)
end
FUNC_LIST[35] = --[[ _ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17hf733fa32d221b1c7E ]] function(loc_0, loc_1)
	store_i32(memory_at_0, loc_0 + 4, 1048952)
	store_i32(memory_at_0, loc_0, loc_1)
end
FUNC_LIST[36] = --[[ _ZN3std9panicking20rust_panic_with_hook17h32c80a64fe4de396E ]] function(loc_0, loc_1, loc_2, loc_3, loc_4, loc_5)
	local loc_6 = 0
	local loc_7 = 0
	loc_6 = sub_i32(GLOBAL_LIST[0].value, 32)
	GLOBAL_LIST[0].value = loc_6
	loc_7 = load_i32(memory_at_0, 0 + 1049444)
	store_i32(memory_at_0, 0 + 1049444, add_i32(loc_7, 1))
	if loc_7 < 0 then
		goto continue_at_2
	end
	if band_i32(load_i32_u8(memory_at_0, 0 + 1049904), 255) ~= 0 then
		goto continue_at_2
	end
	store_i32_n8(memory_at_0, 0 + 1049904, 1)
	store_i32(memory_at_0, 0 + 1049900, add_i32(load_i32(memory_at_0, 0 + 1049900), 1))
	store_i32_n8(memory_at_0, loc_6 + 29, loc_5)
	store_i32_n8(memory_at_0, loc_6 + 28, loc_4)
	store_i32(memory_at_0, loc_6 + 24, loc_3)
	store_i32(memory_at_0, loc_6 + 20, loc_2)
	store_i32(memory_at_0, loc_6 + 16, 1049008)
	store_i32(memory_at_0, loc_6 + 12, 1048608)
	loc_7 = load_i32(memory_at_0, 0 + 1049432)
	if loc_7 <= -1 then
		goto continue_at_2
	end
	store_i32(memory_at_0, 0 + 1049432, add_i32(loc_7, 1))
	if load_i32(memory_at_0, 0 + 1049436) == 0 then
		goto continue_at_3
	end
	TABLE_LIST[0].data[load_i32(memory_at_0, loc_1 + 16)](loc_6, loc_0)
	store_i64(memory_at_0, loc_6 + 12, load_i64(memory_at_0, loc_6))
	TABLE_LIST[0].data[load_i32(memory_at_0, load_i32(memory_at_0, 0 + 1049440) + 20)](load_i32(memory_at_0, 0 + 1049436), add_i32(loc_6, 12))
	loc_7 = add_i32(load_i32(memory_at_0, 0 + 1049432), -1)
	::continue_at_3::
	store_i32(memory_at_0, 0 + 1049432, loc_7)
	store_i32_n8(memory_at_0, 0 + 1049904, 0)
	if loc_4 ~= 0 then
		goto continue_at_1
	end
	::continue_at_2::
	error("out of code bounds")
	::continue_at_1::
	FUNC_LIST[37](loc_0, loc_1)
	error("out of code bounds")
end
FUNC_LIST[37] = --[[ rust_panic ]] function(loc_0, loc_1)
	local reg_0
	reg_0 = FUNC_LIST[39](loc_0, loc_1)
	error("out of code bounds")
end
FUNC_LIST[38] = --[[ __rg_oom ]] function(loc_0, loc_1)
	local loc_2 = 0
	loc_2 = load_i32(memory_at_0, 0 + 1049428)
	TABLE_LIST[0].data[(loc_2 ~= 0 and loc_2 or 2)](loc_1, loc_0)
	error("out of code bounds")
end
FUNC_LIST[39] = --[[ __rust_start_panic ]] function(loc_0, loc_1)
	error("out of code bounds")
	return reg_spill[1]
end
FUNC_LIST[40] = --[[ _ZN61_$LT$dlmalloc..sys..System$u20$as$u20$dlmalloc..Allocator$GT$5alloc17hb3c341a855a9cf1cE ]] function(loc_0, loc_1, loc_2)
	local loc_3 = 0
	local reg_0
	local reg_1
	local reg_2
	reg_0 = rt.allocator.grow(memory_at_0, shr_u32(loc_2, 16))
	loc_3 = reg_0
	store_i32(memory_at_0, loc_0 + 8, 0)
	reg_2 = band_i32(loc_2, -65536)
	loc_2 = (loc_3 == -1 and 1 or 0)
	store_i32(memory_at_0, loc_0 + 4, (loc_2 ~= 0 and 0 or reg_2))
	store_i32(memory_at_0, loc_0, (loc_2 ~= 0 and 0 or shl_i32(loc_3, 16)))
end
FUNC_LIST[41] = --[[ _ZN5alloc7raw_vec17capacity_overflow17h4b860f23af004aeaE ]] function()
	local loc_0 = 0
	loc_0 = sub_i32(GLOBAL_LIST[0].value, 32)
	GLOBAL_LIST[0].value = loc_0
	store_i32(memory_at_0, loc_0 + 12, 1)
	store_i32(memory_at_0, loc_0 + 8, 1049044)
	store_i64(memory_at_0, loc_0 + 20, 0LL)
	store_i32(memory_at_0, loc_0 + 16, 1049024)
	FUNC_LIST[45](add_i32(loc_0, 8), 1049080)
	error("out of code bounds")
end
FUNC_LIST[42] = --[[ _ZN5alloc5alloc18handle_alloc_error17hfe87458dab42fa9dE ]] function(loc_0, loc_1)
	FUNC_LIST[5](loc_1, loc_0)
	error("out of code bounds")
end
FUNC_LIST[43] = --[[ _ZN4core3ops8function6FnOnce9call_once17heaf558fe3ceb703bE ]] function(loc_0, loc_1)
	local reg_0
	::continue_at_1::
	while true do
		goto continue_at_1
	end
	return reg_0
end
FUNC_LIST[44] = --[[ _ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17heac5c393b5b08d77E ]] function(loc_0)
end
FUNC_LIST[45] = --[[ _ZN4core9panicking9panic_fmt17hc7427f902a13f1a9E ]] function(loc_0, loc_1)
	local loc_2 = 0
	loc_2 = sub_i32(GLOBAL_LIST[0].value, 32)
	GLOBAL_LIST[0].value = loc_2
	store_i32_n16(memory_at_0, loc_2 + 28, 1)
	store_i32(memory_at_0, loc_2 + 24, loc_1)
	store_i32(memory_at_0, loc_2 + 20, loc_0)
	store_i32(memory_at_0, loc_2 + 16, 1049140)
	store_i32(memory_at_0, loc_2 + 12, 1049096)
	FUNC_LIST[31](add_i32(loc_2, 12))
	error("out of code bounds")
end
FUNC_LIST[46] = --[[ _ZN4core9panicking18panic_bounds_check17h0880207052ec715aE ]] function(loc_0, loc_1, loc_2)
	local loc_3 = 0
	loc_3 = sub_i32(GLOBAL_LIST[0].value, 48)
	GLOBAL_LIST[0].value = loc_3
	store_i32(memory_at_0, loc_3 + 4, loc_1)
	store_i32(memory_at_0, loc_3, loc_0)
	store_i32(memory_at_0, add_i32(loc_3, 44), 1)
	store_i32(memory_at_0, loc_3 + 12, 2)
	store_i32(memory_at_0, loc_3 + 8, 1049208)
	store_i64(memory_at_0, loc_3 + 20, 2LL)
	store_i32(memory_at_0, loc_3 + 36, 1)
	store_i32(memory_at_0, loc_3 + 16, add_i32(loc_3, 32))
	store_i32(memory_at_0, loc_3 + 40, loc_3)
	store_i32(memory_at_0, loc_3 + 32, add_i32(loc_3, 4))
	FUNC_LIST[45](add_i32(loc_3, 8), loc_2)
	error("out of code bounds")
end
FUNC_LIST[47] = --[[ _ZN4core9panicking5panic17hb157b525de3fe68dE ]] function(loc_0, loc_1, loc_2)
	local loc_3 = 0
	loc_3 = sub_i32(GLOBAL_LIST[0].value, 32)
	GLOBAL_LIST[0].value = loc_3
	store_i32(memory_at_0, loc_3 + 4, 1)
	store_i64(memory_at_0, loc_3 + 12, 0LL)
	store_i32(memory_at_0, loc_3 + 8, 1049096)
	store_i32(memory_at_0, loc_3 + 28, loc_1)
	store_i32(memory_at_0, loc_3 + 24, loc_0)
	store_i32(memory_at_0, loc_3, add_i32(loc_3, 24))
	FUNC_LIST[45](loc_3, loc_2)
	error("out of code bounds")
end
FUNC_LIST[48] = --[[ _ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h70268e3615e3ec29E ]] function(loc_0, loc_1)
	local reg_0
	reg_0 = FUNC_LIST[55](load_i64_u32(memory_at_0, loc_0), 1, loc_1)
	return reg_0
end
FUNC_LIST[49] = --[[ _ZN4core3fmt5write17hdf060125a23f37a7E ]] function(loc_0, loc_1, loc_2)
	local loc_3 = 0
	local loc_4 = 0
	local loc_5 = 0
	local loc_6 = 0
	local loc_7 = 0
	local loc_8 = 0
	local loc_9 = 0
	local loc_10 = 0
	local loc_11 = 0
	local loc_12 = 0
	local reg_0
	local br_map, temp = {}, nil
	loc_3 = sub_i32(GLOBAL_LIST[0].value, 48)
	GLOBAL_LIST[0].value = loc_3
	store_i32_n8(memory_at_0, loc_3 + 44, 3)
	store_i32(memory_at_0, loc_3 + 28, 32)
	loc_4 = 0
	store_i32(memory_at_0, loc_3 + 40, 0)
	store_i32(memory_at_0, loc_3 + 36, loc_1)
	store_i32(memory_at_0, loc_3 + 32, loc_0)
	store_i32(memory_at_0, loc_3 + 20, 0)
	store_i32(memory_at_0, loc_3 + 12, 0)
	loc_5 = load_i32(memory_at_0, loc_2 + 16)
	if loc_5 ~= 0 then
		goto continue_at_5
	end
	loc_0 = load_i32(memory_at_0, loc_2 + 12)
	if loc_0 == 0 then
		goto continue_at_4
	end
	loc_1 = load_i32(memory_at_0, loc_2 + 8)
	loc_6 = shl_i32(loc_0, 3)
	loc_4 = add_i32(band_i32(add_i32(loc_0, -1), 536870911), 1)
	loc_0 = load_i32(memory_at_0, loc_2)
	::continue_at_6::
	while true do
		loc_7 = load_i32(memory_at_0, add_i32(loc_0, 4))
		if loc_7 == 0 then
			goto continue_at_7
		end
		reg_0 = TABLE_LIST[0].data[load_i32(memory_at_0, load_i32(memory_at_0, loc_3 + 36) + 12)](load_i32(memory_at_0, loc_3 + 32), load_i32(memory_at_0, loc_0), loc_7)
		if reg_0 ~= 0 then
			goto continue_at_3
		end
		::continue_at_7::
		reg_0 = TABLE_LIST[0].data[load_i32(memory_at_0, loc_1 + 4)](load_i32(memory_at_0, loc_1), add_i32(loc_3, 12))
		if reg_0 ~= 0 then
			goto continue_at_3
		end
		loc_1 = add_i32(loc_1, 8)
		loc_0 = add_i32(loc_0, 8)
		loc_6 = add_i32(loc_6, -8)
		if loc_6 ~= 0 then
			goto continue_at_6
		end
		goto continue_at_4
	end
	::continue_at_5::
	loc_1 = load_i32(memory_at_0, loc_2 + 20)
	if loc_1 == 0 then
		goto continue_at_4
	end
	loc_8 = shl_i32(loc_1, 5)
	loc_4 = add_i32(band_i32(add_i32(loc_1, -1), 134217727), 1)
	loc_9 = load_i32(memory_at_0, loc_2 + 8)
	loc_0 = load_i32(memory_at_0, loc_2)
	loc_6 = 0
	::continue_at_8::
	while true do
		loc_1 = load_i32(memory_at_0, add_i32(loc_0, 4))
		if loc_1 == 0 then
			goto continue_at_9
		end
		reg_0 = TABLE_LIST[0].data[load_i32(memory_at_0, load_i32(memory_at_0, loc_3 + 36) + 12)](load_i32(memory_at_0, loc_3 + 32), load_i32(memory_at_0, loc_0), loc_1)
		if reg_0 ~= 0 then
			goto continue_at_3
		end
		::continue_at_9::
		loc_1 = add_i32(loc_5, loc_6)
		store_i32(memory_at_0, loc_3 + 28, load_i32(memory_at_0, add_i32(loc_1, 16)))
		store_i32_n8(memory_at_0, loc_3 + 44, load_i32_u8(memory_at_0, add_i32(loc_1, 28)))
		store_i32(memory_at_0, loc_3 + 40, load_i32(memory_at_0, add_i32(loc_1, 24)))
		loc_7 = load_i32(memory_at_0, add_i32(loc_1, 12))
		loc_10 = 0
		loc_11 = 0
		if not br_map[1] then
			br_map[1] = (function()
				return { [0] = 1, 0, 2, }
			end)()
		end
		temp = br_map[1][load_i32(memory_at_0, add_i32(loc_1, 8))] or 1
		if temp < 1 then
			goto continue_at_12
		elseif temp > 1 then
			goto continue_at_10
		else
			goto continue_at_11
		end
		::continue_at_12::
		loc_12 = shl_i32(loc_7, 3)
		loc_11 = 0
		loc_12 = add_i32(loc_9, loc_12)
		if load_i32(memory_at_0, loc_12 + 4) ~= 17 then
			goto continue_at_10
		end
		loc_7 = load_i32(memory_at_0, load_i32(memory_at_0, loc_12))
		::continue_at_11::
		loc_11 = 1
		::continue_at_10::
		store_i32(memory_at_0, loc_3 + 16, loc_7)
		store_i32(memory_at_0, loc_3 + 12, loc_11)
		loc_7 = load_i32(memory_at_0, add_i32(loc_1, 4))
		if not br_map[2] then
			br_map[2] = (function()
				return { [0] = 1, 0, 2, }
			end)()
		end
		temp = br_map[2][load_i32(memory_at_0, loc_1)] or 1
		if temp < 1 then
			goto continue_at_15
		elseif temp > 1 then
			goto continue_at_13
		else
			goto continue_at_14
		end
		::continue_at_15::
		loc_11 = shl_i32(loc_7, 3)
		loc_11 = add_i32(loc_9, loc_11)
		if load_i32(memory_at_0, loc_11 + 4) ~= 17 then
			goto continue_at_13
		end
		loc_7 = load_i32(memory_at_0, load_i32(memory_at_0, loc_11))
		::continue_at_14::
		loc_10 = 1
		::continue_at_13::
		store_i32(memory_at_0, loc_3 + 24, loc_7)
		store_i32(memory_at_0, loc_3 + 20, loc_10)
		loc_1 = add_i32(loc_9, shl_i32(load_i32(memory_at_0, add_i32(loc_1, 20)), 3))
		reg_0 = TABLE_LIST[0].data[load_i32(memory_at_0, loc_1 + 4)](load_i32(memory_at_0, loc_1), add_i32(loc_3, 12))
		if reg_0 ~= 0 then
			goto continue_at_3
		end
		loc_0 = add_i32(loc_0, 8)
		loc_6 = add_i32(loc_6, 32)
		if loc_8 ~= loc_6 then
			goto continue_at_8
		end
		break
	end
	::continue_at_4::
	if ge_u32(loc_4, load_i32(memory_at_0, loc_2 + 4)) then
		goto continue_at_2
	end
	loc_1 = add_i32(load_i32(memory_at_0, loc_2), shl_i32(loc_4, 3))
	reg_0 = TABLE_LIST[0].data[load_i32(memory_at_0, load_i32(memory_at_0, loc_3 + 36) + 12)](load_i32(memory_at_0, loc_3 + 32), load_i32(memory_at_0, loc_1), load_i32(memory_at_0, loc_1 + 4))
	if reg_0 == 0 then
		goto continue_at_2
	end
	::continue_at_3::
	loc_1 = 1
	goto continue_at_1
	::continue_at_2::
	loc_1 = 0
	::continue_at_1::
	GLOBAL_LIST[0].value = add_i32(loc_3, 48)
	reg_0 = loc_1
	return reg_0
end
FUNC_LIST[50] = --[[ _ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h0d548fa5db020ac4E ]] function(loc_0, loc_1)
	store_i64(memory_at_0, loc_0 + 8, 4363014821963114893LL)
	store_i64(memory_at_0, loc_0, -354935419601612971LL)
end
FUNC_LIST[51] = --[[ _ZN4core6option13unwrap_failed17hb5bacfb0dd292085E ]] function(loc_0)
	FUNC_LIST[47](1049096, 43, loc_0)
	error("out of code bounds")
end
FUNC_LIST[52] = --[[ _ZN4core3fmt9Formatter12pad_integral17h30e85005abd9cc2aE ]] function(loc_0, loc_1, loc_2, loc_3, loc_4, loc_5)
	local loc_6 = 0
	local loc_7 = 0
	local loc_8 = 0
	local loc_9 = 0
	local loc_10 = 0
	local loc_11 = 0
	local loc_12 = 0
	local reg_0
	local br_map, temp = {}, nil
	if loc_1 ~= 0 then
		goto continue_at_2
	end
	loc_6 = add_i32(loc_5, 1)
	loc_7 = load_i32(memory_at_0, loc_0 + 28)
	loc_8 = 45
	goto continue_at_1
	::continue_at_2::
	loc_7 = load_i32(memory_at_0, loc_0 + 28)
	loc_1 = band_i32(loc_7, 1)
	loc_8 = (loc_1 ~= 0 and 43 or 1114112)
	loc_6 = add_i32(loc_1, loc_5)
	::continue_at_1::
	if band_i32(loc_7, 4) ~= 0 then
		goto continue_at_4
	end
	loc_2 = 0
	goto continue_at_3
	::continue_at_4::
	if lt_u32(loc_3, 16) then
		goto continue_at_6
	end
	reg_0 = FUNC_LIST[53](loc_2, loc_3)
	loc_1 = reg_0
	goto continue_at_5
	::continue_at_6::
	if loc_3 ~= 0 then
		goto continue_at_7
	end
	loc_1 = 0
	goto continue_at_5
	::continue_at_7::
	loc_9 = band_i32(loc_3, 3)
	if ge_u32(loc_3, 4) then
		goto continue_at_9
	end
	loc_1 = 0
	loc_10 = 0
	goto continue_at_8
	::continue_at_9::
	loc_11 = band_i32(loc_3, 12)
	loc_1 = 0
	loc_10 = 0
	::continue_at_10::
	while true do
		loc_12 = add_i32(loc_2, loc_10)
		loc_1 = add_i32(add_i32(add_i32(add_i32(loc_1, (load_i32_i8(memory_at_0, loc_12) > -65 and 1 or 0)), (load_i32_i8(memory_at_0, add_i32(loc_12, 1)) > -65 and 1 or 0)), (load_i32_i8(memory_at_0, add_i32(loc_12, 2)) > -65 and 1 or 0)), (load_i32_i8(memory_at_0, add_i32(loc_12, 3)) > -65 and 1 or 0))
		loc_10 = add_i32(loc_10, 4)
		if loc_11 ~= loc_10 then
			goto continue_at_10
		end
		break
	end
	::continue_at_8::
	if loc_9 == 0 then
		goto continue_at_5
	end
	loc_12 = add_i32(loc_2, loc_10)
	::continue_at_11::
	while true do
		loc_1 = add_i32(loc_1, (load_i32_i8(memory_at_0, loc_12) > -65 and 1 or 0))
		loc_12 = add_i32(loc_12, 1)
		loc_9 = add_i32(loc_9, -1)
		if loc_9 ~= 0 then
			goto continue_at_11
		end
		break
	end
	::continue_at_5::
	loc_6 = add_i32(loc_1, loc_6)
	::continue_at_3::
	if load_i32(memory_at_0, loc_0) ~= 0 then
		goto continue_at_13
	end
	loc_1 = 1
	loc_12 = load_i32(memory_at_0, loc_0 + 20)
	loc_10 = load_i32(memory_at_0, loc_0 + 24)
	reg_0 = FUNC_LIST[54](loc_12, loc_10, loc_8, loc_2, loc_3)
	if reg_0 ~= 0 then
		goto continue_at_12
	end
	reg_0 = TABLE_LIST[0].data[load_i32(memory_at_0, loc_10 + 12)](loc_12, loc_4, loc_5)
	goto continue_at_0
	::continue_at_13::
	loc_9 = load_i32(memory_at_0, loc_0 + 4)
	if gt_u32(loc_9, loc_6) then
		goto continue_at_14
	end
	loc_1 = 1
	loc_12 = load_i32(memory_at_0, loc_0 + 20)
	loc_10 = load_i32(memory_at_0, loc_0 + 24)
	reg_0 = FUNC_LIST[54](loc_12, loc_10, loc_8, loc_2, loc_3)
	if reg_0 ~= 0 then
		goto continue_at_12
	end
	reg_0 = TABLE_LIST[0].data[load_i32(memory_at_0, loc_10 + 12)](loc_12, loc_4, loc_5)
	goto continue_at_0
	::continue_at_14::
	if band_i32(loc_7, 8) == 0 then
		goto continue_at_15
	end
	loc_11 = load_i32(memory_at_0, loc_0 + 16)
	store_i32(memory_at_0, loc_0 + 16, 48)
	loc_7 = load_i32_u8(memory_at_0, loc_0 + 32)
	loc_1 = 1
	store_i32_n8(memory_at_0, loc_0 + 32, 1)
	loc_12 = load_i32(memory_at_0, loc_0 + 20)
	loc_10 = load_i32(memory_at_0, loc_0 + 24)
	reg_0 = FUNC_LIST[54](loc_12, loc_10, loc_8, loc_2, loc_3)
	if reg_0 ~= 0 then
		goto continue_at_12
	end
	loc_1 = add_i32(sub_i32(loc_9, loc_6), 1)
	::continue_at_17::
	while true do
		loc_1 = add_i32(loc_1, -1)
		if loc_1 == 0 then
			goto continue_at_16
		end
		reg_0 = TABLE_LIST[0].data[load_i32(memory_at_0, loc_10 + 16)](loc_12, 48)
		if reg_0 == 0 then
			goto continue_at_17
		end
		break
	end
	reg_0 = 1
	goto continue_at_0
	::continue_at_16::
	loc_1 = 1
	reg_0 = TABLE_LIST[0].data[load_i32(memory_at_0, loc_10 + 12)](loc_12, loc_4, loc_5)
	if reg_0 ~= 0 then
		goto continue_at_12
	end
	store_i32_n8(memory_at_0, loc_0 + 32, loc_7)
	store_i32(memory_at_0, loc_0 + 16, loc_11)
	loc_1 = 0
	goto continue_at_12
	::continue_at_15::
	loc_6 = sub_i32(loc_9, loc_6)
	loc_1 = load_i32_u8(memory_at_0, loc_0 + 32)
	if not br_map[1] then
		br_map[1] = (function()
			return { [0] = 2, 0, 1, 0, }
		end)()
	end
	temp = br_map[1][loc_1] or 2
	if temp < 1 then
		goto continue_at_20
	elseif temp > 1 then
		goto continue_at_18
	else
		goto continue_at_19
	end
	::continue_at_20::
	loc_1 = loc_6
	loc_6 = 0
	goto continue_at_18
	::continue_at_19::
	loc_1 = shr_u32(loc_6, 1)
	loc_6 = shr_u32(add_i32(loc_6, 1), 1)
	::continue_at_18::
	loc_1 = add_i32(loc_1, 1)
	loc_9 = load_i32(memory_at_0, loc_0 + 16)
	loc_12 = load_i32(memory_at_0, loc_0 + 24)
	loc_10 = load_i32(memory_at_0, loc_0 + 20)
	::continue_at_22::
	while true do
		loc_1 = add_i32(loc_1, -1)
		if loc_1 == 0 then
			goto continue_at_21
		end
		reg_0 = TABLE_LIST[0].data[load_i32(memory_at_0, loc_12 + 16)](loc_10, loc_9)
		if reg_0 == 0 then
			goto continue_at_22
		end
		break
	end
	reg_0 = 1
	goto continue_at_0
	::continue_at_21::
	loc_1 = 1
	reg_0 = FUNC_LIST[54](loc_10, loc_12, loc_8, loc_2, loc_3)
	if reg_0 ~= 0 then
		goto continue_at_12
	end
	reg_0 = TABLE_LIST[0].data[load_i32(memory_at_0, loc_12 + 12)](loc_10, loc_4, loc_5)
	if reg_0 ~= 0 then
		goto continue_at_12
	end
	loc_1 = 0
	::continue_at_23::
	while true do
		if loc_6 ~= loc_1 then
			goto continue_at_24
		end
		reg_0 = (lt_u32(loc_6, loc_6) and 1 or 0)
		goto continue_at_0
		::continue_at_24::
		loc_1 = add_i32(loc_1, 1)
		reg_0 = TABLE_LIST[0].data[load_i32(memory_at_0, loc_12 + 16)](loc_10, loc_9)
		if reg_0 == 0 then
			goto continue_at_23
		end
		break
	end
	reg_0 = (lt_u32(add_i32(loc_1, -1), loc_6) and 1 or 0)
	goto continue_at_0
	::continue_at_12::
	reg_0 = loc_1
	::continue_at_0::
	return reg_0
end
FUNC_LIST[53] = --[[ _ZN4core3str5count14do_count_chars17haa0463a68be40a59E ]] function(loc_0, loc_1)
	local loc_2 = 0
	local loc_3 = 0
	local loc_4 = 0
	local loc_5 = 0
	local loc_6 = 0
	local loc_7 = 0
	local loc_8 = 0
	local loc_9 = 0
	local reg_0
	local reg_1
	local reg_2
	loc_2 = band_i32(add_i32(loc_0, 3), -4)
	loc_3 = sub_i32(loc_2, loc_0)
	if lt_u32(loc_1, loc_3) then
		goto continue_at_2
	end
	loc_4 = sub_i32(loc_1, loc_3)
	if lt_u32(loc_4, 4) then
		goto continue_at_2
	end
	loc_5 = band_i32(loc_4, 3)
	loc_6 = 0
	loc_1 = 0
	loc_7 = (loc_2 == loc_0 and 1 or 0)
	if loc_7 ~= 0 then
		goto continue_at_3
	end
	loc_1 = 0
	loc_8 = sub_i32(loc_0, loc_2)
	if le_u32(loc_8, -4) then
		goto continue_at_5
	end
	loc_9 = 0
	goto continue_at_4
	::continue_at_5::
	loc_9 = 0
	::continue_at_6::
	while true do
		loc_2 = add_i32(loc_0, loc_9)
		loc_1 = add_i32(add_i32(add_i32(add_i32(loc_1, (load_i32_i8(memory_at_0, loc_2) > -65 and 1 or 0)), (load_i32_i8(memory_at_0, add_i32(loc_2, 1)) > -65 and 1 or 0)), (load_i32_i8(memory_at_0, add_i32(loc_2, 2)) > -65 and 1 or 0)), (load_i32_i8(memory_at_0, add_i32(loc_2, 3)) > -65 and 1 or 0))
		loc_9 = add_i32(loc_9, 4)
		if loc_9 ~= 0 then
			goto continue_at_6
		end
		break
	end
	::continue_at_4::
	if loc_7 ~= 0 then
		goto continue_at_3
	end
	loc_2 = add_i32(loc_0, loc_9)
	::continue_at_7::
	while true do
		loc_1 = add_i32(loc_1, (load_i32_i8(memory_at_0, loc_2) > -65 and 1 or 0))
		loc_2 = add_i32(loc_2, 1)
		loc_8 = add_i32(loc_8, 1)
		if loc_8 ~= 0 then
			goto continue_at_7
		end
		break
	end
	::continue_at_3::
	loc_9 = add_i32(loc_0, loc_3)
	if loc_5 == 0 then
		goto continue_at_8
	end
	loc_2 = add_i32(loc_9, band_i32(loc_4, -4))
	loc_6 = (load_i32_i8(memory_at_0, loc_2) > -65 and 1 or 0)
	if loc_5 == 1 then
		goto continue_at_8
	end
	loc_6 = add_i32(loc_6, (load_i32_i8(memory_at_0, loc_2 + 1) > -65 and 1 or 0))
	if loc_5 == 2 then
		goto continue_at_8
	end
	loc_6 = add_i32(loc_6, (load_i32_i8(memory_at_0, loc_2 + 2) > -65 and 1 or 0))
	::continue_at_8::
	loc_3 = shr_u32(loc_4, 2)
	loc_8 = add_i32(loc_6, loc_1)
	::continue_at_9::
	while true do
		loc_4 = loc_9
		if loc_3 == 0 then
			goto continue_at_1
		end
		loc_6 = (lt_u32(loc_3, 192) and loc_3 or 192)
		loc_7 = band_i32(loc_6, 3)
		loc_5 = shl_i32(loc_6, 2)
		loc_2 = 0
		if lt_u32(loc_3, 4) then
			goto continue_at_10
		end
		loc_0 = add_i32(loc_4, band_i32(loc_5, 1008))
		loc_2 = 0
		loc_1 = loc_4
		::continue_at_11::
		while true do
			loc_9 = load_i32(memory_at_0, loc_1 + 12)
			reg_0 = band_i32(bor_i32(shr_u32(bxor_i32(loc_9, -1), 7), shr_u32(loc_9, 6)), 16843009)
			loc_9 = load_i32(memory_at_0, loc_1 + 8)
			reg_1 = band_i32(bor_i32(shr_u32(bxor_i32(loc_9, -1), 7), shr_u32(loc_9, 6)), 16843009)
			loc_9 = load_i32(memory_at_0, loc_1 + 4)
			reg_2 = band_i32(bor_i32(shr_u32(bxor_i32(loc_9, -1), 7), shr_u32(loc_9, 6)), 16843009)
			loc_9 = load_i32(memory_at_0, loc_1)
			loc_2 = add_i32(reg_0, add_i32(reg_1, add_i32(reg_2, add_i32(band_i32(bor_i32(shr_u32(bxor_i32(loc_9, -1), 7), shr_u32(loc_9, 6)), 16843009), loc_2))))
			loc_1 = add_i32(loc_1, 16)
			if loc_1 ~= loc_0 then
				goto continue_at_11
			end
			break
		end
		::continue_at_10::
		loc_3 = sub_i32(loc_3, loc_6)
		loc_9 = add_i32(loc_4, loc_5)
		loc_8 = add_i32(shr_u32(mul_i32(add_i32(band_i32(shr_u32(loc_2, 8), 16711935), band_i32(loc_2, 16711935)), 65537), 16), loc_8)
		if loc_7 == 0 then
			goto continue_at_9
		end
		break
	end
	loc_2 = add_i32(loc_4, shl_i32(band_i32(loc_6, 252), 2))
	loc_1 = load_i32(memory_at_0, loc_2)
	loc_1 = band_i32(bor_i32(shr_u32(bxor_i32(loc_1, -1), 7), shr_u32(loc_1, 6)), 16843009)
	if loc_7 == 1 then
		goto continue_at_12
	end
	loc_9 = load_i32(memory_at_0, loc_2 + 4)
	loc_1 = add_i32(band_i32(bor_i32(shr_u32(bxor_i32(loc_9, -1), 7), shr_u32(loc_9, 6)), 16843009), loc_1)
	if loc_7 == 2 then
		goto continue_at_12
	end
	loc_2 = load_i32(memory_at_0, loc_2 + 8)
	loc_1 = add_i32(band_i32(bor_i32(shr_u32(bxor_i32(loc_2, -1), 7), shr_u32(loc_2, 6)), 16843009), loc_1)
	::continue_at_12::
	reg_0 = add_i32(shr_u32(mul_i32(add_i32(band_i32(shr_u32(loc_1, 8), 459007), band_i32(loc_1, 16711935)), 65537), 16), loc_8)
	goto continue_at_0
	::continue_at_2::
	if loc_1 ~= 0 then
		goto continue_at_13
	end
	reg_0 = 0
	goto continue_at_0
	::continue_at_13::
	loc_9 = band_i32(loc_1, 3)
	if ge_u32(loc_1, 4) then
		goto continue_at_15
	end
	loc_8 = 0
	loc_2 = 0
	goto continue_at_14
	::continue_at_15::
	loc_3 = band_i32(loc_1, -4)
	loc_8 = 0
	loc_2 = 0
	::continue_at_16::
	while true do
		loc_1 = add_i32(loc_0, loc_2)
		loc_8 = add_i32(add_i32(add_i32(add_i32(loc_8, (load_i32_i8(memory_at_0, loc_1) > -65 and 1 or 0)), (load_i32_i8(memory_at_0, add_i32(loc_1, 1)) > -65 and 1 or 0)), (load_i32_i8(memory_at_0, add_i32(loc_1, 2)) > -65 and 1 or 0)), (load_i32_i8(memory_at_0, add_i32(loc_1, 3)) > -65 and 1 or 0))
		loc_2 = add_i32(loc_2, 4)
		if loc_3 ~= loc_2 then
			goto continue_at_16
		end
		break
	end
	::continue_at_14::
	if loc_9 == 0 then
		goto continue_at_1
	end
	loc_1 = add_i32(loc_0, loc_2)
	::continue_at_17::
	while true do
		loc_8 = add_i32(loc_8, (load_i32_i8(memory_at_0, loc_1) > -65 and 1 or 0))
		loc_1 = add_i32(loc_1, 1)
		loc_9 = add_i32(loc_9, -1)
		if loc_9 ~= 0 then
			goto continue_at_17
		end
		break
	end
	::continue_at_1::
	reg_0 = loc_8
	::continue_at_0::
	return reg_0
end
FUNC_LIST[54] = --[[ _ZN4core3fmt9Formatter12pad_integral12write_prefix17hef988c9f737e47ffE ]] function(loc_0, loc_1, loc_2, loc_3, loc_4)
	local loc_5 = 0
	local reg_0
	if loc_2 == 1114112 then
		goto continue_at_3
	end
	loc_5 = 1
	reg_0 = TABLE_LIST[0].data[load_i32(memory_at_0, loc_1 + 16)](loc_0, loc_2)
	if reg_0 ~= 0 then
		goto continue_at_2
	end
	::continue_at_3::
	if loc_3 ~= 0 then
		goto continue_at_1
	end
	loc_5 = 0
	::continue_at_2::
	reg_0 = loc_5
	goto continue_at_0
	::continue_at_1::
	reg_0 = TABLE_LIST[0].data[load_i32(memory_at_0, loc_1 + 12)](loc_0, loc_3, loc_4)
	::continue_at_0::
	return reg_0
end
FUNC_LIST[55] = --[[ _ZN4core3fmt3num3imp7fmt_u6417h1b9613c9751540e8E ]] function(loc_0, loc_1, loc_2)
	local loc_3 = 0
	local loc_4 = 0
	local loc_5 = 0LL
	local loc_6 = 0
	local loc_7 = 0
	local loc_8 = 0
	local reg_0
	local reg_1
	loc_3 = sub_i32(GLOBAL_LIST[0].value, 48)
	GLOBAL_LIST[0].value = loc_3
	loc_4 = 39
	if ge_u64(loc_0, 10000LL) then
		goto continue_at_2
	end
	loc_5 = loc_0
	goto continue_at_1
	::continue_at_2::
	loc_4 = 39
	::continue_at_3::
	while true do
		loc_6 = add_i32(add_i32(loc_3, 9), loc_4)
		loc_5 = div_u64(loc_0, 10000LL)
		loc_7 = wrap_i32_i64((loc_0 - (loc_5 * 10000LL)))
		loc_8 = div_u32(band_i32(loc_7, 65535), 100)
		store_i32_n16(memory_at_0, add_i32(loc_6, -4), load_i32_u16(memory_at_0, add_i32(shl_i32(loc_8, 1), 1049224)))
		store_i32_n16(memory_at_0, add_i32(loc_6, -2), load_i32_u16(memory_at_0, add_i32(shl_i32(band_i32(sub_i32(loc_7, mul_i32(loc_8, 100)), 65535), 1), 1049224)))
		loc_4 = add_i32(loc_4, -4)
		loc_6 = (gt_u64(loc_0, 99999999LL) and 1 or 0)
		loc_0 = loc_5
		if loc_6 ~= 0 then
			goto continue_at_3
		end
		break
	end
	::continue_at_1::
	loc_6 = wrap_i32_i64(loc_5)
	if le_u32(loc_6, 99) then
		goto continue_at_4
	end
	loc_4 = add_i32(loc_4, -2)
	loc_6 = wrap_i32_i64(loc_5)
	reg_1 = loc_6
	loc_6 = div_u32(band_i32(loc_6, 65535), 100)
	store_i32_n16(memory_at_0, add_i32(add_i32(loc_3, 9), loc_4), load_i32_u16(memory_at_0, add_i32(shl_i32(band_i32(sub_i32(reg_1, mul_i32(loc_6, 100)), 65535), 1), 1049224)))
	::continue_at_4::
	if lt_u32(loc_6, 10) then
		goto continue_at_6
	end
	loc_4 = add_i32(loc_4, -2)
	store_i32_n16(memory_at_0, add_i32(add_i32(loc_3, 9), loc_4), load_i32_u16(memory_at_0, add_i32(shl_i32(loc_6, 1), 1049224)))
	goto continue_at_5
	::continue_at_6::
	loc_4 = add_i32(loc_4, -1)
	store_i32_n8(memory_at_0, add_i32(add_i32(loc_3, 9), loc_4), bor_i32(loc_6, 48))
	::continue_at_5::
	reg_0 = FUNC_LIST[52](loc_2, loc_1, 1049096, 0, add_i32(add_i32(loc_3, 9), loc_4), sub_i32(39, loc_4))
	loc_4 = reg_0
	GLOBAL_LIST[0].value = add_i32(loc_3, 48)
	reg_0 = loc_4
	return reg_0
end
FUNC_LIST[56] = --[[ _ZN17compiler_builtins3mem6memcpy17h310372e6d7191176E ]] function(loc_0, loc_1, loc_2)
	local loc_3 = 0
	local loc_4 = 0
	local loc_5 = 0
	local loc_6 = 0
	local loc_7 = 0
	local loc_8 = 0
	local loc_9 = 0
	local loc_10 = 0
	local reg_0
	local reg_1
	if ge_u32(loc_2, 16) then
		goto continue_at_2
	end
	loc_3 = loc_0
	goto continue_at_1
	::continue_at_2::
	loc_4 = band_i32(sub_i32(0, loc_0), 3)
	loc_5 = add_i32(loc_0, loc_4)
	if loc_4 == 0 then
		goto continue_at_3
	end
	loc_3 = loc_0
	loc_6 = loc_1
	::continue_at_4::
	while true do
		store_i32_n8(memory_at_0, loc_3, load_i32_u8(memory_at_0, loc_6))
		loc_6 = add_i32(loc_6, 1)
		loc_3 = add_i32(loc_3, 1)
		if lt_u32(loc_3, loc_5) then
			goto continue_at_4
		end
		break
	end
	::continue_at_3::
	loc_7 = sub_i32(loc_2, loc_4)
	loc_8 = band_i32(loc_7, -4)
	loc_3 = add_i32(loc_5, loc_8)
	loc_9 = add_i32(loc_1, loc_4)
	if band_i32(loc_9, 3) == 0 then
		goto continue_at_6
	end
	if loc_8 < 1 then
		goto continue_at_5
	end
	loc_6 = shl_i32(loc_9, 3)
	loc_2 = band_i32(loc_6, 24)
	loc_10 = band_i32(loc_9, -4)
	loc_1 = add_i32(loc_10, 4)
	loc_4 = band_i32(sub_i32(0, loc_6), 24)
	loc_6 = load_i32(memory_at_0, loc_10)
	::continue_at_7::
	while true do
		reg_1 = shr_u32(loc_6, loc_2)
		loc_6 = load_i32(memory_at_0, loc_1)
		store_i32(memory_at_0, loc_5, bor_i32(reg_1, shl_i32(loc_6, loc_4)))
		loc_1 = add_i32(loc_1, 4)
		loc_5 = add_i32(loc_5, 4)
		if lt_u32(loc_5, loc_3) then
			goto continue_at_7
		end
		goto continue_at_5
	end
	::continue_at_6::
	if loc_8 < 1 then
		goto continue_at_5
	end
	loc_1 = loc_9
	::continue_at_8::
	while true do
		store_i32(memory_at_0, loc_5, load_i32(memory_at_0, loc_1))
		loc_1 = add_i32(loc_1, 4)
		loc_5 = add_i32(loc_5, 4)
		if lt_u32(loc_5, loc_3) then
			goto continue_at_8
		end
		break
	end
	::continue_at_5::
	loc_2 = band_i32(loc_7, 3)
	loc_1 = add_i32(loc_9, loc_8)
	::continue_at_1::
	if loc_2 == 0 then
		goto continue_at_9
	end
	loc_5 = add_i32(loc_3, loc_2)
	::continue_at_10::
	while true do
		store_i32_n8(memory_at_0, loc_3, load_i32_u8(memory_at_0, loc_1))
		loc_1 = add_i32(loc_1, 1)
		loc_3 = add_i32(loc_3, 1)
		if lt_u32(loc_3, loc_5) then
			goto continue_at_10
		end
		break
	end
	::continue_at_9::
	reg_0 = loc_0
	return reg_0
end
FUNC_LIST[57] = --[[ memcpy ]] function(loc_0, loc_1, loc_2)
	local reg_0
	reg_0 = FUNC_LIST[56](loc_0, loc_1, loc_2)
	return reg_0
end
local function run_init_code()
	TABLE_LIST[0] = { min = 20, max = 20, data = {} }
	MEMORY_LIST[0] = rt.allocator.new(17, 65535)
	GLOBAL_LIST[0] = { value = 1048576 }
	GLOBAL_LIST[1] = { value = 1049905 }
	GLOBAL_LIST[2] = { value = 1049920 }
	do
		local target = TABLE_LIST[0].data
		local offset = 1
		local data = { FUNC_LIST[48],FUNC_LIST[27],FUNC_LIST[13],FUNC_LIST[17],FUNC_LIST[15],FUNC_LIST[10],FUNC_LIST[7],FUNC_LIST[11],FUNC_LIST[8],FUNC_LIST[34],FUNC_LIST[35],FUNC_LIST[14],FUNC_LIST[32],FUNC_LIST[33],FUNC_LIST[12],FUNC_LIST[6],FUNC_LIST[43],FUNC_LIST[44],FUNC_LIST[50], }
		table.move(data, 1, #data, offset, target)
	end
	rt.store.string(MEMORY_LIST[0], 1048576,"Hello!src\\lib.rs\x06\x00\x10\x00\n\x00\x00\x00\n\x00\x00\x00\x10\x00\x00\x00\x03\x00\x00\x00\x0c\x00\x00\x00\x04\x00\x00\x00\x04\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00/rust/deps/dlmalloc-0.2.6/src/dlmalloc.rsassertion failed: psize >= size + min_overhead\x008\x00\x10\x00)\x00\x00\x00\xa8\x04\x00\x00\t\x00\x00\x00assertion failed: psize <= size + max_overhead\x00\x008\x00\x10\x00)\x00\x00\x00\xae\x04\x00\x00\r\x00\x00\x00memory allocation of  bytes failed\x00\x00\xe0\x00\x10\x00\x15\x00\x00\x00\xf5\x00\x10\x00\r\x00\x00\x00library/std/src/alloc.rs\x14\x01\x10\x00\x18\x00\x00\x00b\x01\x00\x00\t\x00\x00\x00library/std/src/panicking.rs<\x01\x10\x00\x1c\x00\x00\x00\x84\x02\x00\x00\x1e\x00\x00\x00\x03\x00\x00\x00\x0c\x00\x00\x00\x04\x00\x00\x00\x07\x00\x00\x00\x08\x00\x00\x00\x08\x00\x00\x00\x04\x00\x00\x00\t\x00\x00\x00\x08\x00\x00\x00\x08\x00\x00\x00\x04\x00\x00\x00\n\x00\x00\x00\x0b\x00\x00\x00\x0c\x00\x00\x00\x10\x00\x00\x00\x04\x00\x00\x00\r\x00\x00\x00\x0e\x00\x00\x00\x0f\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x10\x00\x00\x00capacity overflow\x00\x00\x00\xc0\x01\x10\x00\x11\x00\x00\x00library/alloc/src/raw_vec.rs\xdc\x01\x10\x00\x1c\x00\x00\x00\x19\x00\x00\x00\x05\x00\x00\x00called `Option::unwrap()` on a `None` value\x00\x12\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x13\x00\x00\x00index out of bounds: the len is  but the index is \x00\x00D\x02\x10\x00 \x00\x00\x00d\x02\x10\x00\x12\x00\x00\x0000010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899")
end
return function(wasm)
	FUNC_LIST[0] = wasm["wasmtorio_game_script"].func_list["print"]
	run_init_code()
	memory_at_0 = MEMORY_LIST[0]
	return {
		func_list = {
			["add_five_i32"] = FUNC_LIST[1],
		},
		table_list = {
		},
		memory_list = {
			["memory"] = MEMORY_LIST[0],
		},
		global_list = {
			["__data_end"] = GLOBAL_LIST[1],
			["__heap_base"] = GLOBAL_LIST[2],
		},
	}
end
