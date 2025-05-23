local bit = require("bit")
function table_move()
end
local runtime = require('luajit')

local grow_page_num = runtime.grow_page_num

local add = runtime.add
local sub = runtime.sub
local mul = runtime.mul
local div = runtime.div

local le = runtime.le
local lt = runtime.lt
local ge = runtime.ge
local gt = runtime.gt

local band = runtime.band
local bor = runtime.bor
local bxor = runtime.bxor
local bnot = runtime.bnot

local shl = runtime.shl
local shr = runtime.shr

local extend = runtime.extend
local wrap = runtime.wrap

local load = runtime.load
local store = runtime.store

local FUNC_LIST = {[0] = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil}
local TABLE_LIST = {[0] = nil}
local MEMORY_LIST = {[0] = nil}
local GLOBAL_LIST = {[0] = nil, nil, nil}
FUNC_LIST[1] =
function(
param_1, param_2, param_3)
local
var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9= 0, 0, 0, 0, 0, 0, 0, 0, 0
local
reg_1, reg_2, reg_3
reg_1 = GLOBAL_LIST[0].value
var_1 = reg_1
reg_1 = 32
var_2 = reg_1
reg_1 = var_1
reg_2 = var_2
reg_1 = reg_1 - reg_2
var_3 = reg_1
reg_1 = var_3
GLOBAL_LIST[0].value = reg_1
reg_1 = var_3
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 16, reg_2)
reg_1 = var_3
reg_2 = param_3
store.i32(MEMORY_LIST[0], reg_1 + 20, reg_2)
reg_1 = var_3
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 24, reg_2)
reg_1 = var_3
reg_2 = param_3
store.i32(MEMORY_LIST[0], reg_1 + 28, reg_2)
reg_1 = 8
var_4 = reg_1
reg_1 = var_3
reg_2 = var_4
reg_1 = reg_1 + reg_2
var_5 = reg_1
reg_1 = var_5
reg_2 = param_2
reg_3 = param_3
FUNC_LIST[2](reg_1, reg_2, reg_3)
reg_1 = var_3
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
var_6 = reg_1
reg_1 = var_3
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 12)
var_7 = reg_1
reg_1 = param_1
reg_2 = var_7
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = var_6
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = 32
var_8 = reg_1
reg_1 = var_3
reg_2 = var_8
reg_1 = reg_1 + reg_2
var_9 = reg_1
reg_1 = var_9
GLOBAL_LIST[0].value = reg_1
do return  end
end
FUNC_LIST[2] =
function(
param_1, param_2, param_3)
local
var_1, var_2, var_3, var_4, var_5= 0, 0, 0, 0, 0
local
reg_1, reg_2
reg_1 = GLOBAL_LIST[0].value
var_1 = reg_1
reg_1 = 32
var_2 = reg_1
reg_1 = var_1
reg_2 = var_2
reg_1 = reg_1 - reg_2
var_3 = reg_1
reg_1 = var_3
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 16, reg_2)
reg_1 = var_3
reg_2 = param_3
store.i32(MEMORY_LIST[0], reg_1 + 20, reg_2)
reg_1 = var_3
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 24, reg_2)
reg_1 = var_3
reg_2 = param_3
store.i32(MEMORY_LIST[0], reg_1 + 28, reg_2)
reg_1 = var_3
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = var_3
reg_2 = param_3
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = var_3
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
var_4 = reg_1
reg_1 = var_3
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 12)
var_5 = reg_1
reg_1 = param_1
reg_2 = var_5
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = var_4
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
do return  end
end
FUNC_LIST[3] =
function(
param_1)
local
var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10, var_11, var_12, var_13, var_14, var_15, var_16, var_17, var_18, var_19, var_20, var_21, var_22, var_23, var_24, var_25, var_26, var_27, var_28, var_29, var_30= 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
local
reg_1, reg_2, reg_3
reg_1 = GLOBAL_LIST[0].value
var_1 = reg_1
reg_1 = 32
var_2 = reg_1
reg_1 = var_1
reg_2 = var_2
reg_1 = reg_1 - reg_2
var_3 = reg_1
reg_1 = var_3
GLOBAL_LIST[0].value = reg_1
reg_1 = 1048576
var_4 = reg_1
reg_1 = var_3
reg_2 = var_4
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = 6
var_5 = reg_1
reg_1 = var_3
reg_2 = var_5
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = var_3
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 16, reg_2)
reg_1 = var_3
reg_2 = var_4
store.i32(MEMORY_LIST[0], reg_1 + 24, reg_2)
reg_1 = var_3
reg_2 = var_5
store.i32(MEMORY_LIST[0], reg_1 + 28, reg_2)
reg_1 = 2
var_6 = reg_1
reg_1 = var_6
var_7 = reg_1
reg_1 = var_5
var_8 = reg_1
reg_1 = var_7
reg_2 = var_8
reg_1 = lt.u32(reg_1, reg_2)
var_9 = reg_1
reg_1 = 1
var_10 = reg_1
reg_1 = var_9
reg_2 = var_10
reg_1 = band.i32(reg_1, reg_2)
var_11 = reg_1
do
do
do
reg_1 = var_11
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = var_4
reg_1 = load.i32_u8(MEMORY_LIST[0], reg_1 + 2)
var_12 = reg_1
reg_1 = 255
var_13 = reg_1
reg_1 = var_12
reg_2 = var_13
reg_1 = band.i32(reg_1, reg_2)
var_14 = reg_1
reg_1 = var_3
reg_2 = var_14
store.i32(MEMORY_LIST[0], reg_1 + 20, reg_2)
reg_1 = 1048576
var_15 = reg_1
reg_1 = 6
var_16 = reg_1
reg_1 = var_15
reg_2 = var_16
FUNC_LIST[4](reg_1, reg_2)
reg_1 = 0
var_17 = reg_1
reg_1 = var_14
reg_2 = var_17
reg_1 = reg_1 < reg_2 and 1 or 0
var_18 = reg_1
reg_1 = param_1
reg_2 = var_14
reg_1 = reg_1 + reg_2
var_19 = reg_1
reg_1 = var_19
reg_2 = param_1
reg_1 = reg_1 < reg_2 and 1 or 0
var_20 = reg_1
reg_1 = var_18
reg_2 = var_20
reg_1 = bxor.i32(reg_1, reg_2)
var_21 = reg_1
reg_1 = 1
var_22 = reg_1
reg_1 = var_21
reg_2 = var_22
reg_1 = band.i32(reg_1, reg_2)
var_23 = reg_1
reg_1 = var_23
if reg_1 ~= 0 then
goto continue_at_0
end
goto continue_at_1
::continue_at_2::
end
reg_1 = 2
var_24 = reg_1
reg_1 = 1048592
var_25 = reg_1
reg_1 = var_24
reg_2 = var_5
reg_3 = var_25
FUNC_LIST[49](reg_1, reg_2, reg_3)
error('unreachable code entered')
::continue_at_1::
end
reg_1 = 32
var_26 = reg_1
reg_1 = var_3
reg_2 = var_26
reg_1 = reg_1 + reg_2
var_27 = reg_1
reg_1 = var_27
GLOBAL_LIST[0].value = reg_1
reg_1 = var_19
do return reg_1 end
::continue_at_0::
end
reg_1 = 1048624
var_28 = reg_1
reg_1 = 28
var_29 = reg_1
reg_1 = 1048608
var_30 = reg_1
reg_1 = var_28
reg_2 = var_29
reg_3 = var_30
FUNC_LIST[50](reg_1, reg_2, reg_3)
error('unreachable code entered')
do return var_30 end
end
FUNC_LIST[4] =
function(
param_1, param_2)
local
var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9= 0, 0, 0, 0, 0, 0, 0, 0, 0
local
reg_1, reg_2, reg_3
reg_1 = GLOBAL_LIST[0].value
var_1 = reg_1
reg_1 = 32
var_2 = reg_1
reg_1 = var_1
reg_2 = var_2
reg_1 = reg_1 - reg_2
var_3 = reg_1
reg_1 = var_3
GLOBAL_LIST[0].value = reg_1
reg_1 = var_3
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 16, reg_2)
reg_1 = var_3
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 20, reg_2)
reg_1 = 8
var_4 = reg_1
reg_1 = var_3
reg_2 = var_4
reg_1 = reg_1 + reg_2
var_5 = reg_1
reg_1 = var_5
reg_2 = param_1
reg_3 = param_2
FUNC_LIST[1](reg_1, reg_2, reg_3)
reg_1 = var_3
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 12)
var_6 = reg_1
reg_1 = var_3
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
var_7 = reg_1
reg_1 = var_3
reg_2 = var_7
store.i32(MEMORY_LIST[0], reg_1 + 24, reg_2)
reg_1 = var_3
reg_2 = var_6
store.i32(MEMORY_LIST[0], reg_1 + 28, reg_2)
reg_1 = var_7
reg_2 = var_6
FUNC_LIST[0](reg_1, reg_2)
reg_1 = 32
var_8 = reg_1
reg_1 = var_3
reg_2 = var_8
reg_1 = reg_1 + reg_2
var_9 = reg_1
reg_1 = var_9
GLOBAL_LIST[0].value = reg_1
do return  end
end
FUNC_LIST[5] =
function(
param_1, param_2)
local
var_1= 0
local
reg_1, reg_2
reg_1 = param_1
reg_2 = param_2
reg_1 =
FUNC_LIST[31](reg_1, reg_2)
var_1 = reg_1
reg_1 = var_1
do return reg_1 end
do return var_1 end
end
FUNC_LIST[6] =
function(
param_1, param_2, param_3)
local
reg_1, reg_2, reg_3
reg_1 = param_1
reg_2 = param_2
reg_3 = param_3
FUNC_LIST[32](reg_1, reg_2, reg_3)
do return  end
end
FUNC_LIST[7] =
function(
param_1, param_2, param_3, param_4)
local
var_1= 0
local
reg_1, reg_2, reg_3, reg_4
reg_1 = param_1
reg_2 = param_2
reg_3 = param_3
reg_4 = param_4
reg_1 =
FUNC_LIST[33](reg_1, reg_2, reg_3, reg_4)
var_1 = reg_1
reg_1 = var_1
do return reg_1 end
do return var_1 end
end
FUNC_LIST[8] =
function(
param_1, param_2)
local
reg_1, reg_2
reg_1 = param_1
reg_2 = param_2
FUNC_LIST[41](reg_1, reg_2)
do return  end
end
FUNC_LIST[9] =
function(
param_1, param_2)
local
reg_1, reg_2
reg_1 = param_1
reg_2 = 4363014821963114893
store.i64(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = param_1
reg_2 = -354935419601612971
store.i64(MEMORY_LIST[0], reg_1 + 0, reg_2)
end
FUNC_LIST[10] =
function(
param_1, param_2)
local
reg_1, reg_2
reg_1 = param_1
reg_2 = -6257463008485468702
store.i64(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = param_1
reg_2 = 7943766429527570954
store.i64(MEMORY_LIST[0], reg_1 + 0, reg_2)
end
FUNC_LIST[11] =
function(
param_1, param_2)
local
reg_1, reg_2
reg_1 = param_1
reg_2 = -4493808902380553279
store.i64(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = param_1
reg_2 = -163230743173927068
store.i64(MEMORY_LIST[0], reg_1 + 0, reg_2)
end
FUNC_LIST[12] =
function(
param_1, param_2, param_3)
local
var_1, var_2, var_3= 0, 0, 0
local
reg_1, reg_2, reg_3, reg_4, reg_5
reg_1 = GLOBAL_LIST[0].value
reg_2 = 32
reg_1 = reg_1 - reg_2
var_1 = reg_1
GLOBAL_LIST[0].value = reg_1
do
reg_1 = param_2
reg_2 = param_3
reg_1 = reg_1 + reg_2
param_3 = reg_1
reg_2 = param_2
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = 1
var_2 = reg_1
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_3 = reg_1
reg_2 = 1
reg_1 = shl.i32(reg_1, reg_2)
param_2 = reg_1
reg_2 = param_3
reg_3 = param_2
reg_4 = param_3
reg_3 = gt.u32(reg_3, reg_4)
if reg_3 == 0 then
reg_1 = reg_2
end
param_2 = reg_1
reg_2 = 8
reg_3 = param_2
reg_4 = 8
reg_3 = gt.u32(reg_3, reg_4)
if reg_3 == 0 then
reg_1 = reg_2
end
param_2 = reg_1
reg_2 = -1
reg_1 = bxor.i32(reg_1, reg_2)
reg_2 = 31
reg_1 = shr.u32(reg_1, reg_2)
param_3 = reg_1
do
do
reg_1 = var_3
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = 0
var_2 = reg_1
goto continue_at_1
::continue_at_2::
end
reg_1 = var_1
reg_2 = var_3
store.i32(MEMORY_LIST[0], reg_1 + 28, reg_2)
reg_1 = var_1
reg_2 = param_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 4)
store.i32(MEMORY_LIST[0], reg_1 + 20, reg_2)
::continue_at_1::
end
reg_1 = var_1
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 24, reg_2)
reg_1 = var_1
reg_2 = 8
reg_1 = reg_1 + reg_2
reg_2 = param_3
reg_3 = param_2
reg_4 = var_1
reg_5 = 20
reg_4 = reg_4 + reg_5
FUNC_LIST[21](reg_1, reg_2, reg_3, reg_4)
do
reg_1 = var_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = var_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 12)
param_1 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = param_1
reg_2 = var_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 16)
FUNC_LIST[45](reg_1, reg_2)
error('unreachable code entered')
::continue_at_1::
end
reg_1 = var_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 12)
param_3 = reg_1
reg_1 = param_1
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = param_1
reg_2 = param_3
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_1
reg_2 = 32
reg_1 = reg_1 + reg_2
GLOBAL_LIST[0].value = reg_1
do return  end
::continue_at_0::
end
FUNC_LIST[44]()
error('unreachable code entered')
end
FUNC_LIST[13] =
function(
param_1, param_2)
local
reg_1, reg_2, reg_3
reg_1 = param_1
reg_2 = 1048652
reg_3 = param_2
reg_1 =
FUNC_LIST[52](reg_1, reg_2, reg_3)
do return reg_1 end
end
FUNC_LIST[14] =
function(
param_1)
end
FUNC_LIST[15] =
function(
param_1)
end
FUNC_LIST[16] =
function(
param_1)
local
var_1= 0
local
reg_1, reg_2, reg_3
do
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_1 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
reg_2 = var_1
reg_3 = 1
FUNC_LIST[6](reg_1, reg_2, reg_3)
::continue_at_0::
end
end
FUNC_LIST[17] =
function(
param_1)
local
var_1= 0
local
reg_1, reg_2, reg_3
do
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_1 = reg_1
reg_2 = -2147483648
reg_1 = bor.i32(reg_1, reg_2)
reg_2 = -2147483648
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
reg_2 = var_1
reg_3 = 1
FUNC_LIST[6](reg_1, reg_2, reg_3)
::continue_at_0::
end
end
FUNC_LIST[18] =
function(
param_1, param_2)
local
var_1, var_2= 0, 0
local
reg_1, reg_2, reg_3
reg_1 = GLOBAL_LIST[0].value
reg_2 = 16
reg_1 = reg_1 - reg_2
var_1 = reg_1
GLOBAL_LIST[0].value = reg_1
do
do
do
do
reg_1 = param_2
reg_2 = 128
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_3
end
reg_1 = var_1
reg_2 = 0
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = param_2
reg_2 = 2048
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_2
end
do
reg_1 = param_2
reg_2 = 65536
reg_1 = ge.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_4
end
reg_1 = var_1
reg_2 = param_2
reg_3 = 63
reg_2 = band.i32(reg_2, reg_3)
reg_3 = 128
reg_2 = bor.i32(reg_2, reg_3)
store.i32_n8(MEMORY_LIST[0], reg_1 + 14, reg_2)
reg_1 = var_1
reg_2 = param_2
reg_3 = 12
reg_2 = shr.u32(reg_2, reg_3)
reg_3 = 224
reg_2 = bor.i32(reg_2, reg_3)
store.i32_n8(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = var_1
reg_2 = param_2
reg_3 = 6
reg_2 = shr.u32(reg_2, reg_3)
reg_3 = 63
reg_2 = band.i32(reg_2, reg_3)
reg_3 = 128
reg_2 = bor.i32(reg_2, reg_3)
store.i32_n8(MEMORY_LIST[0], reg_1 + 13, reg_2)
reg_1 = 3
param_2 = reg_1
goto continue_at_1
::continue_at_4::
end
reg_1 = var_1
reg_2 = param_2
reg_3 = 63
reg_2 = band.i32(reg_2, reg_3)
reg_3 = 128
reg_2 = bor.i32(reg_2, reg_3)
store.i32_n8(MEMORY_LIST[0], reg_1 + 15, reg_2)
reg_1 = var_1
reg_2 = param_2
reg_3 = 6
reg_2 = shr.u32(reg_2, reg_3)
reg_3 = 63
reg_2 = band.i32(reg_2, reg_3)
reg_3 = 128
reg_2 = bor.i32(reg_2, reg_3)
store.i32_n8(MEMORY_LIST[0], reg_1 + 14, reg_2)
reg_1 = var_1
reg_2 = param_2
reg_3 = 12
reg_2 = shr.u32(reg_2, reg_3)
reg_3 = 63
reg_2 = band.i32(reg_2, reg_3)
reg_3 = 128
reg_2 = bor.i32(reg_2, reg_3)
store.i32_n8(MEMORY_LIST[0], reg_1 + 13, reg_2)
reg_1 = var_1
reg_2 = param_2
reg_3 = 18
reg_2 = shr.u32(reg_2, reg_3)
reg_3 = 7
reg_2 = band.i32(reg_2, reg_3)
reg_3 = 240
reg_2 = bor.i32(reg_2, reg_3)
store.i32_n8(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = 4
param_2 = reg_1
goto continue_at_1
::continue_at_3::
end
do
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
var_2 = reg_1
reg_2 = param_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 0)
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_3
end
reg_1 = param_1
reg_2 = var_2
FUNC_LIST[19](reg_1, reg_2)
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
var_2 = reg_1
::continue_at_3::
end
reg_1 = param_1
reg_2 = var_2
reg_3 = 1
reg_2 = reg_2 + reg_3
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
reg_2 = var_2
reg_1 = reg_1 + reg_2
reg_2 = param_2
store.i32_n8(MEMORY_LIST[0], reg_1 + 0, reg_2)
goto continue_at_0
::continue_at_2::
end
reg_1 = var_1
reg_2 = param_2
reg_3 = 63
reg_2 = band.i32(reg_2, reg_3)
reg_3 = 128
reg_2 = bor.i32(reg_2, reg_3)
store.i32_n8(MEMORY_LIST[0], reg_1 + 13, reg_2)
reg_1 = var_1
reg_2 = param_2
reg_3 = 6
reg_2 = shr.u32(reg_2, reg_3)
reg_3 = 192
reg_2 = bor.i32(reg_2, reg_3)
store.i32_n8(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = 2
param_2 = reg_1
::continue_at_1::
end
do
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
reg_2 = param_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 8)
var_2 = reg_2
reg_1 = reg_1 - reg_2
reg_2 = param_2
reg_1 = ge.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = param_1
reg_2 = var_2
reg_3 = param_2
FUNC_LIST[12](reg_1, reg_2, reg_3)
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
var_2 = reg_1
::continue_at_1::
end
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
reg_2 = var_2
reg_1 = reg_1 + reg_2
reg_2 = var_1
reg_3 = 12
reg_2 = reg_2 + reg_3
reg_3 = param_2
reg_1 =
FUNC_LIST[60](reg_1, reg_2, reg_3)
reg_1 = param_1
reg_2 = var_2
reg_3 = param_2
reg_2 = reg_2 + reg_3
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
::continue_at_0::
end
reg_1 = var_1
reg_2 = 16
reg_1 = reg_1 + reg_2
GLOBAL_LIST[0].value = reg_1
reg_1 = 0
do return reg_1 end
end
FUNC_LIST[19] =
function(
param_1, param_2)
local
var_1, var_2, var_3= 0, 0, 0
local
reg_1, reg_2, reg_3, reg_4, reg_5
reg_1 = GLOBAL_LIST[0].value
reg_2 = 32
reg_1 = reg_1 - reg_2
var_1 = reg_1
GLOBAL_LIST[0].value = reg_1
do
reg_1 = param_2
reg_2 = 1
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_2 = reg_1
reg_2 = 1
reg_1 = shl.i32(reg_1, reg_2)
var_3 = reg_1
reg_2 = param_2
reg_3 = var_3
reg_4 = param_2
reg_3 = gt.u32(reg_3, reg_4)
if reg_3 == 0 then
reg_1 = reg_2
end
param_2 = reg_1
reg_2 = 8
reg_3 = param_2
reg_4 = 8
reg_3 = gt.u32(reg_3, reg_4)
if reg_3 == 0 then
reg_1 = reg_2
end
param_2 = reg_1
reg_2 = -1
reg_1 = bxor.i32(reg_1, reg_2)
reg_2 = 31
reg_1 = shr.u32(reg_1, reg_2)
var_3 = reg_1
do
do
reg_1 = var_2
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = 0
var_2 = reg_1
goto continue_at_1
::continue_at_2::
end
reg_1 = var_1
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 28, reg_2)
reg_1 = var_1
reg_2 = param_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 4)
store.i32(MEMORY_LIST[0], reg_1 + 20, reg_2)
reg_1 = 1
var_2 = reg_1
::continue_at_1::
end
reg_1 = var_1
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 24, reg_2)
reg_1 = var_1
reg_2 = 8
reg_1 = reg_1 + reg_2
reg_2 = var_3
reg_3 = param_2
reg_4 = var_1
reg_5 = 20
reg_4 = reg_4 + reg_5
FUNC_LIST[21](reg_1, reg_2, reg_3, reg_4)
do
reg_1 = var_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = var_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 12)
param_1 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = param_1
reg_2 = var_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 16)
FUNC_LIST[45](reg_1, reg_2)
error('unreachable code entered')
::continue_at_1::
end
reg_1 = var_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 12)
var_2 = reg_1
reg_1 = param_1
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = param_1
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_1
reg_2 = 32
reg_1 = reg_1 + reg_2
GLOBAL_LIST[0].value = reg_1
do return  end
::continue_at_0::
end
FUNC_LIST[44]()
error('unreachable code entered')
end
FUNC_LIST[20] =
function(
param_1, param_2, param_3)
local
var_1= 0
local
reg_1, reg_2, reg_3
do
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
reg_2 = param_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 8)
var_1 = reg_2
reg_1 = reg_1 - reg_2
reg_2 = param_3
reg_1 = ge.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = param_1
reg_2 = var_1
reg_3 = param_3
FUNC_LIST[12](reg_1, reg_2, reg_3)
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
var_1 = reg_1
::continue_at_0::
end
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
reg_2 = var_1
reg_1 = reg_1 + reg_2
reg_2 = param_2
reg_3 = param_3
reg_1 =
FUNC_LIST[60](reg_1, reg_2, reg_3)
reg_1 = param_1
reg_2 = var_1
reg_3 = param_3
reg_2 = reg_2 + reg_3
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = 0
do return reg_1 end
end
FUNC_LIST[21] =
function(
param_1, param_2, param_3, param_4)
local
var_1= 0
local
reg_1, reg_2, reg_3, reg_4
do
do
do
reg_1 = param_2
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = param_3
reg_2 = 0
reg_1 = reg_1 < reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_1
end
do
do
do
reg_1 = param_4
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_5
end
do
reg_1 = param_4
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
var_1 = reg_1
if reg_1 ~= 0 then
goto continue_at_6
end
do
reg_1 = param_3
if reg_1 ~= 0 then
goto continue_at_7
end
reg_1 = param_2
param_4 = reg_1
goto continue_at_3
::continue_at_7::
end
reg_1 = 0
reg_1 = load.i32_u8(MEMORY_LIST[0], reg_1 + 1049469)
goto continue_at_4
::continue_at_6::
end
reg_1 = param_4
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
reg_2 = var_1
reg_3 = param_2
reg_4 = param_3
reg_1 =
FUNC_LIST[7](reg_1, reg_2, reg_3, reg_4)
param_4 = reg_1
goto continue_at_3
::continue_at_5::
end
do
reg_1 = param_3
if reg_1 ~= 0 then
goto continue_at_5
end
reg_1 = param_2
param_4 = reg_1
goto continue_at_3
::continue_at_5::
end
reg_1 = 0
reg_1 = load.i32_u8(MEMORY_LIST[0], reg_1 + 1049469)
::continue_at_4::
end
reg_1 = param_3
reg_2 = param_2
reg_1 =
FUNC_LIST[5](reg_1, reg_2)
param_4 = reg_1
::continue_at_3::
end
do
reg_1 = param_4
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_3
end
reg_1 = param_1
reg_2 = param_3
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = param_1
reg_2 = param_4
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = 0
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
do return  end
::continue_at_3::
end
reg_1 = param_1
reg_2 = param_3
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = param_1
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
goto continue_at_0
::continue_at_2::
end
reg_1 = param_1
reg_2 = 0
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
goto continue_at_0
::continue_at_1::
end
reg_1 = param_1
reg_2 = 0
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
::continue_at_0::
end
reg_1 = param_1
reg_2 = 1
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
end
FUNC_LIST[22] =
function(
param_1, param_2)
local
var_1, var_2, var_3, var_4= 0, 0, 0, 0
local
reg_1, reg_2, reg_3, reg_4, reg_5
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 12)
var_1 = reg_1
do
do
do
reg_1 = param_2
reg_2 = 256
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 24)
var_2 = reg_1
do
do
do
reg_1 = var_1
reg_2 = param_1
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_5
end
reg_1 = param_1
reg_2 = 20
reg_3 = 16
reg_4 = param_1
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 20)
var_1 = reg_4
if reg_4 == 0 then
reg_2 = reg_3
end
reg_1 = reg_1 + reg_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
param_2 = reg_1
if reg_1 ~= 0 then
goto continue_at_4
end
reg_1 = 0
var_1 = reg_1
goto continue_at_3
::continue_at_5::
end
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
param_2 = reg_1
reg_2 = var_1
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = var_1
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
goto continue_at_3
::continue_at_4::
end
reg_1 = param_1
reg_2 = 20
reg_1 = reg_1 + reg_2
reg_2 = param_1
reg_3 = 16
reg_2 = reg_2 + reg_3
reg_3 = var_1
if reg_3 == 0 then
reg_1 = reg_2
end
var_3 = reg_1
do
::continue_at_4::
reg_1 = var_3
var_4 = reg_1
reg_1 = param_2
var_1 = reg_1
reg_2 = 20
reg_1 = reg_1 + reg_2
reg_2 = var_1
reg_3 = 16
reg_2 = reg_2 + reg_3
reg_3 = var_1
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 20)
param_2 = reg_3
if reg_3 == 0 then
reg_1 = reg_2
end
var_3 = reg_1
reg_1 = var_1
reg_2 = 20
reg_3 = 16
reg_4 = param_2
if reg_4 == 0 then
reg_2 = reg_3
end
reg_1 = reg_1 + reg_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
param_2 = reg_1
if reg_1 ~= 0 then
goto continue_at_4
end
end
reg_1 = var_4
reg_2 = 0
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
::continue_at_3::
end
reg_1 = var_2
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_0
end
do
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 28)
reg_2 = 2
reg_1 = shl.i32(reg_1, reg_2)
reg_2 = 1049492
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
reg_2 = param_1
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_3
end
reg_1 = var_2
reg_2 = 16
reg_3 = 20
reg_4 = var_2
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 16)
reg_5 = param_1
reg_4 = reg_4 == reg_5 and 1 or 0
if reg_4 == 0 then
reg_2 = reg_3
end
reg_1 = reg_1 + reg_2
reg_2 = var_1
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_0
end
goto continue_at_1
::continue_at_3::
end
reg_1 = param_2
reg_2 = var_1
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_1
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = 0
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049904)
reg_3 = -2
reg_4 = param_1
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 28)
reg_3 = rotl.i32(reg_3, reg_4)
reg_2 = band.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 1049904, reg_2)
goto continue_at_0
::continue_at_2::
end
do
reg_1 = var_1
reg_2 = param_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 8)
var_3 = reg_2
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = var_3
reg_2 = var_1
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = var_1
reg_2 = var_3
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
do return  end
::continue_at_2::
end
reg_1 = 0
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049900)
reg_3 = -2
reg_4 = param_2
reg_5 = 3
reg_4 = shr.u32(reg_4, reg_5)
reg_3 = rotl.i32(reg_3, reg_4)
reg_2 = band.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 1049900, reg_2)
do return  end
::continue_at_1::
end
reg_1 = var_1
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 24, reg_2)
do
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 16)
param_2 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = var_1
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 16, reg_2)
reg_1 = param_2
reg_2 = var_1
store.i32(MEMORY_LIST[0], reg_1 + 24, reg_2)
::continue_at_1::
end
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 20)
param_2 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = var_1
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 20, reg_2)
reg_1 = param_2
reg_2 = var_1
store.i32(MEMORY_LIST[0], reg_1 + 24, reg_2)
do return  end
::continue_at_0::
end
end
FUNC_LIST[23] =
function(
param_1, param_2)
local
var_1, var_2= 0, 0
local
reg_1, reg_2, reg_3, reg_4
reg_1 = param_1
reg_2 = param_2
reg_1 = reg_1 + reg_2
var_1 = reg_1
do
do
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
var_2 = reg_1
reg_2 = 1
reg_1 = band.i32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = var_2
reg_2 = 2
reg_1 = band.i32(reg_1, reg_2)
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_2 = reg_1
reg_2 = param_2
reg_1 = reg_1 + reg_2
param_2 = reg_1
do
reg_1 = param_1
reg_2 = var_2
reg_1 = reg_1 - reg_2
param_1 = reg_1
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049916)
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = var_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
reg_2 = 3
reg_1 = band.i32(reg_1, reg_2)
reg_2 = 3
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = 0
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 1049908, reg_2)
reg_1 = var_1
reg_2 = var_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 4)
reg_3 = -2
reg_2 = band.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = param_2
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_1
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
goto continue_at_0
::continue_at_2::
end
reg_1 = param_1
reg_2 = var_2
FUNC_LIST[22](reg_1, reg_2)
::continue_at_1::
end
do
do
do
do
reg_1 = var_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
var_2 = reg_1
reg_2 = 2
reg_1 = band.i32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_4
end
reg_1 = var_1
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049920)
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = var_1
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049916)
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = var_1
reg_2 = var_2
reg_3 = -8
reg_2 = band.i32(reg_2, reg_3)
var_2 = reg_2
FUNC_LIST[22](reg_1, reg_2)
reg_1 = param_1
reg_2 = var_2
reg_3 = param_2
reg_2 = reg_2 + reg_3
param_2 = reg_2
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = param_2
reg_1 = reg_1 + reg_2
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = param_1
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049916)
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_3
end
reg_1 = 0
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 1049908, reg_2)
do return  end
::continue_at_4::
end
reg_1 = var_1
reg_2 = var_2
reg_3 = -2
reg_2 = band.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = param_2
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = param_2
reg_1 = reg_1 + reg_2
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
::continue_at_3::
end
do
reg_1 = param_2
reg_2 = 256
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_3
end
reg_1 = param_1
reg_2 = param_2
FUNC_LIST[24](reg_1, reg_2)
do return  end
::continue_at_3::
end
reg_1 = param_2
reg_2 = -8
reg_1 = band.i32(reg_1, reg_2)
reg_2 = 1049636
reg_1 = reg_1 + reg_2
var_1 = reg_1
do
do
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049900)
var_2 = reg_1
reg_2 = 1
reg_3 = param_2
reg_4 = 3
reg_3 = shr.u32(reg_3, reg_4)
reg_2 = shl.i32(reg_2, reg_3)
param_2 = reg_2
reg_1 = band.i32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_4
end
reg_1 = 0
reg_2 = var_2
reg_3 = param_2
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 1049900, reg_2)
reg_1 = var_1
param_2 = reg_1
goto continue_at_3
::continue_at_4::
end
reg_1 = var_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
param_2 = reg_1
::continue_at_3::
end
reg_1 = var_1
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = param_2
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = param_1
reg_2 = var_1
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = param_1
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
do return  end
::continue_at_2::
end
reg_1 = 0
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 1049920, reg_2)
reg_1 = 0
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049912)
reg_3 = param_2
reg_2 = reg_2 + reg_3
param_2 = reg_2
store.i32(MEMORY_LIST[0], reg_1 + 1049912, reg_2)
reg_1 = param_1
reg_2 = param_2
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049916)
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = 0
reg_2 = 0
store.i32(MEMORY_LIST[0], reg_1 + 1049908, reg_2)
reg_1 = 0
reg_2 = 0
store.i32(MEMORY_LIST[0], reg_1 + 1049916, reg_2)
do return  end
::continue_at_1::
end
reg_1 = 0
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 1049916, reg_2)
reg_1 = 0
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049908)
reg_3 = param_2
reg_2 = reg_2 + reg_3
param_2 = reg_2
store.i32(MEMORY_LIST[0], reg_1 + 1049908, reg_2)
reg_1 = param_1
reg_2 = param_2
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = param_2
reg_1 = reg_1 + reg_2
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
do return  end
::continue_at_0::
end
end
FUNC_LIST[24] =
function(
param_1, param_2)
local
var_1, var_2, var_3, var_4= 0, 0, 0, 0
local
reg_1, reg_2, reg_3, reg_4, reg_5
reg_1 = 0
var_1 = reg_1
do
reg_1 = param_2
reg_2 = 256
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = 31
var_1 = reg_1
reg_1 = param_2
reg_2 = 16777215
reg_1 = gt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = param_2
reg_2 = 6
reg_3 = param_2
reg_4 = 8
reg_3 = shr.u32(reg_3, reg_4)
reg_3 = clz.i32(reg_3)
var_1 = reg_3
reg_2 = reg_2 - reg_3
reg_1 = shr.u32(reg_1, reg_2)
reg_2 = 1
reg_1 = band.i32(reg_1, reg_2)
reg_2 = var_1
reg_3 = 1
reg_2 = shl.i32(reg_2, reg_3)
reg_1 = reg_1 - reg_2
reg_2 = 62
reg_1 = reg_1 + reg_2
var_1 = reg_1
::continue_at_0::
end
reg_1 = param_1
reg_2 = 0
store.i64(MEMORY_LIST[0], reg_1 + 16, reg_2)
reg_1 = param_1
reg_2 = var_1
store.i32(MEMORY_LIST[0], reg_1 + 28, reg_2)
reg_1 = var_1
reg_2 = 2
reg_1 = shl.i32(reg_1, reg_2)
reg_2 = 1049492
reg_1 = reg_1 + reg_2
var_2 = reg_1
do
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049904)
reg_2 = 1
reg_3 = var_1
reg_2 = shl.i32(reg_2, reg_3)
var_3 = reg_2
reg_1 = band.i32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = var_2
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = param_1
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 24, reg_2)
reg_1 = param_1
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = param_1
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = 0
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049904)
reg_3 = var_3
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 1049904, reg_2)
do return  end
::continue_at_0::
end
do
do
do
reg_1 = var_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_3 = reg_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
reg_2 = -8
reg_1 = band.i32(reg_1, reg_2)
reg_2 = param_2
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = var_3
var_1 = reg_1
goto continue_at_1
::continue_at_2::
end
reg_1 = param_2
reg_2 = 0
reg_3 = 25
reg_4 = var_1
reg_5 = 1
reg_4 = shr.u32(reg_4, reg_5)
reg_3 = reg_3 - reg_4
reg_4 = var_1
reg_5 = 31
reg_4 = reg_4 == reg_5 and 1 or 0
if reg_4 == 0 then
reg_2 = reg_3
end
reg_1 = shl.i32(reg_1, reg_2)
var_2 = reg_1
do
::continue_at_2::
reg_1 = var_3
reg_2 = var_2
reg_3 = 29
reg_2 = shr.u32(reg_2, reg_3)
reg_3 = 4
reg_2 = band.i32(reg_2, reg_3)
reg_1 = reg_1 + reg_2
reg_2 = 16
reg_1 = reg_1 + reg_2
var_4 = reg_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_1 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = var_2
reg_2 = 1
reg_1 = shl.i32(reg_1, reg_2)
var_2 = reg_1
reg_1 = var_1
var_3 = reg_1
reg_1 = var_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
reg_2 = -8
reg_1 = band.i32(reg_1, reg_2)
reg_2 = param_2
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
end
::continue_at_1::
end
reg_1 = var_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
var_2 = reg_1
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = var_1
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = param_1
reg_2 = 0
store.i32(MEMORY_LIST[0], reg_1 + 24, reg_2)
reg_1 = param_1
reg_2 = var_1
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = param_1
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
do return  end
::continue_at_0::
end
reg_1 = var_4
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = param_1
reg_2 = var_3
store.i32(MEMORY_LIST[0], reg_1 + 24, reg_2)
reg_1 = param_1
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = param_1
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
end
FUNC_LIST[25] =
function(
param_1)
local
var_1, var_2, var_3, var_4, var_5= 0, 0, 0, 0, 0
local
reg_1, reg_2, reg_3, reg_4, reg_5
reg_1 = param_1
reg_2 = -8
reg_1 = reg_1 + reg_2
var_1 = reg_1
reg_2 = param_1
reg_3 = -4
reg_2 = reg_2 + reg_3
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 0)
var_2 = reg_2
reg_3 = -8
reg_2 = band.i32(reg_2, reg_3)
param_1 = reg_2
reg_1 = reg_1 + reg_2
var_3 = reg_1
do
do
do
do
reg_1 = var_2
reg_2 = 1
reg_1 = band.i32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_3
end
reg_1 = var_2
reg_2 = 2
reg_1 = band.i32(reg_1, reg_2)
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = var_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_2 = reg_1
reg_2 = param_1
reg_1 = reg_1 + reg_2
param_1 = reg_1
do
reg_1 = var_1
reg_2 = var_2
reg_1 = reg_1 - reg_2
var_1 = reg_1
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049916)
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_4
end
reg_1 = var_3
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
reg_2 = 3
reg_1 = band.i32(reg_1, reg_2)
reg_2 = 3
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_3
end
reg_1 = 0
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 1049908, reg_2)
reg_1 = var_3
reg_2 = var_3
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 4)
reg_3 = -2
reg_2 = band.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_1
reg_2 = param_1
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_3
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
do return  end
::continue_at_4::
end
reg_1 = var_1
reg_2 = var_2
FUNC_LIST[22](reg_1, reg_2)
::continue_at_3::
end
do
do
do
reg_1 = var_3
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
var_2 = reg_1
reg_2 = 2
reg_1 = band.i32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_5
end
reg_1 = var_3
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049920)
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_3
end
reg_1 = var_3
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049916)
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = var_3
reg_2 = var_2
reg_3 = -8
reg_2 = band.i32(reg_2, reg_3)
var_2 = reg_2
FUNC_LIST[22](reg_1, reg_2)
reg_1 = var_1
reg_2 = var_2
reg_3 = param_1
reg_2 = reg_2 + reg_3
param_1 = reg_2
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_1
reg_2 = param_1
reg_1 = reg_1 + reg_2
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_1
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049916)
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_4
end
reg_1 = 0
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 1049908, reg_2)
do return  end
::continue_at_5::
end
reg_1 = var_3
reg_2 = var_2
reg_3 = -2
reg_2 = band.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_1
reg_2 = param_1
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_1
reg_2 = param_1
reg_1 = reg_1 + reg_2
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
::continue_at_4::
end
reg_1 = param_1
reg_2 = 256
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = var_1
reg_2 = param_1
FUNC_LIST[24](reg_1, reg_2)
reg_1 = 0
var_1 = reg_1
reg_1 = 0
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049940)
reg_3 = -1
reg_2 = reg_2 + reg_3
param_1 = reg_2
store.i32(MEMORY_LIST[0], reg_1 + 1049940, reg_2)
reg_1 = param_1
if reg_1 ~= 0 then
goto continue_at_2
end
do
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049628)
param_1 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_4
end
reg_1 = 0
var_1 = reg_1
do
::continue_at_5::
reg_1 = var_1
reg_2 = 1
reg_1 = reg_1 + reg_2
var_1 = reg_1
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
param_1 = reg_1
if reg_1 ~= 0 then
goto continue_at_5
end
end
::continue_at_4::
end
reg_1 = 0
reg_2 = var_1
reg_3 = 4095
reg_4 = var_1
reg_5 = 4095
reg_4 = gt.u32(reg_4, reg_5)
if reg_4 == 0 then
reg_2 = reg_3
end
store.i32(MEMORY_LIST[0], reg_1 + 1049940, reg_2)
do return  end
::continue_at_3::
end
reg_1 = 0
reg_2 = var_1
store.i32(MEMORY_LIST[0], reg_1 + 1049920, reg_2)
reg_1 = 0
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049912)
reg_3 = param_1
reg_2 = reg_2 + reg_3
param_1 = reg_2
store.i32(MEMORY_LIST[0], reg_1 + 1049912, reg_2)
reg_1 = var_1
reg_2 = param_1
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
do
reg_1 = var_1
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049916)
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_3
end
reg_1 = 0
reg_2 = 0
store.i32(MEMORY_LIST[0], reg_1 + 1049908, reg_2)
reg_1 = 0
reg_2 = 0
store.i32(MEMORY_LIST[0], reg_1 + 1049916, reg_2)
::continue_at_3::
end
reg_1 = param_1
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049932)
var_4 = reg_2
reg_1 = le.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049920)
var_3 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = 0
var_1 = reg_1
do
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049912)
var_5 = reg_1
reg_2 = 41
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_3
end
reg_1 = 1049620
param_1 = reg_1
do
::continue_at_4::
do
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_2 = reg_1
reg_2 = var_3
reg_1 = gt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_5
end
reg_1 = var_2
reg_2 = param_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 4)
reg_1 = reg_1 + reg_2
reg_2 = var_3
reg_1 = gt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_3
end
::continue_at_5::
end
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
param_1 = reg_1
if reg_1 ~= 0 then
goto continue_at_4
end
end
::continue_at_3::
end
do
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049628)
param_1 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_3
end
reg_1 = 0
var_1 = reg_1
do
::continue_at_4::
reg_1 = var_1
reg_2 = 1
reg_1 = reg_1 + reg_2
var_1 = reg_1
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
param_1 = reg_1
if reg_1 ~= 0 then
goto continue_at_4
end
end
::continue_at_3::
end
reg_1 = 0
reg_2 = var_1
reg_3 = 4095
reg_4 = var_1
reg_5 = 4095
reg_4 = gt.u32(reg_4, reg_5)
if reg_4 == 0 then
reg_2 = reg_3
end
store.i32(MEMORY_LIST[0], reg_1 + 1049940, reg_2)
reg_1 = var_5
reg_2 = var_4
reg_1 = le.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = 0
reg_2 = -1
store.i32(MEMORY_LIST[0], reg_1 + 1049932, reg_2)
::continue_at_2::
end
do return  end
::continue_at_1::
end
reg_1 = param_1
reg_2 = -8
reg_1 = band.i32(reg_1, reg_2)
reg_2 = 1049636
reg_1 = reg_1 + reg_2
var_3 = reg_1
do
do
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049900)
var_2 = reg_1
reg_2 = 1
reg_3 = param_1
reg_4 = 3
reg_3 = shr.u32(reg_3, reg_4)
reg_2 = shl.i32(reg_2, reg_3)
param_1 = reg_2
reg_1 = band.i32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = 0
reg_2 = var_2
reg_3 = param_1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 1049900, reg_2)
reg_1 = var_3
param_1 = reg_1
goto continue_at_1
::continue_at_2::
end
reg_1 = var_3
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
param_1 = reg_1
::continue_at_1::
end
reg_1 = var_3
reg_2 = var_1
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = param_1
reg_2 = var_1
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = var_1
reg_2 = var_3
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = var_1
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
do return  end
::continue_at_0::
end
reg_1 = 0
reg_2 = var_1
store.i32(MEMORY_LIST[0], reg_1 + 1049916, reg_2)
reg_1 = 0
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049908)
reg_3 = param_1
reg_2 = reg_2 + reg_3
param_1 = reg_2
store.i32(MEMORY_LIST[0], reg_1 + 1049908, reg_2)
reg_1 = var_1
reg_2 = param_1
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_1
reg_2 = param_1
reg_1 = reg_1 + reg_2
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
end
FUNC_LIST[26] =
function(
param_1)
local
var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10= 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
local
reg_1, reg_2, reg_3, reg_4, reg_5, reg_6
reg_1 = GLOBAL_LIST[0].value
reg_2 = 16
reg_1 = reg_1 - reg_2
var_1 = reg_1
GLOBAL_LIST[0].value = reg_1
do
do
do
do
do
do
do
do
reg_1 = param_1
reg_2 = 245
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_7
end
reg_1 = 0
var_2 = reg_1
reg_1 = param_1
reg_2 = -65587
reg_1 = ge.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = param_1
reg_2 = 11
reg_1 = reg_1 + reg_2
param_1 = reg_1
reg_2 = -8
reg_1 = band.i32(reg_1, reg_2)
var_3 = reg_1
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049904)
var_4 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_3
end
reg_1 = 0
var_5 = reg_1
do
reg_1 = var_3
reg_2 = 256
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_8
end
reg_1 = 31
var_5 = reg_1
reg_1 = var_3
reg_2 = 16777215
reg_1 = gt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_8
end
reg_1 = var_3
reg_2 = 6
reg_3 = param_1
reg_4 = 8
reg_3 = shr.u32(reg_3, reg_4)
reg_3 = clz.i32(reg_3)
param_1 = reg_3
reg_2 = reg_2 - reg_3
reg_1 = shr.u32(reg_1, reg_2)
reg_2 = 1
reg_1 = band.i32(reg_1, reg_2)
reg_2 = param_1
reg_3 = 1
reg_2 = shl.i32(reg_2, reg_3)
reg_1 = reg_1 - reg_2
reg_2 = 62
reg_1 = reg_1 + reg_2
var_5 = reg_1
::continue_at_8::
end
reg_1 = 0
reg_2 = var_3
reg_1 = reg_1 - reg_2
var_2 = reg_1
do
reg_1 = var_5
reg_2 = 2
reg_1 = shl.i32(reg_1, reg_2)
reg_2 = 1049492
reg_1 = reg_1 + reg_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_6 = reg_1
if reg_1 ~= 0 then
goto continue_at_8
end
reg_1 = 0
param_1 = reg_1
reg_1 = 0
var_7 = reg_1
goto continue_at_6
::continue_at_8::
end
reg_1 = 0
param_1 = reg_1
reg_1 = var_3
reg_2 = 0
reg_3 = 25
reg_4 = var_5
reg_5 = 1
reg_4 = shr.u32(reg_4, reg_5)
reg_3 = reg_3 - reg_4
reg_4 = var_5
reg_5 = 31
reg_4 = reg_4 == reg_5 and 1 or 0
if reg_4 == 0 then
reg_2 = reg_3
end
reg_1 = shl.i32(reg_1, reg_2)
var_8 = reg_1
reg_1 = 0
var_7 = reg_1
do
::continue_at_8::
do
reg_1 = var_6
var_6 = reg_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
reg_2 = -8
reg_1 = band.i32(reg_1, reg_2)
var_9 = reg_1
reg_2 = var_3
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_9
end
reg_1 = var_9
reg_2 = var_3
reg_1 = reg_1 - reg_2
var_9 = reg_1
reg_2 = var_2
reg_1 = ge.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_9
end
reg_1 = var_9
var_2 = reg_1
reg_1 = var_6
var_7 = reg_1
reg_1 = var_9
if reg_1 ~= 0 then
goto continue_at_9
end
reg_1 = 0
var_2 = reg_1
reg_1 = var_6
var_7 = reg_1
reg_1 = var_6
param_1 = reg_1
goto continue_at_5
::continue_at_9::
end
reg_1 = var_6
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 20)
var_9 = reg_1
reg_2 = param_1
reg_3 = var_9
reg_4 = var_6
reg_5 = var_8
reg_6 = 29
reg_5 = shr.u32(reg_5, reg_6)
reg_6 = 4
reg_5 = band.i32(reg_5, reg_6)
reg_4 = reg_4 + reg_5
reg_5 = 16
reg_4 = reg_4 + reg_5
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 0)
var_6 = reg_4
reg_3 = reg_3 ~= reg_4 and 1 or 0
if reg_3 == 0 then
reg_1 = reg_2
end
reg_2 = param_1
reg_3 = var_9
if reg_3 == 0 then
reg_1 = reg_2
end
param_1 = reg_1
reg_1 = var_8
reg_2 = 1
reg_1 = shl.i32(reg_1, reg_2)
var_8 = reg_1
reg_1 = var_6
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_6
end
goto continue_at_8
end
::continue_at_7::
end
do
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049900)
var_6 = reg_1
reg_2 = 16
reg_3 = param_1
reg_4 = 11
reg_3 = reg_3 + reg_4
reg_4 = 504
reg_3 = band.i32(reg_3, reg_4)
reg_4 = param_1
reg_5 = 11
reg_4 = lt.u32(reg_4, reg_5)
if reg_4 == 0 then
reg_2 = reg_3
end
var_3 = reg_2
reg_3 = 3
reg_2 = shr.u32(reg_2, reg_3)
var_2 = reg_2
reg_1 = shr.u32(reg_1, reg_2)
param_1 = reg_1
reg_2 = 3
reg_1 = band.i32(reg_1, reg_2)
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_7
end
do
do
reg_1 = param_1
reg_2 = -1
reg_1 = bxor.i32(reg_1, reg_2)
reg_2 = 1
reg_1 = band.i32(reg_1, reg_2)
reg_2 = var_2
reg_1 = reg_1 + reg_2
var_3 = reg_1
reg_2 = 3
reg_1 = shl.i32(reg_1, reg_2)
param_1 = reg_1
reg_2 = 1049636
reg_1 = reg_1 + reg_2
var_2 = reg_1
reg_2 = param_1
reg_3 = 1049644
reg_2 = reg_2 + reg_3
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 0)
param_1 = reg_2
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 8)
var_7 = reg_2
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_9
end
reg_1 = var_7
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = var_2
reg_2 = var_7
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
goto continue_at_8
::continue_at_9::
end
reg_1 = 0
reg_2 = var_6
reg_3 = -2
reg_4 = var_3
reg_3 = rotl.i32(reg_3, reg_4)
reg_2 = band.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 1049900, reg_2)
::continue_at_8::
end
reg_1 = param_1
reg_2 = 8
reg_1 = reg_1 + reg_2
var_2 = reg_1
reg_1 = param_1
reg_2 = var_3
reg_3 = 3
reg_2 = shl.i32(reg_2, reg_3)
var_3 = reg_2
reg_3 = 3
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = var_3
reg_1 = reg_1 + reg_2
param_1 = reg_1
reg_2 = param_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 4)
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
goto continue_at_0
::continue_at_7::
end
reg_1 = var_3
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049908)
reg_1 = le.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_3
end
do
do
do
reg_1 = param_1
if reg_1 ~= 0 then
goto continue_at_9
end
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049904)
param_1 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_3
end
reg_1 = param_1
reg_1 = ctz.i32(reg_1)
reg_2 = 2
reg_1 = shl.i32(reg_1, reg_2)
reg_2 = 1049492
reg_1 = reg_1 + reg_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_7 = reg_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
reg_2 = -8
reg_1 = band.i32(reg_1, reg_2)
reg_2 = var_3
reg_1 = reg_1 - reg_2
var_2 = reg_1
reg_1 = var_7
var_6 = reg_1
do
::continue_at_10::
do
reg_1 = var_7
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 16)
param_1 = reg_1
if reg_1 ~= 0 then
goto continue_at_11
end
reg_1 = var_7
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 20)
param_1 = reg_1
if reg_1 ~= 0 then
goto continue_at_11
end
reg_1 = var_6
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 24)
var_5 = reg_1
do
do
do
reg_1 = var_6
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 12)
param_1 = reg_1
reg_2 = var_6
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_14
end
reg_1 = var_6
reg_2 = 20
reg_3 = 16
reg_4 = var_6
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 20)
param_1 = reg_4
if reg_4 == 0 then
reg_2 = reg_3
end
reg_1 = reg_1 + reg_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_7 = reg_1
if reg_1 ~= 0 then
goto continue_at_13
end
reg_1 = 0
param_1 = reg_1
goto continue_at_12
::continue_at_14::
end
reg_1 = var_6
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
var_7 = reg_1
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = param_1
reg_2 = var_7
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
goto continue_at_12
::continue_at_13::
end
reg_1 = var_6
reg_2 = 20
reg_1 = reg_1 + reg_2
reg_2 = var_6
reg_3 = 16
reg_2 = reg_2 + reg_3
reg_3 = param_1
if reg_3 == 0 then
reg_1 = reg_2
end
var_8 = reg_1
do
::continue_at_13::
reg_1 = var_8
var_9 = reg_1
reg_1 = var_7
param_1 = reg_1
reg_2 = 20
reg_1 = reg_1 + reg_2
reg_2 = param_1
reg_3 = 16
reg_2 = reg_2 + reg_3
reg_3 = param_1
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 20)
var_7 = reg_3
if reg_3 == 0 then
reg_1 = reg_2
end
var_8 = reg_1
reg_1 = param_1
reg_2 = 20
reg_3 = 16
reg_4 = var_7
if reg_4 == 0 then
reg_2 = reg_3
end
reg_1 = reg_1 + reg_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_7 = reg_1
if reg_1 ~= 0 then
goto continue_at_13
end
end
reg_1 = var_9
reg_2 = 0
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
::continue_at_12::
end
reg_1 = var_5
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_7
end
do
reg_1 = var_6
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 28)
reg_2 = 2
reg_1 = shl.i32(reg_1, reg_2)
reg_2 = 1049492
reg_1 = reg_1 + reg_2
var_7 = reg_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
reg_2 = var_6
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_12
end
reg_1 = var_5
reg_2 = 16
reg_3 = 20
reg_4 = var_5
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 16)
reg_5 = var_6
reg_4 = reg_4 == reg_5 and 1 or 0
if reg_4 == 0 then
reg_2 = reg_3
end
reg_1 = reg_1 + reg_2
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = param_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_7
end
goto continue_at_8
::continue_at_12::
end
reg_1 = var_7
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = param_1
if reg_1 ~= 0 then
goto continue_at_8
end
reg_1 = 0
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049904)
reg_3 = -2
reg_4 = var_6
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 28)
reg_3 = rotl.i32(reg_3, reg_4)
reg_2 = band.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 1049904, reg_2)
goto continue_at_7
::continue_at_11::
end
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
reg_2 = -8
reg_1 = band.i32(reg_1, reg_2)
reg_2 = var_3
reg_1 = reg_1 - reg_2
var_7 = reg_1
reg_2 = var_2
reg_3 = var_7
reg_4 = var_2
reg_3 = lt.u32(reg_3, reg_4)
var_7 = reg_3
if reg_3 == 0 then
reg_1 = reg_2
end
var_2 = reg_1
reg_1 = param_1
reg_2 = var_6
reg_3 = var_7
if reg_3 == 0 then
reg_1 = reg_2
end
var_6 = reg_1
reg_1 = param_1
var_7 = reg_1
goto continue_at_10
end
::continue_at_9::
end
do
do
reg_1 = param_1
reg_2 = var_2
reg_1 = shl.i32(reg_1, reg_2)
reg_2 = 2
reg_3 = var_2
reg_2 = shl.i32(reg_2, reg_3)
param_1 = reg_2
reg_3 = 0
reg_4 = param_1
reg_3 = reg_3 - reg_4
reg_2 = bor.i32(reg_2, reg_3)
reg_1 = band.i32(reg_1, reg_2)
reg_1 = ctz.i32(reg_1)
var_2 = reg_1
reg_2 = 3
reg_1 = shl.i32(reg_1, reg_2)
param_1 = reg_1
reg_2 = 1049636
reg_1 = reg_1 + reg_2
var_7 = reg_1
reg_2 = param_1
reg_3 = 1049644
reg_2 = reg_2 + reg_3
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 0)
param_1 = reg_2
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 8)
var_8 = reg_2
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_10
end
reg_1 = var_8
reg_2 = var_7
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = var_7
reg_2 = var_8
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
goto continue_at_9
::continue_at_10::
end
reg_1 = 0
reg_2 = var_6
reg_3 = -2
reg_4 = var_2
reg_3 = rotl.i32(reg_3, reg_4)
reg_2 = band.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 1049900, reg_2)
::continue_at_9::
end
reg_1 = param_1
reg_2 = var_3
reg_3 = 3
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = var_3
reg_1 = reg_1 + reg_2
var_8 = reg_1
reg_2 = var_2
reg_3 = 3
reg_2 = shl.i32(reg_2, reg_3)
var_2 = reg_2
reg_3 = var_3
reg_2 = reg_2 - reg_3
var_7 = reg_2
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = var_2
reg_1 = reg_1 + reg_2
reg_2 = var_7
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
do
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049908)
var_6 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_9
end
reg_1 = var_6
reg_2 = -8
reg_1 = band.i32(reg_1, reg_2)
reg_2 = 1049636
reg_1 = reg_1 + reg_2
var_2 = reg_1
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049916)
var_3 = reg_1
do
do
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049900)
var_9 = reg_1
reg_2 = 1
reg_3 = var_6
reg_4 = 3
reg_3 = shr.u32(reg_3, reg_4)
reg_2 = shl.i32(reg_2, reg_3)
var_6 = reg_2
reg_1 = band.i32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_11
end
reg_1 = 0
reg_2 = var_9
reg_3 = var_6
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 1049900, reg_2)
reg_1 = var_2
var_6 = reg_1
goto continue_at_10
::continue_at_11::
end
reg_1 = var_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
var_6 = reg_1
::continue_at_10::
end
reg_1 = var_2
reg_2 = var_3
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = var_6
reg_2 = var_3
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = var_3
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = var_3
reg_2 = var_6
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
::continue_at_9::
end
reg_1 = param_1
reg_2 = 8
reg_1 = reg_1 + reg_2
var_2 = reg_1
reg_1 = 0
reg_2 = var_8
store.i32(MEMORY_LIST[0], reg_1 + 1049916, reg_2)
reg_1 = 0
reg_2 = var_7
store.i32(MEMORY_LIST[0], reg_1 + 1049908, reg_2)
goto continue_at_0
::continue_at_8::
end
reg_1 = param_1
reg_2 = var_5
store.i32(MEMORY_LIST[0], reg_1 + 24, reg_2)
do
reg_1 = var_6
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 16)
var_7 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_8
end
reg_1 = param_1
reg_2 = var_7
store.i32(MEMORY_LIST[0], reg_1 + 16, reg_2)
reg_1 = var_7
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 24, reg_2)
::continue_at_8::
end
reg_1 = var_6
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 20)
var_7 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_7
end
reg_1 = param_1
reg_2 = var_7
store.i32(MEMORY_LIST[0], reg_1 + 20, reg_2)
reg_1 = var_7
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 24, reg_2)
::continue_at_7::
end
do
do
do
reg_1 = var_2
reg_2 = 16
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_9
end
reg_1 = var_6
reg_2 = var_3
reg_3 = 3
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_6
reg_2 = var_3
reg_1 = reg_1 + reg_2
var_3 = reg_1
reg_2 = var_2
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_3
reg_2 = var_2
reg_1 = reg_1 + reg_2
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049908)
var_8 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_8
end
reg_1 = var_8
reg_2 = -8
reg_1 = band.i32(reg_1, reg_2)
reg_2 = 1049636
reg_1 = reg_1 + reg_2
var_7 = reg_1
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049916)
param_1 = reg_1
do
do
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049900)
var_9 = reg_1
reg_2 = 1
reg_3 = var_8
reg_4 = 3
reg_3 = shr.u32(reg_3, reg_4)
reg_2 = shl.i32(reg_2, reg_3)
var_8 = reg_2
reg_1 = band.i32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_11
end
reg_1 = 0
reg_2 = var_9
reg_3 = var_8
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 1049900, reg_2)
reg_1 = var_7
var_8 = reg_1
goto continue_at_10
::continue_at_11::
end
reg_1 = var_7
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
var_8 = reg_1
::continue_at_10::
end
reg_1 = var_7
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = var_8
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = param_1
reg_2 = var_7
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = param_1
reg_2 = var_8
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
goto continue_at_8
::continue_at_9::
end
reg_1 = var_6
reg_2 = var_2
reg_3 = var_3
reg_2 = reg_2 + reg_3
param_1 = reg_2
reg_3 = 3
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_6
reg_2 = param_1
reg_1 = reg_1 + reg_2
param_1 = reg_1
reg_2 = param_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 4)
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
goto continue_at_7
::continue_at_8::
end
reg_1 = 0
reg_2 = var_3
store.i32(MEMORY_LIST[0], reg_1 + 1049916, reg_2)
reg_1 = 0
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 1049908, reg_2)
::continue_at_7::
end
reg_1 = var_6
reg_2 = 8
reg_1 = reg_1 + reg_2
var_2 = reg_1
goto continue_at_0
::continue_at_6::
end
do
reg_1 = param_1
reg_2 = var_7
reg_1 = bor.i32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_6
end
reg_1 = 0
var_7 = reg_1
reg_1 = 2
reg_2 = var_5
reg_1 = shl.i32(reg_1, reg_2)
param_1 = reg_1
reg_2 = 0
reg_3 = param_1
reg_2 = reg_2 - reg_3
reg_1 = bor.i32(reg_1, reg_2)
reg_2 = var_4
reg_1 = band.i32(reg_1, reg_2)
param_1 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_3
end
reg_1 = param_1
reg_1 = ctz.i32(reg_1)
reg_2 = 2
reg_1 = shl.i32(reg_1, reg_2)
reg_2 = 1049492
reg_1 = reg_1 + reg_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
param_1 = reg_1
::continue_at_6::
end
reg_1 = param_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_4
end
::continue_at_5::
end
do
::continue_at_5::
reg_1 = param_1
reg_2 = var_7
reg_3 = param_1
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 4)
reg_4 = -8
reg_3 = band.i32(reg_3, reg_4)
var_6 = reg_3
reg_4 = var_3
reg_3 = reg_3 - reg_4
var_9 = reg_3
reg_4 = var_2
reg_3 = lt.u32(reg_3, reg_4)
var_5 = reg_3
if reg_3 == 0 then
reg_1 = reg_2
end
var_4 = reg_1
reg_1 = var_6
reg_2 = var_3
reg_1 = lt.u32(reg_1, reg_2)
var_8 = reg_1
reg_1 = var_9
reg_2 = var_2
reg_3 = var_5
if reg_3 == 0 then
reg_1 = reg_2
end
var_9 = reg_1
do
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 16)
var_6 = reg_1
if reg_1 ~= 0 then
goto continue_at_6
end
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 20)
var_6 = reg_1
::continue_at_6::
end
reg_1 = var_7
reg_2 = var_4
reg_3 = var_8
if reg_3 == 0 then
reg_1 = reg_2
end
var_7 = reg_1
reg_1 = var_2
reg_2 = var_9
reg_3 = var_8
if reg_3 == 0 then
reg_1 = reg_2
end
var_2 = reg_1
reg_1 = var_6
param_1 = reg_1
reg_1 = var_6
if reg_1 ~= 0 then
goto continue_at_5
end
end
::continue_at_4::
end
reg_1 = var_7
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_3
end
do
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049908)
param_1 = reg_1
reg_2 = var_3
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_4
end
reg_1 = var_2
reg_2 = param_1
reg_3 = var_3
reg_2 = reg_2 - reg_3
reg_1 = ge.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_3
end
::continue_at_4::
end
reg_1 = var_7
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 24)
var_5 = reg_1
do
do
do
reg_1 = var_7
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 12)
param_1 = reg_1
reg_2 = var_7
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_6
end
reg_1 = var_7
reg_2 = 20
reg_3 = 16
reg_4 = var_7
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 20)
param_1 = reg_4
if reg_4 == 0 then
reg_2 = reg_3
end
reg_1 = reg_1 + reg_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_6 = reg_1
if reg_1 ~= 0 then
goto continue_at_5
end
reg_1 = 0
param_1 = reg_1
goto continue_at_4
::continue_at_6::
end
reg_1 = var_7
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
var_6 = reg_1
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = param_1
reg_2 = var_6
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
goto continue_at_4
::continue_at_5::
end
reg_1 = var_7
reg_2 = 20
reg_1 = reg_1 + reg_2
reg_2 = var_7
reg_3 = 16
reg_2 = reg_2 + reg_3
reg_3 = param_1
if reg_3 == 0 then
reg_1 = reg_2
end
var_8 = reg_1
do
::continue_at_5::
reg_1 = var_8
var_9 = reg_1
reg_1 = var_6
param_1 = reg_1
reg_2 = 20
reg_1 = reg_1 + reg_2
reg_2 = param_1
reg_3 = 16
reg_2 = reg_2 + reg_3
reg_3 = param_1
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 20)
var_6 = reg_3
if reg_3 == 0 then
reg_1 = reg_2
end
var_8 = reg_1
reg_1 = param_1
reg_2 = 20
reg_3 = 16
reg_4 = var_6
if reg_4 == 0 then
reg_2 = reg_3
end
reg_1 = reg_1 + reg_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_6 = reg_1
if reg_1 ~= 0 then
goto continue_at_5
end
end
reg_1 = var_9
reg_2 = 0
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
::continue_at_4::
end
reg_1 = var_5
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_1
end
do
reg_1 = var_7
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 28)
reg_2 = 2
reg_1 = shl.i32(reg_1, reg_2)
reg_2 = 1049492
reg_1 = reg_1 + reg_2
var_6 = reg_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
reg_2 = var_7
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_4
end
reg_1 = var_5
reg_2 = 16
reg_3 = 20
reg_4 = var_5
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 16)
reg_5 = var_7
reg_4 = reg_4 == reg_5 and 1 or 0
if reg_4 == 0 then
reg_2 = reg_3
end
reg_1 = reg_1 + reg_2
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = param_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_1
end
goto continue_at_2
::continue_at_4::
end
reg_1 = var_6
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = param_1
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = 0
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049904)
reg_3 = -2
reg_4 = var_7
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 28)
reg_3 = rotl.i32(reg_3, reg_4)
reg_2 = band.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 1049904, reg_2)
goto continue_at_1
::continue_at_3::
end
do
do
do
do
do
do
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049908)
param_1 = reg_1
reg_2 = var_3
reg_1 = ge.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_8
end
do
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049912)
param_1 = reg_1
reg_2 = var_3
reg_1 = gt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_9
end
reg_1 = var_1
reg_2 = 4
reg_1 = reg_1 + reg_2
reg_2 = 1049944
reg_3 = var_3
reg_4 = 65583
reg_3 = reg_3 + reg_4
reg_4 = -65536
reg_3 = band.i32(reg_3, reg_4)
FUNC_LIST[43](reg_1, reg_2, reg_3)
do
reg_1 = var_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
var_6 = reg_1
if reg_1 ~= 0 then
goto continue_at_10
end
reg_1 = 0
var_2 = reg_1
goto continue_at_0
::continue_at_10::
end
reg_1 = var_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 12)
var_5 = reg_1
reg_1 = 0
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049924)
reg_3 = var_1
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 8)
var_9 = reg_3
reg_2 = reg_2 + reg_3
param_1 = reg_2
store.i32(MEMORY_LIST[0], reg_1 + 1049924, reg_2)
reg_1 = 0
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049928)
var_2 = reg_2
reg_3 = param_1
reg_4 = var_2
reg_5 = param_1
reg_4 = gt.u32(reg_4, reg_5)
if reg_4 == 0 then
reg_2 = reg_3
end
store.i32(MEMORY_LIST[0], reg_1 + 1049928, reg_2)
do
do
do
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049920)
var_2 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_12
end
reg_1 = 1049620
param_1 = reg_1
do
::continue_at_13::
reg_1 = var_6
reg_2 = param_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 0)
var_7 = reg_2
reg_3 = param_1
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 4)
var_8 = reg_3
reg_2 = reg_2 + reg_3
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_11
end
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
param_1 = reg_1
if reg_1 ~= 0 then
goto continue_at_13
end
goto continue_at_10
end
::continue_at_12::
end
do
do
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049936)
param_1 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_13
end
reg_1 = var_6
reg_2 = param_1
reg_1 = ge.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_12
end
::continue_at_13::
end
reg_1 = 0
reg_2 = var_6
store.i32(MEMORY_LIST[0], reg_1 + 1049936, reg_2)
::continue_at_12::
end
reg_1 = 0
reg_2 = 4095
store.i32(MEMORY_LIST[0], reg_1 + 1049940, reg_2)
reg_1 = 0
reg_2 = var_5
store.i32(MEMORY_LIST[0], reg_1 + 1049632, reg_2)
reg_1 = 0
reg_2 = var_9
store.i32(MEMORY_LIST[0], reg_1 + 1049624, reg_2)
reg_1 = 0
reg_2 = var_6
store.i32(MEMORY_LIST[0], reg_1 + 1049620, reg_2)
reg_1 = 0
reg_2 = 1049636
store.i32(MEMORY_LIST[0], reg_1 + 1049648, reg_2)
reg_1 = 0
reg_2 = 1049644
store.i32(MEMORY_LIST[0], reg_1 + 1049656, reg_2)
reg_1 = 0
reg_2 = 1049636
store.i32(MEMORY_LIST[0], reg_1 + 1049644, reg_2)
reg_1 = 0
reg_2 = 1049652
store.i32(MEMORY_LIST[0], reg_1 + 1049664, reg_2)
reg_1 = 0
reg_2 = 1049644
store.i32(MEMORY_LIST[0], reg_1 + 1049652, reg_2)
reg_1 = 0
reg_2 = 1049660
store.i32(MEMORY_LIST[0], reg_1 + 1049672, reg_2)
reg_1 = 0
reg_2 = 1049652
store.i32(MEMORY_LIST[0], reg_1 + 1049660, reg_2)
reg_1 = 0
reg_2 = 1049668
store.i32(MEMORY_LIST[0], reg_1 + 1049680, reg_2)
reg_1 = 0
reg_2 = 1049660
store.i32(MEMORY_LIST[0], reg_1 + 1049668, reg_2)
reg_1 = 0
reg_2 = 1049676
store.i32(MEMORY_LIST[0], reg_1 + 1049688, reg_2)
reg_1 = 0
reg_2 = 1049668
store.i32(MEMORY_LIST[0], reg_1 + 1049676, reg_2)
reg_1 = 0
reg_2 = 1049684
store.i32(MEMORY_LIST[0], reg_1 + 1049696, reg_2)
reg_1 = 0
reg_2 = 1049676
store.i32(MEMORY_LIST[0], reg_1 + 1049684, reg_2)
reg_1 = 0
reg_2 = 1049692
store.i32(MEMORY_LIST[0], reg_1 + 1049704, reg_2)
reg_1 = 0
reg_2 = 1049684
store.i32(MEMORY_LIST[0], reg_1 + 1049692, reg_2)
reg_1 = 0
reg_2 = 1049700
store.i32(MEMORY_LIST[0], reg_1 + 1049712, reg_2)
reg_1 = 0
reg_2 = 1049692
store.i32(MEMORY_LIST[0], reg_1 + 1049700, reg_2)
reg_1 = 0
reg_2 = 1049700
store.i32(MEMORY_LIST[0], reg_1 + 1049708, reg_2)
reg_1 = 0
reg_2 = 1049708
store.i32(MEMORY_LIST[0], reg_1 + 1049720, reg_2)
reg_1 = 0
reg_2 = 1049708
store.i32(MEMORY_LIST[0], reg_1 + 1049716, reg_2)
reg_1 = 0
reg_2 = 1049716
store.i32(MEMORY_LIST[0], reg_1 + 1049728, reg_2)
reg_1 = 0
reg_2 = 1049716
store.i32(MEMORY_LIST[0], reg_1 + 1049724, reg_2)
reg_1 = 0
reg_2 = 1049724
store.i32(MEMORY_LIST[0], reg_1 + 1049736, reg_2)
reg_1 = 0
reg_2 = 1049724
store.i32(MEMORY_LIST[0], reg_1 + 1049732, reg_2)
reg_1 = 0
reg_2 = 1049732
store.i32(MEMORY_LIST[0], reg_1 + 1049744, reg_2)
reg_1 = 0
reg_2 = 1049732
store.i32(MEMORY_LIST[0], reg_1 + 1049740, reg_2)
reg_1 = 0
reg_2 = 1049740
store.i32(MEMORY_LIST[0], reg_1 + 1049752, reg_2)
reg_1 = 0
reg_2 = 1049740
store.i32(MEMORY_LIST[0], reg_1 + 1049748, reg_2)
reg_1 = 0
reg_2 = 1049748
store.i32(MEMORY_LIST[0], reg_1 + 1049760, reg_2)
reg_1 = 0
reg_2 = 1049748
store.i32(MEMORY_LIST[0], reg_1 + 1049756, reg_2)
reg_1 = 0
reg_2 = 1049756
store.i32(MEMORY_LIST[0], reg_1 + 1049768, reg_2)
reg_1 = 0
reg_2 = 1049756
store.i32(MEMORY_LIST[0], reg_1 + 1049764, reg_2)
reg_1 = 0
reg_2 = 1049764
store.i32(MEMORY_LIST[0], reg_1 + 1049776, reg_2)
reg_1 = 0
reg_2 = 1049772
store.i32(MEMORY_LIST[0], reg_1 + 1049784, reg_2)
reg_1 = 0
reg_2 = 1049764
store.i32(MEMORY_LIST[0], reg_1 + 1049772, reg_2)
reg_1 = 0
reg_2 = 1049780
store.i32(MEMORY_LIST[0], reg_1 + 1049792, reg_2)
reg_1 = 0
reg_2 = 1049772
store.i32(MEMORY_LIST[0], reg_1 + 1049780, reg_2)
reg_1 = 0
reg_2 = 1049788
store.i32(MEMORY_LIST[0], reg_1 + 1049800, reg_2)
reg_1 = 0
reg_2 = 1049780
store.i32(MEMORY_LIST[0], reg_1 + 1049788, reg_2)
reg_1 = 0
reg_2 = 1049796
store.i32(MEMORY_LIST[0], reg_1 + 1049808, reg_2)
reg_1 = 0
reg_2 = 1049788
store.i32(MEMORY_LIST[0], reg_1 + 1049796, reg_2)
reg_1 = 0
reg_2 = 1049804
store.i32(MEMORY_LIST[0], reg_1 + 1049816, reg_2)
reg_1 = 0
reg_2 = 1049796
store.i32(MEMORY_LIST[0], reg_1 + 1049804, reg_2)
reg_1 = 0
reg_2 = 1049812
store.i32(MEMORY_LIST[0], reg_1 + 1049824, reg_2)
reg_1 = 0
reg_2 = 1049804
store.i32(MEMORY_LIST[0], reg_1 + 1049812, reg_2)
reg_1 = 0
reg_2 = 1049820
store.i32(MEMORY_LIST[0], reg_1 + 1049832, reg_2)
reg_1 = 0
reg_2 = 1049812
store.i32(MEMORY_LIST[0], reg_1 + 1049820, reg_2)
reg_1 = 0
reg_2 = 1049828
store.i32(MEMORY_LIST[0], reg_1 + 1049840, reg_2)
reg_1 = 0
reg_2 = 1049820
store.i32(MEMORY_LIST[0], reg_1 + 1049828, reg_2)
reg_1 = 0
reg_2 = 1049836
store.i32(MEMORY_LIST[0], reg_1 + 1049848, reg_2)
reg_1 = 0
reg_2 = 1049828
store.i32(MEMORY_LIST[0], reg_1 + 1049836, reg_2)
reg_1 = 0
reg_2 = 1049844
store.i32(MEMORY_LIST[0], reg_1 + 1049856, reg_2)
reg_1 = 0
reg_2 = 1049836
store.i32(MEMORY_LIST[0], reg_1 + 1049844, reg_2)
reg_1 = 0
reg_2 = 1049852
store.i32(MEMORY_LIST[0], reg_1 + 1049864, reg_2)
reg_1 = 0
reg_2 = 1049844
store.i32(MEMORY_LIST[0], reg_1 + 1049852, reg_2)
reg_1 = 0
reg_2 = 1049860
store.i32(MEMORY_LIST[0], reg_1 + 1049872, reg_2)
reg_1 = 0
reg_2 = 1049852
store.i32(MEMORY_LIST[0], reg_1 + 1049860, reg_2)
reg_1 = 0
reg_2 = 1049868
store.i32(MEMORY_LIST[0], reg_1 + 1049880, reg_2)
reg_1 = 0
reg_2 = 1049860
store.i32(MEMORY_LIST[0], reg_1 + 1049868, reg_2)
reg_1 = 0
reg_2 = 1049876
store.i32(MEMORY_LIST[0], reg_1 + 1049888, reg_2)
reg_1 = 0
reg_2 = 1049868
store.i32(MEMORY_LIST[0], reg_1 + 1049876, reg_2)
reg_1 = 0
reg_2 = 1049884
store.i32(MEMORY_LIST[0], reg_1 + 1049896, reg_2)
reg_1 = 0
reg_2 = 1049876
store.i32(MEMORY_LIST[0], reg_1 + 1049884, reg_2)
reg_1 = 0
reg_2 = var_6
reg_3 = 15
reg_2 = reg_2 + reg_3
reg_3 = -8
reg_2 = band.i32(reg_2, reg_3)
param_1 = reg_2
reg_3 = -8
reg_2 = reg_2 + reg_3
var_2 = reg_2
store.i32(MEMORY_LIST[0], reg_1 + 1049920, reg_2)
reg_1 = 0
reg_2 = 1049884
store.i32(MEMORY_LIST[0], reg_1 + 1049892, reg_2)
reg_1 = 0
reg_2 = var_6
reg_3 = param_1
reg_2 = reg_2 - reg_3
reg_3 = var_9
reg_4 = -40
reg_3 = reg_3 + reg_4
param_1 = reg_3
reg_2 = reg_2 + reg_3
reg_3 = 8
reg_2 = reg_2 + reg_3
var_7 = reg_2
store.i32(MEMORY_LIST[0], reg_1 + 1049912, reg_2)
reg_1 = var_2
reg_2 = var_7
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_6
reg_2 = param_1
reg_1 = reg_1 + reg_2
reg_2 = 40
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = 0
reg_2 = 2097152
store.i32(MEMORY_LIST[0], reg_1 + 1049932, reg_2)
goto continue_at_3
::continue_at_11::
end
reg_1 = var_2
reg_2 = var_6
reg_1 = ge.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_10
end
reg_1 = var_7
reg_2 = var_2
reg_1 = gt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_10
end
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 12)
var_7 = reg_1
reg_2 = 1
reg_1 = band.i32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_10
end
reg_1 = var_7
reg_2 = 1
reg_1 = shr.u32(reg_1, reg_2)
reg_2 = var_5
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_7
end
::continue_at_10::
end
reg_1 = 0
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049936)
param_1 = reg_2
reg_3 = var_6
reg_4 = var_6
reg_5 = param_1
reg_4 = gt.u32(reg_4, reg_5)
if reg_4 == 0 then
reg_2 = reg_3
end
store.i32(MEMORY_LIST[0], reg_1 + 1049936, reg_2)
reg_1 = var_6
reg_2 = var_9
reg_1 = reg_1 + reg_2
var_7 = reg_1
reg_1 = 1049620
param_1 = reg_1
do
do
do
do
::continue_at_13::
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
reg_2 = var_7
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_12
end
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
param_1 = reg_1
if reg_1 ~= 0 then
goto continue_at_13
end
goto continue_at_11
end
::continue_at_12::
end
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 12)
var_8 = reg_1
reg_2 = 1
reg_1 = band.i32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_11
end
reg_1 = var_8
reg_2 = 1
reg_1 = shr.u32(reg_1, reg_2)
reg_2 = var_5
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_10
end
::continue_at_11::
end
reg_1 = 1049620
param_1 = reg_1
do
do
::continue_at_12::
do
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_7 = reg_1
reg_2 = var_2
reg_1 = gt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_13
end
reg_1 = var_7
reg_2 = param_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 4)
reg_1 = reg_1 + reg_2
var_7 = reg_1
reg_2 = var_2
reg_1 = gt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_11
end
::continue_at_13::
end
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
param_1 = reg_1
goto continue_at_12
end
::continue_at_11::
end
reg_1 = 0
reg_2 = var_6
reg_3 = 15
reg_2 = reg_2 + reg_3
reg_3 = -8
reg_2 = band.i32(reg_2, reg_3)
param_1 = reg_2
reg_3 = -8
reg_2 = reg_2 + reg_3
var_8 = reg_2
store.i32(MEMORY_LIST[0], reg_1 + 1049920, reg_2)
reg_1 = 0
reg_2 = var_6
reg_3 = param_1
reg_2 = reg_2 - reg_3
reg_3 = var_9
reg_4 = -40
reg_3 = reg_3 + reg_4
param_1 = reg_3
reg_2 = reg_2 + reg_3
reg_3 = 8
reg_2 = reg_2 + reg_3
var_4 = reg_2
store.i32(MEMORY_LIST[0], reg_1 + 1049912, reg_2)
reg_1 = var_8
reg_2 = var_4
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_6
reg_2 = param_1
reg_1 = reg_1 + reg_2
reg_2 = 40
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = 0
reg_2 = 2097152
store.i32(MEMORY_LIST[0], reg_1 + 1049932, reg_2)
reg_1 = var_2
reg_2 = var_7
reg_3 = -32
reg_2 = reg_2 + reg_3
reg_3 = -8
reg_2 = band.i32(reg_2, reg_3)
reg_3 = -8
reg_2 = reg_2 + reg_3
param_1 = reg_2
reg_3 = param_1
reg_4 = var_2
reg_5 = 16
reg_4 = reg_4 + reg_5
reg_3 = lt.u32(reg_3, reg_4)
if reg_3 == 0 then
reg_1 = reg_2
end
var_8 = reg_1
reg_2 = 27
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = 0
reg_1 = load.i64(MEMORY_LIST[0], reg_1 + 1049620)
var_10 = reg_1
reg_1 = var_8
reg_2 = 16
reg_1 = reg_1 + reg_2
reg_2 = 0
reg_2 = load.i64(MEMORY_LIST[0], reg_2 + 1049628)
store.i64(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_8
reg_2 = var_10
store.i64(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = 0
reg_2 = var_5
store.i32(MEMORY_LIST[0], reg_1 + 1049632, reg_2)
reg_1 = 0
reg_2 = var_9
store.i32(MEMORY_LIST[0], reg_1 + 1049624, reg_2)
reg_1 = 0
reg_2 = var_6
store.i32(MEMORY_LIST[0], reg_1 + 1049620, reg_2)
reg_1 = 0
reg_2 = var_8
reg_3 = 8
reg_2 = reg_2 + reg_3
store.i32(MEMORY_LIST[0], reg_1 + 1049628, reg_2)
reg_1 = var_8
reg_2 = 28
reg_1 = reg_1 + reg_2
param_1 = reg_1
do
::continue_at_11::
reg_1 = param_1
reg_2 = 7
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = param_1
reg_2 = 4
reg_1 = reg_1 + reg_2
param_1 = reg_1
reg_2 = var_7
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_11
end
end
reg_1 = var_8
reg_2 = var_2
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_3
end
reg_1 = var_8
reg_2 = var_8
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 4)
reg_3 = -2
reg_2 = band.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_2
reg_2 = var_8
reg_3 = var_2
reg_2 = reg_2 - reg_3
param_1 = reg_2
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_8
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
do
reg_1 = param_1
reg_2 = 256
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_11
end
reg_1 = var_2
reg_2 = param_1
FUNC_LIST[24](reg_1, reg_2)
goto continue_at_3
::continue_at_11::
end
reg_1 = param_1
reg_2 = -8
reg_1 = band.i32(reg_1, reg_2)
reg_2 = 1049636
reg_1 = reg_1 + reg_2
var_7 = reg_1
do
do
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049900)
var_6 = reg_1
reg_2 = 1
reg_3 = param_1
reg_4 = 3
reg_3 = shr.u32(reg_3, reg_4)
reg_2 = shl.i32(reg_2, reg_3)
param_1 = reg_2
reg_1 = band.i32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_12
end
reg_1 = 0
reg_2 = var_6
reg_3 = param_1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 1049900, reg_2)
reg_1 = var_7
param_1 = reg_1
goto continue_at_11
::continue_at_12::
end
reg_1 = var_7
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
param_1 = reg_1
::continue_at_11::
end
reg_1 = var_7
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = param_1
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = var_2
reg_2 = var_7
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = var_2
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
goto continue_at_3
::continue_at_10::
end
reg_1 = param_1
reg_2 = var_6
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = param_1
reg_2 = param_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 4)
reg_3 = var_9
reg_2 = reg_2 + reg_3
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_6
reg_2 = 15
reg_1 = reg_1 + reg_2
reg_2 = -8
reg_1 = band.i32(reg_1, reg_2)
reg_2 = -8
reg_1 = reg_1 + reg_2
var_6 = reg_1
reg_2 = var_3
reg_3 = 3
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_7
reg_2 = 15
reg_1 = reg_1 + reg_2
reg_2 = -8
reg_1 = band.i32(reg_1, reg_2)
reg_2 = -8
reg_1 = reg_1 + reg_2
var_2 = reg_1
reg_2 = var_6
reg_3 = var_3
reg_2 = reg_2 + reg_3
param_1 = reg_2
reg_1 = reg_1 - reg_2
var_3 = reg_1
reg_1 = var_2
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049920)
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_6
end
reg_1 = var_2
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049916)
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_5
end
do
reg_1 = var_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
var_7 = reg_1
reg_2 = 3
reg_1 = band.i32(reg_1, reg_2)
reg_2 = 1
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_10
end
reg_1 = var_2
reg_2 = var_7
reg_3 = -8
reg_2 = band.i32(reg_2, reg_3)
var_7 = reg_2
FUNC_LIST[22](reg_1, reg_2)
reg_1 = var_7
reg_2 = var_3
reg_1 = reg_1 + reg_2
var_3 = reg_1
reg_1 = var_2
reg_2 = var_7
reg_1 = reg_1 + reg_2
var_2 = reg_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
var_7 = reg_1
::continue_at_10::
end
reg_1 = var_2
reg_2 = var_7
reg_3 = -2
reg_2 = band.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = var_3
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = var_3
reg_1 = reg_1 + reg_2
reg_2 = var_3
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
do
reg_1 = var_3
reg_2 = 256
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_10
end
reg_1 = param_1
reg_2 = var_3
FUNC_LIST[24](reg_1, reg_2)
goto continue_at_4
::continue_at_10::
end
reg_1 = var_3
reg_2 = -8
reg_1 = band.i32(reg_1, reg_2)
reg_2 = 1049636
reg_1 = reg_1 + reg_2
var_2 = reg_1
do
do
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049900)
var_7 = reg_1
reg_2 = 1
reg_3 = var_3
reg_4 = 3
reg_3 = shr.u32(reg_3, reg_4)
reg_2 = shl.i32(reg_2, reg_3)
var_3 = reg_2
reg_1 = band.i32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_11
end
reg_1 = 0
reg_2 = var_7
reg_3 = var_3
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 1049900, reg_2)
reg_1 = var_2
var_3 = reg_1
goto continue_at_10
::continue_at_11::
end
reg_1 = var_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
var_3 = reg_1
::continue_at_10::
end
reg_1 = var_2
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = var_3
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = param_1
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = param_1
reg_2 = var_3
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
goto continue_at_4
::continue_at_9::
end
reg_1 = 0
reg_2 = param_1
reg_3 = var_3
reg_2 = reg_2 - reg_3
var_2 = reg_2
store.i32(MEMORY_LIST[0], reg_1 + 1049912, reg_2)
reg_1 = 0
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049920)
param_1 = reg_2
reg_3 = var_3
reg_2 = reg_2 + reg_3
var_7 = reg_2
store.i32(MEMORY_LIST[0], reg_1 + 1049920, reg_2)
reg_1 = var_7
reg_2 = var_2
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = var_3
reg_3 = 3
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = 8
reg_1 = reg_1 + reg_2
var_2 = reg_1
goto continue_at_0
::continue_at_8::
end
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049916)
var_2 = reg_1
do
do
reg_1 = param_1
reg_2 = var_3
reg_1 = reg_1 - reg_2
var_7 = reg_1
reg_2 = 15
reg_1 = gt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_9
end
reg_1 = 0
reg_2 = 0
store.i32(MEMORY_LIST[0], reg_1 + 1049916, reg_2)
reg_1 = 0
reg_2 = 0
store.i32(MEMORY_LIST[0], reg_1 + 1049908, reg_2)
reg_1 = var_2
reg_2 = param_1
reg_3 = 3
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_2
reg_2 = param_1
reg_1 = reg_1 + reg_2
param_1 = reg_1
reg_2 = param_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 4)
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
goto continue_at_8
::continue_at_9::
end
reg_1 = 0
reg_2 = var_7
store.i32(MEMORY_LIST[0], reg_1 + 1049908, reg_2)
reg_1 = 0
reg_2 = var_2
reg_3 = var_3
reg_2 = reg_2 + reg_3
var_6 = reg_2
store.i32(MEMORY_LIST[0], reg_1 + 1049916, reg_2)
reg_1 = var_6
reg_2 = var_7
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_2
reg_2 = param_1
reg_1 = reg_1 + reg_2
reg_2 = var_7
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_2
reg_2 = var_3
reg_3 = 3
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
::continue_at_8::
end
reg_1 = var_2
reg_2 = 8
reg_1 = reg_1 + reg_2
var_2 = reg_1
goto continue_at_0
::continue_at_7::
end
reg_1 = param_1
reg_2 = var_8
reg_3 = var_9
reg_2 = reg_2 + reg_3
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = 0
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049920)
param_1 = reg_2
reg_3 = 15
reg_2 = reg_2 + reg_3
reg_3 = -8
reg_2 = band.i32(reg_2, reg_3)
var_2 = reg_2
reg_3 = -8
reg_2 = reg_2 + reg_3
var_7 = reg_2
store.i32(MEMORY_LIST[0], reg_1 + 1049920, reg_2)
reg_1 = 0
reg_2 = param_1
reg_3 = var_2
reg_2 = reg_2 - reg_3
reg_3 = 0
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 1049912)
reg_4 = var_9
reg_3 = reg_3 + reg_4
var_2 = reg_3
reg_2 = reg_2 + reg_3
reg_3 = 8
reg_2 = reg_2 + reg_3
var_6 = reg_2
store.i32(MEMORY_LIST[0], reg_1 + 1049912, reg_2)
reg_1 = var_7
reg_2 = var_6
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = var_2
reg_1 = reg_1 + reg_2
reg_2 = 40
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = 0
reg_2 = 2097152
store.i32(MEMORY_LIST[0], reg_1 + 1049932, reg_2)
goto continue_at_3
::continue_at_6::
end
reg_1 = 0
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 1049920, reg_2)
reg_1 = 0
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049912)
reg_3 = var_3
reg_2 = reg_2 + reg_3
var_3 = reg_2
store.i32(MEMORY_LIST[0], reg_1 + 1049912, reg_2)
reg_1 = param_1
reg_2 = var_3
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
goto continue_at_4
::continue_at_5::
end
reg_1 = 0
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 1049916, reg_2)
reg_1 = 0
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049908)
reg_3 = var_3
reg_2 = reg_2 + reg_3
var_3 = reg_2
store.i32(MEMORY_LIST[0], reg_1 + 1049908, reg_2)
reg_1 = param_1
reg_2 = var_3
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = var_3
reg_1 = reg_1 + reg_2
reg_2 = var_3
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
::continue_at_4::
end
reg_1 = var_6
reg_2 = 8
reg_1 = reg_1 + reg_2
var_2 = reg_1
goto continue_at_0
::continue_at_3::
end
reg_1 = 0
var_2 = reg_1
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049912)
param_1 = reg_1
reg_2 = var_3
reg_1 = le.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = 0
reg_2 = param_1
reg_3 = var_3
reg_2 = reg_2 - reg_3
var_2 = reg_2
store.i32(MEMORY_LIST[0], reg_1 + 1049912, reg_2)
reg_1 = 0
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049920)
param_1 = reg_2
reg_3 = var_3
reg_2 = reg_2 + reg_3
var_7 = reg_2
store.i32(MEMORY_LIST[0], reg_1 + 1049920, reg_2)
reg_1 = var_7
reg_2 = var_2
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = var_3
reg_3 = 3
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = 8
reg_1 = reg_1 + reg_2
var_2 = reg_1
goto continue_at_0
::continue_at_2::
end
reg_1 = param_1
reg_2 = var_5
store.i32(MEMORY_LIST[0], reg_1 + 24, reg_2)
do
reg_1 = var_7
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 16)
var_6 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = param_1
reg_2 = var_6
store.i32(MEMORY_LIST[0], reg_1 + 16, reg_2)
reg_1 = var_6
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 24, reg_2)
::continue_at_2::
end
reg_1 = var_7
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 20)
var_6 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = param_1
reg_2 = var_6
store.i32(MEMORY_LIST[0], reg_1 + 20, reg_2)
reg_1 = var_6
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 24, reg_2)
::continue_at_1::
end
do
do
reg_1 = var_2
reg_2 = 16
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = var_7
reg_2 = var_3
reg_3 = 3
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_7
reg_2 = var_3
reg_1 = reg_1 + reg_2
param_1 = reg_1
reg_2 = var_2
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = var_2
reg_1 = reg_1 + reg_2
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
do
reg_1 = var_2
reg_2 = 256
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_3
end
reg_1 = param_1
reg_2 = var_2
FUNC_LIST[24](reg_1, reg_2)
goto continue_at_1
::continue_at_3::
end
reg_1 = var_2
reg_2 = -8
reg_1 = band.i32(reg_1, reg_2)
reg_2 = 1049636
reg_1 = reg_1 + reg_2
var_3 = reg_1
do
do
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049900)
var_6 = reg_1
reg_2 = 1
reg_3 = var_2
reg_4 = 3
reg_3 = shr.u32(reg_3, reg_4)
reg_2 = shl.i32(reg_2, reg_3)
var_2 = reg_2
reg_1 = band.i32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_4
end
reg_1 = 0
reg_2 = var_6
reg_3 = var_2
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 1049900, reg_2)
reg_1 = var_3
var_2 = reg_1
goto continue_at_3
::continue_at_4::
end
reg_1 = var_3
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
var_2 = reg_1
::continue_at_3::
end
reg_1 = var_3
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = var_2
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = param_1
reg_2 = var_3
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = param_1
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
goto continue_at_1
::continue_at_2::
end
reg_1 = var_7
reg_2 = var_2
reg_3 = var_3
reg_2 = reg_2 + reg_3
param_1 = reg_2
reg_3 = 3
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_7
reg_2 = param_1
reg_1 = reg_1 + reg_2
param_1 = reg_1
reg_2 = param_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 4)
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
::continue_at_1::
end
reg_1 = var_7
reg_2 = 8
reg_1 = reg_1 + reg_2
var_2 = reg_1
::continue_at_0::
end
reg_1 = var_1
reg_2 = 16
reg_1 = reg_1 + reg_2
GLOBAL_LIST[0].value = reg_1
reg_1 = var_2
do return reg_1 end
end
FUNC_LIST[27] =
function(
param_1, param_2)
local
var_1, var_2, var_3, var_4, var_5= 0, 0, 0, 0, 0
local
reg_1, reg_2, reg_3, reg_4, reg_5, reg_6
reg_1 = 0
var_1 = reg_1
do
reg_1 = -65587
reg_2 = param_1
reg_3 = 16
reg_4 = param_1
reg_5 = 16
reg_4 = gt.u32(reg_4, reg_5)
if reg_4 == 0 then
reg_2 = reg_3
end
param_1 = reg_2
reg_1 = reg_1 - reg_2
reg_2 = param_2
reg_1 = le.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = param_1
reg_2 = 16
reg_3 = param_2
reg_4 = 11
reg_3 = reg_3 + reg_4
reg_4 = -8
reg_3 = band.i32(reg_3, reg_4)
reg_4 = param_2
reg_5 = 11
reg_4 = lt.u32(reg_4, reg_5)
if reg_4 == 0 then
reg_2 = reg_3
end
var_2 = reg_2
reg_1 = reg_1 + reg_2
reg_2 = 12
reg_1 = reg_1 + reg_2
reg_1 =
FUNC_LIST[26](reg_1)
param_2 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = param_2
reg_2 = -8
reg_1 = reg_1 + reg_2
var_1 = reg_1
do
do
reg_1 = param_1
reg_2 = -1
reg_1 = reg_1 + reg_2
var_3 = reg_1
reg_2 = param_2
reg_1 = band.i32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = var_1
param_1 = reg_1
goto continue_at_1
::continue_at_2::
end
reg_1 = param_2
reg_2 = -4
reg_1 = reg_1 + reg_2
var_4 = reg_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_5 = reg_1
reg_2 = -8
reg_1 = band.i32(reg_1, reg_2)
reg_2 = var_3
reg_3 = param_2
reg_2 = reg_2 + reg_3
reg_3 = 0
reg_4 = param_1
reg_3 = reg_3 - reg_4
reg_2 = band.i32(reg_2, reg_3)
reg_3 = -8
reg_2 = reg_2 + reg_3
param_2 = reg_2
reg_3 = 0
reg_4 = param_1
reg_5 = param_2
reg_6 = var_1
reg_5 = reg_5 - reg_6
reg_6 = 16
reg_5 = gt.u32(reg_5, reg_6)
if reg_5 == 0 then
reg_3 = reg_4
end
reg_2 = reg_2 + reg_3
param_1 = reg_2
reg_3 = var_1
reg_2 = reg_2 - reg_3
param_2 = reg_2
reg_1 = reg_1 - reg_2
var_3 = reg_1
do
reg_1 = var_5
reg_2 = 3
reg_1 = band.i32(reg_1, reg_2)
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = param_1
reg_2 = var_3
reg_3 = param_1
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 4)
reg_4 = 1
reg_3 = band.i32(reg_3, reg_4)
reg_2 = bor.i32(reg_2, reg_3)
reg_3 = 2
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = var_3
reg_1 = reg_1 + reg_2
var_3 = reg_1
reg_2 = var_3
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 4)
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_4
reg_2 = param_2
reg_3 = var_4
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 0)
reg_4 = 1
reg_3 = band.i32(reg_3, reg_4)
reg_2 = bor.i32(reg_2, reg_3)
reg_3 = 2
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_1
reg_2 = param_2
reg_1 = reg_1 + reg_2
var_3 = reg_1
reg_2 = var_3
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 4)
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_1
reg_2 = param_2
FUNC_LIST[23](reg_1, reg_2)
goto continue_at_1
::continue_at_2::
end
reg_1 = var_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_1 = reg_1
reg_1 = param_1
reg_2 = var_3
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = var_1
reg_3 = param_2
reg_2 = reg_2 + reg_3
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
::continue_at_1::
end
do
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
param_2 = reg_1
reg_2 = 3
reg_1 = band.i32(reg_1, reg_2)
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = param_2
reg_2 = -8
reg_1 = band.i32(reg_1, reg_2)
var_1 = reg_1
reg_2 = var_2
reg_3 = 16
reg_2 = reg_2 + reg_3
reg_1 = le.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = param_1
reg_2 = var_2
reg_3 = param_2
reg_4 = 1
reg_3 = band.i32(reg_3, reg_4)
reg_2 = bor.i32(reg_2, reg_3)
reg_3 = 2
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = var_2
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_2 = var_1
reg_3 = var_2
reg_2 = reg_2 - reg_3
var_2 = reg_2
reg_3 = 3
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = var_1
reg_1 = reg_1 + reg_2
var_1 = reg_1
reg_2 = var_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 4)
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_2
reg_2 = var_2
FUNC_LIST[23](reg_1, reg_2)
::continue_at_1::
end
reg_1 = param_1
reg_2 = 8
reg_1 = reg_1 + reg_2
var_1 = reg_1
::continue_at_0::
end
reg_1 = var_1
do return reg_1 end
end
FUNC_LIST[28] =
function(
param_1)
local
reg_1
reg_1 = param_1
FUNC_LIST[29](reg_1)
error('unreachable code entered')
end
FUNC_LIST[29] =
function(
param_1)
local
var_1, var_2, var_3= 0, 0, 0
local
reg_1, reg_2, reg_3, reg_4, reg_5, reg_6
reg_1 = GLOBAL_LIST[0].value
reg_2 = 16
reg_1 = reg_1 - reg_2
var_1 = reg_1
GLOBAL_LIST[0].value = reg_1
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_2 = reg_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 12)
var_3 = reg_1
do
do
do
do
reg_1 = var_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
if reg_1 == 0 then
goto continue_at_3
elseif reg_1 == 1 then
goto continue_at_2
else
goto continue_at_1
end
::continue_at_3::
end
reg_1 = var_3
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = 1048652
var_2 = reg_1
reg_1 = 0
var_3 = reg_1
goto continue_at_0
::continue_at_2::
end
reg_1 = var_3
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = var_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_2 = reg_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
var_3 = reg_1
reg_1 = var_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_2 = reg_1
goto continue_at_0
::continue_at_1::
end
reg_1 = var_1
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = var_1
reg_2 = -2147483648
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_1
reg_2 = 1049032
reg_3 = param_1
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 4)
var_2 = reg_3
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 8)
reg_4 = param_1
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 8)
reg_5 = var_2
reg_5 = load.i32_u8(MEMORY_LIST[0], reg_5 + 16)
reg_6 = var_2
reg_6 = load.i32_u8(MEMORY_LIST[0], reg_6 + 17)
FUNC_LIST[39](reg_1, reg_2, reg_3, reg_4, reg_5, reg_6)
error('unreachable code entered')
::continue_at_0::
end
reg_1 = var_1
reg_2 = var_3
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_1
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_1
reg_2 = 1049012
reg_3 = param_1
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 4)
var_2 = reg_3
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 8)
reg_4 = param_1
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 8)
reg_5 = var_2
reg_5 = load.i32_u8(MEMORY_LIST[0], reg_5 + 16)
reg_6 = var_2
reg_6 = load.i32_u8(MEMORY_LIST[0], reg_6 + 17)
FUNC_LIST[39](reg_1, reg_2, reg_3, reg_4, reg_5, reg_6)
error('unreachable code entered')
end
FUNC_LIST[30] =
function(
param_1, param_2)
local
var_1= 0
local
reg_1, reg_2, reg_3
reg_1 = GLOBAL_LIST[0].value
reg_2 = 48
reg_1 = reg_1 - reg_2
var_1 = reg_1
GLOBAL_LIST[0].value = reg_1
do
reg_1 = 0
reg_1 = load.i32_u8(MEMORY_LIST[0], reg_1 + 1049468)
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = var_1
reg_2 = 2
store.i32(MEMORY_LIST[0], reg_1 + 16, reg_2)
reg_1 = var_1
reg_2 = 1048880
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = var_1
reg_2 = 1
store.i64(MEMORY_LIST[0], reg_1 + 24, reg_2)
reg_1 = var_1
reg_2 = 1
store.i32(MEMORY_LIST[0], reg_1 + 40, reg_2)
reg_1 = var_1
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 44, reg_2)
reg_1 = var_1
reg_2 = var_1
reg_3 = 36
reg_2 = reg_2 + reg_3
store.i32(MEMORY_LIST[0], reg_1 + 20, reg_2)
reg_1 = var_1
reg_2 = var_1
reg_3 = 44
reg_2 = reg_2 + reg_3
store.i32(MEMORY_LIST[0], reg_1 + 36, reg_2)
reg_1 = var_1
reg_2 = 12
reg_1 = reg_1 + reg_2
reg_2 = 1048920
FUNC_LIST[48](reg_1, reg_2)
error('unreachable code entered')
::continue_at_0::
end
reg_1 = var_1
reg_2 = 48
reg_1 = reg_1 + reg_2
GLOBAL_LIST[0].value = reg_1
end
FUNC_LIST[31] =
function(
param_1, param_2)
local
reg_1, reg_2
do
reg_1 = param_2
reg_2 = 9
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = param_2
reg_2 = param_1
reg_1 =
FUNC_LIST[27](reg_1, reg_2)
do return reg_1 end
::continue_at_0::
end
reg_1 = param_1
reg_1 =
FUNC_LIST[26](reg_1)
do return reg_1 end
end
FUNC_LIST[32] =
function(
param_1, param_2, param_3)
local
var_1, var_2= 0, 0
local
reg_1, reg_2, reg_3, reg_4, reg_5
do
do
reg_1 = param_1
reg_2 = -4
reg_1 = reg_1 + reg_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_1 = reg_1
reg_2 = -8
reg_1 = band.i32(reg_1, reg_2)
var_2 = reg_1
reg_2 = 4
reg_3 = 8
reg_4 = var_1
reg_5 = 3
reg_4 = band.i32(reg_4, reg_5)
var_1 = reg_4
if reg_4 == 0 then
reg_2 = reg_3
end
reg_3 = param_2
reg_2 = reg_2 + reg_3
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_1
end
do
reg_1 = var_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = var_2
reg_2 = param_2
reg_3 = 39
reg_2 = reg_2 + reg_3
reg_1 = gt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_0
end
::continue_at_2::
end
reg_1 = param_1
FUNC_LIST[25](reg_1)
do return  end
::continue_at_1::
end
reg_1 = 1048717
reg_2 = 46
reg_3 = 1048764
FUNC_LIST[50](reg_1, reg_2, reg_3)
error('unreachable code entered')
::continue_at_0::
end
reg_1 = 1048780
reg_2 = 46
reg_3 = 1048828
FUNC_LIST[50](reg_1, reg_2, reg_3)
error('unreachable code entered')
end
FUNC_LIST[33] =
function(
param_1, param_2, param_3, param_4)
local
var_1, var_2, var_3, var_4, var_5, var_6= 0, 0, 0, 0, 0, 0
local
reg_1, reg_2, reg_3, reg_4, reg_5, reg_6
do
do
do
do
do
reg_1 = param_1
reg_2 = -4
reg_1 = reg_1 + reg_2
var_1 = reg_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_2 = reg_1
reg_2 = -8
reg_1 = band.i32(reg_1, reg_2)
var_3 = reg_1
reg_2 = 4
reg_3 = 8
reg_4 = var_2
reg_5 = 3
reg_4 = band.i32(reg_4, reg_5)
var_4 = reg_4
if reg_4 == 0 then
reg_2 = reg_3
end
reg_3 = param_2
reg_2 = reg_2 + reg_3
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_4
end
reg_1 = param_2
reg_2 = 39
reg_1 = reg_1 + reg_2
var_5 = reg_1
do
reg_1 = var_4
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_5
end
reg_1 = var_3
reg_2 = var_5
reg_1 = gt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_3
end
::continue_at_5::
end
do
do
do
reg_1 = param_3
reg_2 = 9
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_7
end
reg_1 = param_3
reg_2 = param_4
reg_1 =
FUNC_LIST[27](reg_1, reg_2)
param_3 = reg_1
if reg_1 ~= 0 then
goto continue_at_6
end
reg_1 = 0
do return reg_1 end
::continue_at_7::
end
reg_1 = 0
param_3 = reg_1
reg_1 = param_4
reg_2 = -65588
reg_1 = gt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_5
end
reg_1 = 16
reg_2 = param_4
reg_3 = 11
reg_2 = reg_2 + reg_3
reg_3 = -8
reg_2 = band.i32(reg_2, reg_3)
reg_3 = param_4
reg_4 = 11
reg_3 = lt.u32(reg_3, reg_4)
if reg_3 == 0 then
reg_1 = reg_2
end
param_2 = reg_1
do
do
reg_1 = var_4
if reg_1 ~= 0 then
goto continue_at_8
end
reg_1 = param_2
reg_2 = 256
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_7
end
reg_1 = var_3
reg_2 = param_2
reg_3 = 4
reg_2 = bor.i32(reg_2, reg_3)
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_7
end
reg_1 = var_3
reg_2 = param_2
reg_1 = reg_1 - reg_2
reg_2 = 131073
reg_1 = ge.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_7
end
reg_1 = param_1
do return reg_1 end
::continue_at_8::
end
reg_1 = param_1
reg_2 = -8
reg_1 = reg_1 + reg_2
var_5 = reg_1
reg_2 = var_3
reg_1 = reg_1 + reg_2
var_4 = reg_1
do
do
do
do
do
reg_1 = var_3
reg_2 = param_2
reg_1 = ge.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_12
end
reg_1 = var_4
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049920)
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_8
end
reg_1 = var_4
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049916)
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_10
end
reg_1 = var_4
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
var_2 = reg_1
reg_2 = 2
reg_1 = band.i32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_7
end
reg_1 = var_2
reg_2 = -8
reg_1 = band.i32(reg_1, reg_2)
var_6 = reg_1
reg_2 = var_3
reg_1 = reg_1 + reg_2
var_2 = reg_1
reg_2 = param_2
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_7
end
reg_1 = var_4
reg_2 = var_6
FUNC_LIST[22](reg_1, reg_2)
reg_1 = var_2
reg_2 = param_2
reg_1 = reg_1 - reg_2
param_4 = reg_1
reg_2 = 16
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_11
end
reg_1 = var_1
reg_2 = param_2
reg_3 = var_1
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 0)
reg_4 = 1
reg_3 = band.i32(reg_3, reg_4)
reg_2 = bor.i32(reg_2, reg_3)
reg_3 = 2
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_5
reg_2 = param_2
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_2 = param_4
reg_3 = 3
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_5
reg_2 = var_2
reg_1 = reg_1 + reg_2
param_3 = reg_1
reg_2 = param_3
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 4)
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_2
reg_2 = param_4
FUNC_LIST[23](reg_1, reg_2)
reg_1 = param_1
do return reg_1 end
::continue_at_12::
end
reg_1 = var_3
reg_2 = param_2
reg_1 = reg_1 - reg_2
param_4 = reg_1
reg_2 = 15
reg_1 = gt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_9
end
reg_1 = param_1
do return reg_1 end
::continue_at_11::
end
reg_1 = var_1
reg_2 = var_2
reg_3 = var_1
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 0)
reg_4 = 1
reg_3 = band.i32(reg_3, reg_4)
reg_2 = bor.i32(reg_2, reg_3)
reg_3 = 2
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_5
reg_2 = var_2
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_2 = param_2
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 4)
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
do return reg_1 end
::continue_at_10::
end
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049908)
reg_2 = var_3
reg_1 = reg_1 + reg_2
var_4 = reg_1
reg_2 = param_2
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_7
end
do
do
reg_1 = var_4
reg_2 = param_2
reg_1 = reg_1 - reg_2
param_4 = reg_1
reg_2 = 15
reg_1 = gt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_11
end
reg_1 = var_1
reg_2 = var_2
reg_3 = 1
reg_2 = band.i32(reg_2, reg_3)
reg_3 = var_4
reg_2 = bor.i32(reg_2, reg_3)
reg_3 = 2
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_5
reg_2 = var_4
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_2 = param_2
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 4)
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = 0
param_4 = reg_1
reg_1 = 0
param_2 = reg_1
goto continue_at_10
::continue_at_11::
end
reg_1 = var_1
reg_2 = param_2
reg_3 = var_2
reg_4 = 1
reg_3 = band.i32(reg_3, reg_4)
reg_2 = bor.i32(reg_2, reg_3)
reg_3 = 2
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_5
reg_2 = param_2
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_2 = param_4
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_5
reg_2 = var_4
reg_1 = reg_1 + reg_2
param_3 = reg_1
reg_2 = param_4
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = param_3
reg_2 = param_3
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 4)
reg_3 = -2
reg_2 = band.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
::continue_at_10::
end
reg_1 = 0
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 1049916, reg_2)
reg_1 = 0
reg_2 = param_4
store.i32(MEMORY_LIST[0], reg_1 + 1049908, reg_2)
reg_1 = param_1
do return reg_1 end
::continue_at_9::
end
reg_1 = var_1
reg_2 = param_2
reg_3 = var_2
reg_4 = 1
reg_3 = band.i32(reg_3, reg_4)
reg_2 = bor.i32(reg_2, reg_3)
reg_3 = 2
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_5
reg_2 = param_2
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_2 = param_4
reg_3 = 3
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_4
reg_2 = var_4
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 4)
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_2
reg_2 = param_4
FUNC_LIST[23](reg_1, reg_2)
reg_1 = param_1
do return reg_1 end
::continue_at_8::
end
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049912)
reg_2 = var_3
reg_1 = reg_1 + reg_2
var_4 = reg_1
reg_2 = param_2
reg_1 = gt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_0
end
::continue_at_7::
end
reg_1 = param_4
reg_1 =
FUNC_LIST[26](reg_1)
param_2 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_5
end
reg_1 = param_2
reg_2 = param_1
reg_3 = -4
reg_4 = -8
reg_5 = var_1
reg_5 = load.i32(MEMORY_LIST[0], reg_5 + 0)
param_3 = reg_5
reg_6 = 3
reg_5 = band.i32(reg_5, reg_6)
if reg_5 == 0 then
reg_3 = reg_4
end
reg_4 = param_3
reg_5 = -8
reg_4 = band.i32(reg_4, reg_5)
reg_3 = reg_3 + reg_4
param_3 = reg_3
reg_4 = param_4
reg_5 = param_3
reg_6 = param_4
reg_5 = lt.u32(reg_5, reg_6)
if reg_5 == 0 then
reg_3 = reg_4
end
reg_1 =
FUNC_LIST[60](reg_1, reg_2, reg_3)
param_2 = reg_1
reg_1 = param_1
FUNC_LIST[25](reg_1)
reg_1 = param_2
do return reg_1 end
::continue_at_6::
end
reg_1 = param_3
reg_2 = param_1
reg_3 = param_2
reg_4 = param_4
reg_5 = param_2
reg_6 = param_4
reg_5 = lt.u32(reg_5, reg_6)
if reg_5 == 0 then
reg_3 = reg_4
end
reg_1 =
FUNC_LIST[60](reg_1, reg_2, reg_3)
reg_1 = var_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
param_4 = reg_1
reg_2 = -8
reg_1 = band.i32(reg_1, reg_2)
var_4 = reg_1
reg_2 = 4
reg_3 = 8
reg_4 = param_4
reg_5 = 3
reg_4 = band.i32(reg_4, reg_5)
param_4 = reg_4
if reg_4 == 0 then
reg_2 = reg_3
end
reg_3 = param_2
reg_2 = reg_2 + reg_3
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_2
end
do
reg_1 = param_4
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_6
end
reg_1 = var_4
reg_2 = var_5
reg_1 = gt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_1
end
::continue_at_6::
end
reg_1 = param_1
FUNC_LIST[25](reg_1)
::continue_at_5::
end
reg_1 = param_3
do return reg_1 end
::continue_at_4::
end
reg_1 = 1048717
reg_2 = 46
reg_3 = 1048764
FUNC_LIST[50](reg_1, reg_2, reg_3)
error('unreachable code entered')
::continue_at_3::
end
reg_1 = 1048780
reg_2 = 46
reg_3 = 1048828
FUNC_LIST[50](reg_1, reg_2, reg_3)
error('unreachable code entered')
::continue_at_2::
end
reg_1 = 1048717
reg_2 = 46
reg_3 = 1048764
FUNC_LIST[50](reg_1, reg_2, reg_3)
error('unreachable code entered')
::continue_at_1::
end
reg_1 = 1048780
reg_2 = 46
reg_3 = 1048828
FUNC_LIST[50](reg_1, reg_2, reg_3)
error('unreachable code entered')
::continue_at_0::
end
reg_1 = var_1
reg_2 = param_2
reg_3 = var_2
reg_4 = 1
reg_3 = band.i32(reg_3, reg_4)
reg_2 = bor.i32(reg_2, reg_3)
reg_3 = 2
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_5
reg_2 = param_2
reg_1 = reg_1 + reg_2
param_4 = reg_1
reg_2 = var_4
reg_3 = param_2
reg_2 = reg_2 - reg_3
param_2 = reg_2
reg_3 = 1
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = 0
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 1049912, reg_2)
reg_1 = 0
reg_2 = param_4
store.i32(MEMORY_LIST[0], reg_1 + 1049920, reg_2)
reg_1 = param_1
do return reg_1 end
end
FUNC_LIST[34] =
function(
param_1)
local
var_1, var_2= 0, 0
local
reg_1, reg_2
reg_1 = GLOBAL_LIST[0].value
reg_2 = 16
reg_1 = reg_1 - reg_2
var_1 = reg_1
GLOBAL_LIST[0].value = reg_1
do
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
var_2 = reg_1
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = 1048964
FUNC_LIST[54](reg_1)
error('unreachable code entered')
::continue_at_0::
end
reg_1 = var_1
reg_2 = param_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 12)
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = var_1
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = var_1
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_1
reg_2 = 4
reg_1 = reg_1 + reg_2
FUNC_LIST[28](reg_1)
error('unreachable code entered')
end
FUNC_LIST[35] =
function(
param_1, param_2)
local
var_1, var_2, var_3, var_4= 0, 0, 0, 0
local
reg_1, reg_2, reg_3
reg_1 = GLOBAL_LIST[0].value
reg_2 = 48
reg_1 = reg_1 - reg_2
var_1 = reg_1
GLOBAL_LIST[0].value = reg_1
do
reg_1 = param_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
reg_2 = -2147483648
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = param_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 12)
var_2 = reg_1
reg_1 = var_1
reg_2 = 36
reg_1 = reg_1 + reg_2
reg_2 = 8
reg_1 = reg_1 + reg_2
var_3 = reg_1
reg_2 = 0
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_1
reg_2 = 4294967296
store.i64(MEMORY_LIST[0], reg_1 + 36, reg_2)
reg_1 = var_1
reg_2 = 36
reg_1 = reg_1 + reg_2
reg_2 = 1048652
reg_3 = var_2
reg_1 =
FUNC_LIST[52](reg_1, reg_2, reg_3)
reg_1 = var_1
reg_2 = 24
reg_1 = reg_1 + reg_2
reg_2 = 8
reg_1 = reg_1 + reg_2
reg_2 = var_3
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 0)
var_2 = reg_2
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_1
reg_2 = var_1
reg_2 = load.i64(MEMORY_LIST[0], reg_2 + 36)
var_4 = reg_2
store.i64(MEMORY_LIST[0], reg_1 + 24, reg_2)
reg_1 = param_2
reg_2 = 8
reg_1 = reg_1 + reg_2
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = param_2
reg_2 = var_4
store.i64(MEMORY_LIST[0], reg_1 + 0, reg_2)
::continue_at_0::
end
reg_1 = param_2
reg_1 = load.i64(MEMORY_LIST[0], reg_1 + 0)
var_4 = reg_1
reg_1 = param_2
reg_2 = 4294967296
store.i64(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_1
reg_2 = 8
reg_1 = reg_1 + reg_2
reg_2 = 8
reg_1 = reg_1 + reg_2
var_2 = reg_1
reg_2 = param_2
reg_3 = 8
reg_2 = reg_2 + reg_3
param_2 = reg_2
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 0)
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = param_2
reg_2 = 0
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = 0
reg_1 = load.i32_u8(MEMORY_LIST[0], reg_1 + 1049469)
reg_1 = var_1
reg_2 = var_4
store.i64(MEMORY_LIST[0], reg_1 + 8, reg_2)
do
reg_1 = 12
reg_2 = 4
reg_1 =
FUNC_LIST[5](reg_1, reg_2)
param_2 = reg_1
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = 4
reg_2 = 12
FUNC_LIST[45](reg_1, reg_2)
error('unreachable code entered')
::continue_at_0::
end
reg_1 = param_2
reg_2 = var_1
reg_2 = load.i64(MEMORY_LIST[0], reg_2 + 8)
store.i64(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = param_2
reg_2 = 8
reg_1 = reg_1 + reg_2
reg_2 = var_2
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 0)
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = param_1
reg_2 = 1048980
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_1
reg_2 = 48
reg_1 = reg_1 + reg_2
GLOBAL_LIST[0].value = reg_1
end
FUNC_LIST[36] =
function(
param_1, param_2)
local
var_1, var_2, var_3, var_4= 0, 0, 0, 0
local
reg_1, reg_2, reg_3
reg_1 = GLOBAL_LIST[0].value
reg_2 = 32
reg_1 = reg_1 - reg_2
var_1 = reg_1
GLOBAL_LIST[0].value = reg_1
do
reg_1 = param_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
reg_2 = -2147483648
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = param_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 12)
var_2 = reg_1
reg_1 = var_1
reg_2 = 20
reg_1 = reg_1 + reg_2
reg_2 = 8
reg_1 = reg_1 + reg_2
var_3 = reg_1
reg_2 = 0
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_1
reg_2 = 4294967296
store.i64(MEMORY_LIST[0], reg_1 + 20, reg_2)
reg_1 = var_1
reg_2 = 20
reg_1 = reg_1 + reg_2
reg_2 = 1048652
reg_3 = var_2
reg_1 =
FUNC_LIST[52](reg_1, reg_2, reg_3)
reg_1 = var_1
reg_2 = 8
reg_1 = reg_1 + reg_2
reg_2 = 8
reg_1 = reg_1 + reg_2
reg_2 = var_3
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 0)
var_2 = reg_2
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_1
reg_2 = var_1
reg_2 = load.i64(MEMORY_LIST[0], reg_2 + 20)
var_4 = reg_2
store.i64(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = param_2
reg_2 = 8
reg_1 = reg_1 + reg_2
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = param_2
reg_2 = var_4
store.i64(MEMORY_LIST[0], reg_1 + 0, reg_2)
::continue_at_0::
end
reg_1 = param_1
reg_2 = 1048980
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_1
reg_2 = 32
reg_1 = reg_1 + reg_2
GLOBAL_LIST[0].value = reg_1
end
FUNC_LIST[37] =
function(
param_1, param_2)
local
var_1, var_2= 0, 0
local
reg_1, reg_2
reg_1 = 0
reg_1 = load.i32_u8(MEMORY_LIST[0], reg_1 + 1049469)
reg_1 = param_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
var_1 = reg_1
reg_1 = param_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_2 = reg_1
do
reg_1 = 8
reg_2 = 4
reg_1 =
FUNC_LIST[5](reg_1, reg_2)
param_2 = reg_1
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = 4
reg_2 = 8
FUNC_LIST[45](reg_1, reg_2)
error('unreachable code entered')
::continue_at_0::
end
reg_1 = param_2
reg_2 = var_1
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_2
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = param_1
reg_2 = 1048996
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
end
FUNC_LIST[38] =
function(
param_1, param_2)
local
reg_1, reg_2
reg_1 = param_1
reg_2 = 1048996
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
end
FUNC_LIST[39] =
function(
param_1, param_2, param_3, param_4, param_5, param_6)
local
var_1, var_2= 0, 0
local
reg_1, reg_2, reg_3
reg_1 = GLOBAL_LIST[0].value
reg_2 = 32
reg_1 = reg_1 - reg_2
var_1 = reg_1
GLOBAL_LIST[0].value = reg_1
reg_1 = 0
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049488)
var_2 = reg_2
reg_3 = 1
reg_2 = reg_2 + reg_3
store.i32(MEMORY_LIST[0], reg_1 + 1049488, reg_2)
do
do
reg_1 = var_2
reg_2 = 0
reg_1 = reg_1 < reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = 0
reg_1 = load.i32_u8(MEMORY_LIST[0], reg_1 + 1049948)
reg_2 = 255
reg_1 = band.i32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = 0
reg_2 = 1
store.i32_n8(MEMORY_LIST[0], reg_1 + 1049948, reg_2)
reg_1 = 0
reg_2 = 0
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 1049944)
reg_3 = 1
reg_2 = reg_2 + reg_3
store.i32(MEMORY_LIST[0], reg_1 + 1049944, reg_2)
reg_1 = var_1
reg_2 = param_6
store.i32_n8(MEMORY_LIST[0], reg_1 + 29, reg_2)
reg_1 = var_1
reg_2 = param_5
store.i32_n8(MEMORY_LIST[0], reg_1 + 28, reg_2)
reg_1 = var_1
reg_2 = param_4
store.i32(MEMORY_LIST[0], reg_1 + 24, reg_2)
reg_1 = var_1
reg_2 = param_3
store.i32(MEMORY_LIST[0], reg_1 + 20, reg_2)
reg_1 = var_1
reg_2 = 1049052
store.i32(MEMORY_LIST[0], reg_1 + 16, reg_2)
reg_1 = var_1
reg_2 = 1048652
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049476)
var_2 = reg_1
reg_2 = -1
reg_1 = reg_1 <= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = 0
reg_2 = var_2
reg_3 = 1
reg_2 = reg_2 + reg_3
store.i32(MEMORY_LIST[0], reg_1 + 1049476, reg_2)
do
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049480)
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = var_1
reg_2 = param_1
reg_3 = param_2
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 16)
TABLE_LIST[0][reg_3](reg_1, reg_2)
reg_1 = var_1
reg_2 = var_1
reg_2 = load.i64(MEMORY_LIST[0], reg_2 + 0)
store.i64(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049480)
reg_2 = var_1
reg_3 = 12
reg_2 = reg_2 + reg_3
reg_3 = 0
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 1049484)
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 20)
TABLE_LIST[0][reg_3](reg_1, reg_2)
reg_1 = 0
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 1049476)
reg_2 = -1
reg_1 = reg_1 + reg_2
var_2 = reg_1
::continue_at_2::
end
reg_1 = 0
reg_2 = var_2
store.i32(MEMORY_LIST[0], reg_1 + 1049476, reg_2)
reg_1 = 0
reg_2 = 0
store.i32_n8(MEMORY_LIST[0], reg_1 + 1049948, reg_2)
reg_1 = param_5
if reg_1 ~= 0 then
goto continue_at_0
end
::continue_at_1::
end
error('unreachable code entered')
error('unreachable code entered')
::continue_at_0::
end
reg_1 = param_1
reg_2 = param_2
FUNC_LIST[40](reg_1, reg_2)
error('unreachable code entered')
end
FUNC_LIST[40] =
function(
param_1, param_2)
local
reg_1, reg_2
reg_1 = param_1
reg_2 = param_2
reg_1 =
FUNC_LIST[42](reg_1, reg_2)
error('unreachable code entered')
error('unreachable code entered')
end
FUNC_LIST[41] =
function(
param_1, param_2)
local
var_1= 0
local
reg_1, reg_2, reg_3, reg_4, reg_5
reg_1 = param_2
reg_2 = param_1
reg_3 = 0
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 1049472)
var_1 = reg_3
reg_4 = 2
reg_5 = var_1
if reg_5 == 0 then
reg_3 = reg_4
end
TABLE_LIST[0][reg_3](reg_1, reg_2)
error('unreachable code entered')
error('unreachable code entered')
end
FUNC_LIST[42] =
function(
param_1, param_2)
error('unreachable code entered')
error('unreachable code entered')
do return param_2 end
end
FUNC_LIST[43] =
function(
param_1, param_2, param_3)
local
var_1= 0
local
reg_1, reg_2, reg_3, reg_4, reg_5
reg_1 = param_3
reg_2 = 16
reg_1 = shr.u32(reg_1, reg_2)
reg_1 = grow_page_num(MEMORY_LIST[0], reg_1)
var_1 = reg_1
reg_1 = param_1
reg_2 = 0
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = param_1
reg_2 = 0
reg_3 = param_3
reg_4 = -65536
reg_3 = band.i32(reg_3, reg_4)
reg_4 = var_1
reg_5 = -1
reg_4 = reg_4 == reg_5 and 1 or 0
param_3 = reg_4
if reg_4 == 0 then
reg_2 = reg_3
end
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = param_1
reg_2 = 0
reg_3 = var_1
reg_4 = 16
reg_3 = shl.i32(reg_3, reg_4)
reg_4 = param_3
if reg_4 == 0 then
reg_2 = reg_3
end
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
end
FUNC_LIST[44] =
function(
)
local
var_1= 0
local
reg_1, reg_2
reg_1 = GLOBAL_LIST[0].value
reg_2 = 32
reg_1 = reg_1 - reg_2
var_1 = reg_1
GLOBAL_LIST[0].value = reg_1
reg_1 = var_1
reg_2 = 1
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = var_1
reg_2 = 1049088
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = var_1
reg_2 = 0
store.i64(MEMORY_LIST[0], reg_1 + 20, reg_2)
reg_1 = var_1
reg_2 = 1049068
store.i32(MEMORY_LIST[0], reg_1 + 16, reg_2)
reg_1 = var_1
reg_2 = 8
reg_1 = reg_1 + reg_2
reg_2 = 1049124
FUNC_LIST[48](reg_1, reg_2)
error('unreachable code entered')
end
FUNC_LIST[45] =
function(
param_1, param_2)
local
reg_1, reg_2
reg_1 = param_2
reg_2 = param_1
FUNC_LIST[8](reg_1, reg_2)
error('unreachable code entered')
end
FUNC_LIST[46] =
function(
param_1, param_2)
local
reg_1
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
do
::continue_at_0::
goto continue_at_0
end
do return param_2 end
end
FUNC_LIST[47] =
function(
param_1)
end
FUNC_LIST[48] =
function(
param_1, param_2)
local
var_1= 0
local
reg_1, reg_2
reg_1 = GLOBAL_LIST[0].value
reg_2 = 32
reg_1 = reg_1 - reg_2
var_1 = reg_1
GLOBAL_LIST[0].value = reg_1
reg_1 = var_1
reg_2 = 1
store.i32_n16(MEMORY_LIST[0], reg_1 + 28, reg_2)
reg_1 = var_1
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 24, reg_2)
reg_1 = var_1
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 20, reg_2)
reg_1 = var_1
reg_2 = 1049184
store.i32(MEMORY_LIST[0], reg_1 + 16, reg_2)
reg_1 = var_1
reg_2 = 1049140
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = var_1
reg_2 = 12
reg_1 = reg_1 + reg_2
FUNC_LIST[34](reg_1)
error('unreachable code entered')
end
FUNC_LIST[49] =
function(
param_1, param_2, param_3)
local
var_1= 0
local
reg_1, reg_2, reg_3
reg_1 = GLOBAL_LIST[0].value
reg_2 = 48
reg_1 = reg_1 - reg_2
var_1 = reg_1
GLOBAL_LIST[0].value = reg_1
reg_1 = var_1
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_1
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_1
reg_2 = 44
reg_1 = reg_1 + reg_2
reg_2 = 1
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_1
reg_2 = 2
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = var_1
reg_2 = 1049252
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = var_1
reg_2 = 2
store.i64(MEMORY_LIST[0], reg_1 + 20, reg_2)
reg_1 = var_1
reg_2 = 1
store.i32(MEMORY_LIST[0], reg_1 + 36, reg_2)
reg_1 = var_1
reg_2 = var_1
reg_3 = 32
reg_2 = reg_2 + reg_3
store.i32(MEMORY_LIST[0], reg_1 + 16, reg_2)
reg_1 = var_1
reg_2 = var_1
store.i32(MEMORY_LIST[0], reg_1 + 40, reg_2)
reg_1 = var_1
reg_2 = var_1
reg_3 = 4
reg_2 = reg_2 + reg_3
store.i32(MEMORY_LIST[0], reg_1 + 32, reg_2)
reg_1 = var_1
reg_2 = 8
reg_1 = reg_1 + reg_2
reg_2 = param_3
FUNC_LIST[48](reg_1, reg_2)
error('unreachable code entered')
end
FUNC_LIST[50] =
function(
param_1, param_2, param_3)
local
var_1= 0
local
reg_1, reg_2, reg_3
reg_1 = GLOBAL_LIST[0].value
reg_2 = 32
reg_1 = reg_1 - reg_2
var_1 = reg_1
GLOBAL_LIST[0].value = reg_1
reg_1 = var_1
reg_2 = 1
store.i32(MEMORY_LIST[0], reg_1 + 4, reg_2)
reg_1 = var_1
reg_2 = 0
store.i64(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = var_1
reg_2 = 1049140
store.i32(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = var_1
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 28, reg_2)
reg_1 = var_1
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 24, reg_2)
reg_1 = var_1
reg_2 = var_1
reg_3 = 24
reg_2 = reg_2 + reg_3
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_1
reg_2 = param_3
FUNC_LIST[48](reg_1, reg_2)
error('unreachable code entered')
end
FUNC_LIST[51] =
function(
param_1, param_2)
local
reg_1, reg_2, reg_3
reg_1 = param_1
reg_1 = load.i64_u32(MEMORY_LIST[0], reg_1 + 0)
reg_2 = 1
reg_3 = param_2
reg_1 =
FUNC_LIST[58](reg_1, reg_2, reg_3)
do return reg_1 end
end
FUNC_LIST[52] =
function(
param_1, param_2, param_3)
local
var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9, var_10= 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
local
reg_1, reg_2, reg_3, reg_4
reg_1 = GLOBAL_LIST[0].value
reg_2 = 48
reg_1 = reg_1 - reg_2
var_1 = reg_1
GLOBAL_LIST[0].value = reg_1
reg_1 = var_1
reg_2 = 3
store.i32_n8(MEMORY_LIST[0], reg_1 + 44, reg_2)
reg_1 = var_1
reg_2 = 32
store.i32(MEMORY_LIST[0], reg_1 + 28, reg_2)
reg_1 = 0
var_2 = reg_1
reg_1 = var_1
reg_2 = 0
store.i32(MEMORY_LIST[0], reg_1 + 40, reg_2)
reg_1 = var_1
reg_2 = param_2
store.i32(MEMORY_LIST[0], reg_1 + 36, reg_2)
reg_1 = var_1
reg_2 = param_1
store.i32(MEMORY_LIST[0], reg_1 + 32, reg_2)
reg_1 = var_1
reg_2 = 0
store.i32(MEMORY_LIST[0], reg_1 + 20, reg_2)
reg_1 = var_1
reg_2 = 0
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
do
do
do
do
do
reg_1 = param_3
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 16)
var_3 = reg_1
if reg_1 ~= 0 then
goto continue_at_4
end
reg_1 = param_3
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 12)
param_1 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_3
end
reg_1 = param_3
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
param_2 = reg_1
reg_1 = param_1
reg_2 = 3
reg_1 = shl.i32(reg_1, reg_2)
var_4 = reg_1
reg_1 = param_1
reg_2 = -1
reg_1 = reg_1 + reg_2
reg_2 = 536870911
reg_1 = band.i32(reg_1, reg_2)
reg_2 = 1
reg_1 = reg_1 + reg_2
var_2 = reg_1
reg_1 = param_3
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
param_1 = reg_1
do
::continue_at_5::
do
reg_1 = param_1
reg_2 = 4
reg_1 = reg_1 + reg_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_5 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_6
end
reg_1 = var_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 32)
reg_2 = param_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 0)
reg_3 = var_5
reg_4 = var_1
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 36)
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 12)
reg_1 =
TABLE_LIST[0][reg_4](reg_1, reg_2, reg_3)
if reg_1 ~= 0 then
goto continue_at_2
end
::continue_at_6::
end
reg_1 = param_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
reg_2 = var_1
reg_3 = 12
reg_2 = reg_2 + reg_3
reg_3 = param_2
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 4)
reg_1 =
TABLE_LIST[0][reg_3](reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = param_2
reg_2 = 8
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_1 = param_1
reg_2 = 8
reg_1 = reg_1 + reg_2
param_1 = reg_1
reg_1 = var_4
reg_2 = -8
reg_1 = reg_1 + reg_2
var_4 = reg_1
if reg_1 ~= 0 then
goto continue_at_5
end
goto continue_at_3
end
::continue_at_4::
end
reg_1 = param_3
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 20)
param_2 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_3
end
reg_1 = param_2
reg_2 = 5
reg_1 = shl.i32(reg_1, reg_2)
var_6 = reg_1
reg_1 = param_2
reg_2 = -1
reg_1 = reg_1 + reg_2
reg_2 = 134217727
reg_1 = band.i32(reg_1, reg_2)
reg_2 = 1
reg_1 = reg_1 + reg_2
var_2 = reg_1
reg_1 = param_3
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
var_7 = reg_1
reg_1 = param_3
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
param_1 = reg_1
reg_1 = 0
var_4 = reg_1
do
::continue_at_4::
do
reg_1 = param_1
reg_2 = 4
reg_1 = reg_1 + reg_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
param_2 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_5
end
reg_1 = var_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 32)
reg_2 = param_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 0)
reg_3 = param_2
reg_4 = var_1
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 36)
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 12)
reg_1 =
TABLE_LIST[0][reg_4](reg_1, reg_2, reg_3)
if reg_1 ~= 0 then
goto continue_at_2
end
::continue_at_5::
end
reg_1 = var_1
reg_2 = var_3
reg_3 = var_4
reg_2 = reg_2 + reg_3
param_2 = reg_2
reg_3 = 16
reg_2 = reg_2 + reg_3
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 0)
store.i32(MEMORY_LIST[0], reg_1 + 28, reg_2)
reg_1 = var_1
reg_2 = param_2
reg_3 = 28
reg_2 = reg_2 + reg_3
reg_2 = load.i32_u8(MEMORY_LIST[0], reg_2 + 0)
store.i32_n8(MEMORY_LIST[0], reg_1 + 44, reg_2)
reg_1 = var_1
reg_2 = param_2
reg_3 = 24
reg_2 = reg_2 + reg_3
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 0)
store.i32(MEMORY_LIST[0], reg_1 + 40, reg_2)
reg_1 = param_2
reg_2 = 12
reg_1 = reg_1 + reg_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_5 = reg_1
reg_1 = 0
var_8 = reg_1
reg_1 = 0
var_9 = reg_1
do
do
do
reg_1 = param_2
reg_2 = 8
reg_1 = reg_1 + reg_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
if reg_1 == 0 then
goto continue_at_6
elseif reg_1 == 1 then
goto continue_at_7
elseif reg_1 == 2 then
goto continue_at_5
else
goto continue_at_6
end
::continue_at_7::
end
reg_1 = var_5
reg_2 = 3
reg_1 = shl.i32(reg_1, reg_2)
var_10 = reg_1
reg_1 = 0
var_9 = reg_1
reg_1 = var_7
reg_2 = var_10
reg_1 = reg_1 + reg_2
var_10 = reg_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
reg_2 = 17
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_5
end
reg_1 = var_10
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_5 = reg_1
::continue_at_6::
end
reg_1 = 1
var_9 = reg_1
::continue_at_5::
end
reg_1 = var_1
reg_2 = var_5
store.i32(MEMORY_LIST[0], reg_1 + 16, reg_2)
reg_1 = var_1
reg_2 = var_9
store.i32(MEMORY_LIST[0], reg_1 + 12, reg_2)
reg_1 = param_2
reg_2 = 4
reg_1 = reg_1 + reg_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_5 = reg_1
do
do
do
reg_1 = param_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
if reg_1 == 0 then
goto continue_at_6
elseif reg_1 == 1 then
goto continue_at_7
elseif reg_1 == 2 then
goto continue_at_5
else
goto continue_at_6
end
::continue_at_7::
end
reg_1 = var_5
reg_2 = 3
reg_1 = shl.i32(reg_1, reg_2)
var_9 = reg_1
reg_1 = var_7
reg_2 = var_9
reg_1 = reg_1 + reg_2
var_9 = reg_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
reg_2 = 17
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_5
end
reg_1 = var_9
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_5 = reg_1
::continue_at_6::
end
reg_1 = 1
var_8 = reg_1
::continue_at_5::
end
reg_1 = var_1
reg_2 = var_5
store.i32(MEMORY_LIST[0], reg_1 + 24, reg_2)
reg_1 = var_1
reg_2 = var_8
store.i32(MEMORY_LIST[0], reg_1 + 20, reg_2)
reg_1 = var_7
reg_2 = param_2
reg_3 = 20
reg_2 = reg_2 + reg_3
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 0)
reg_3 = 3
reg_2 = shl.i32(reg_2, reg_3)
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
reg_2 = var_1
reg_3 = 12
reg_2 = reg_2 + reg_3
reg_3 = param_2
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 4)
reg_1 =
TABLE_LIST[0][reg_3](reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = param_1
reg_2 = 8
reg_1 = reg_1 + reg_2
param_1 = reg_1
reg_1 = var_6
reg_2 = var_4
reg_3 = 32
reg_2 = reg_2 + reg_3
var_4 = reg_2
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_4
end
end
::continue_at_3::
end
reg_1 = var_2
reg_2 = param_3
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 4)
reg_1 = ge.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = var_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 32)
reg_2 = param_3
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 0)
reg_3 = var_2
reg_4 = 3
reg_3 = shl.i32(reg_3, reg_4)
reg_2 = reg_2 + reg_3
param_2 = reg_2
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 0)
reg_3 = param_2
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 4)
reg_4 = var_1
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 36)
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 12)
reg_1 =
TABLE_LIST[0][reg_4](reg_1, reg_2, reg_3)
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_1
end
::continue_at_2::
end
reg_1 = 1
param_2 = reg_1
goto continue_at_0
::continue_at_1::
end
reg_1 = 0
param_2 = reg_1
::continue_at_0::
end
reg_1 = var_1
reg_2 = 48
reg_1 = reg_1 + reg_2
GLOBAL_LIST[0].value = reg_1
reg_1 = param_2
do return reg_1 end
end
FUNC_LIST[53] =
function(
param_1, param_2)
local
reg_1, reg_2
reg_1 = param_1
reg_2 = 4363014821963114893
store.i64(MEMORY_LIST[0], reg_1 + 8, reg_2)
reg_1 = param_1
reg_2 = -354935419601612971
store.i64(MEMORY_LIST[0], reg_1 + 0, reg_2)
end
FUNC_LIST[54] =
function(
param_1)
local
reg_1, reg_2, reg_3
reg_1 = 1049140
reg_2 = 43
reg_3 = param_1
FUNC_LIST[50](reg_1, reg_2, reg_3)
error('unreachable code entered')
end
FUNC_LIST[55] =
function(
param_1, param_2, param_3, param_4, param_5, param_6)
local
var_1, var_2, var_3, var_4, var_5, var_6, var_7= 0, 0, 0, 0, 0, 0, 0
local
reg_1, reg_2, reg_3, reg_4, reg_5
do
do
reg_1 = param_2
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = param_6
reg_2 = 1
reg_1 = reg_1 + reg_2
var_1 = reg_1
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 28)
var_2 = reg_1
reg_1 = 45
var_3 = reg_1
goto continue_at_0
::continue_at_1::
end
reg_1 = 43
reg_2 = 1114112
reg_3 = param_1
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 28)
var_2 = reg_3
reg_4 = 1
reg_3 = band.i32(reg_3, reg_4)
param_2 = reg_3
if reg_3 == 0 then
reg_1 = reg_2
end
var_3 = reg_1
reg_1 = param_2
reg_2 = param_6
reg_1 = reg_1 + reg_2
var_1 = reg_1
::continue_at_0::
end
do
do
reg_1 = var_2
reg_2 = 4
reg_1 = band.i32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = 0
param_3 = reg_1
goto continue_at_0
::continue_at_1::
end
do
do
reg_1 = param_4
reg_2 = 16
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = param_3
reg_2 = param_4
reg_1 =
FUNC_LIST[56](reg_1, reg_2)
param_2 = reg_1
goto continue_at_1
::continue_at_2::
end
do
reg_1 = param_4
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = 0
param_2 = reg_1
goto continue_at_1
::continue_at_2::
end
reg_1 = param_4
reg_2 = 3
reg_1 = band.i32(reg_1, reg_2)
var_4 = reg_1
do
do
reg_1 = param_4
reg_2 = 4
reg_1 = ge.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_3
end
reg_1 = 0
param_2 = reg_1
reg_1 = 0
var_5 = reg_1
goto continue_at_2
::continue_at_3::
end
reg_1 = param_4
reg_2 = 12
reg_1 = band.i32(reg_1, reg_2)
var_6 = reg_1
reg_1 = 0
param_2 = reg_1
reg_1 = 0
var_5 = reg_1
do
::continue_at_3::
reg_1 = param_2
reg_2 = param_3
reg_3 = var_5
reg_2 = reg_2 + reg_3
var_7 = reg_2
reg_2 = load.i32_i8(MEMORY_LIST[0], reg_2 + 0)
reg_3 = -65
reg_2 = reg_2 > reg_3 and 1 or 0
reg_1 = reg_1 + reg_2
reg_2 = var_7
reg_3 = 1
reg_2 = reg_2 + reg_3
reg_2 = load.i32_i8(MEMORY_LIST[0], reg_2 + 0)
reg_3 = -65
reg_2 = reg_2 > reg_3 and 1 or 0
reg_1 = reg_1 + reg_2
reg_2 = var_7
reg_3 = 2
reg_2 = reg_2 + reg_3
reg_2 = load.i32_i8(MEMORY_LIST[0], reg_2 + 0)
reg_3 = -65
reg_2 = reg_2 > reg_3 and 1 or 0
reg_1 = reg_1 + reg_2
reg_2 = var_7
reg_3 = 3
reg_2 = reg_2 + reg_3
reg_2 = load.i32_i8(MEMORY_LIST[0], reg_2 + 0)
reg_3 = -65
reg_2 = reg_2 > reg_3 and 1 or 0
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_1 = var_6
reg_2 = var_5
reg_3 = 4
reg_2 = reg_2 + reg_3
var_5 = reg_2
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_3
end
end
::continue_at_2::
end
reg_1 = var_4
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = param_3
reg_2 = var_5
reg_1 = reg_1 + reg_2
var_7 = reg_1
do
::continue_at_2::
reg_1 = param_2
reg_2 = var_7
reg_2 = load.i32_i8(MEMORY_LIST[0], reg_2 + 0)
reg_3 = -65
reg_2 = reg_2 > reg_3 and 1 or 0
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_1 = var_7
reg_2 = 1
reg_1 = reg_1 + reg_2
var_7 = reg_1
reg_1 = var_4
reg_2 = -1
reg_1 = reg_1 + reg_2
var_4 = reg_1
if reg_1 ~= 0 then
goto continue_at_2
end
end
::continue_at_1::
end
reg_1 = param_2
reg_2 = var_1
reg_1 = reg_1 + reg_2
var_1 = reg_1
::continue_at_0::
end
do
do
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = 1
param_2 = reg_1
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 20)
var_7 = reg_1
reg_2 = param_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 24)
var_5 = reg_2
reg_3 = var_3
reg_4 = param_3
reg_5 = param_4
reg_1 =
FUNC_LIST[57](reg_1, reg_2, reg_3, reg_4, reg_5)
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = var_7
reg_2 = param_5
reg_3 = param_6
reg_4 = var_5
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 12)
reg_1 =
TABLE_LIST[0][reg_4](reg_1, reg_2, reg_3)
do return reg_1 end
::continue_at_1::
end
do
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
var_4 = reg_1
reg_2 = var_1
reg_1 = gt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = 1
param_2 = reg_1
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 20)
var_7 = reg_1
reg_2 = param_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 24)
var_5 = reg_2
reg_3 = var_3
reg_4 = param_3
reg_5 = param_4
reg_1 =
FUNC_LIST[57](reg_1, reg_2, reg_3, reg_4, reg_5)
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = var_7
reg_2 = param_5
reg_3 = param_6
reg_4 = var_5
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 12)
reg_1 =
TABLE_LIST[0][reg_4](reg_1, reg_2, reg_3)
do return reg_1 end
::continue_at_1::
end
do
reg_1 = var_2
reg_2 = 8
reg_1 = band.i32(reg_1, reg_2)
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 16)
var_6 = reg_1
reg_1 = param_1
reg_2 = 48
store.i32(MEMORY_LIST[0], reg_1 + 16, reg_2)
reg_1 = param_1
reg_1 = load.i32_u8(MEMORY_LIST[0], reg_1 + 32)
var_2 = reg_1
reg_1 = 1
param_2 = reg_1
reg_1 = param_1
reg_2 = 1
store.i32_n8(MEMORY_LIST[0], reg_1 + 32, reg_2)
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 20)
var_7 = reg_1
reg_2 = param_1
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 24)
var_5 = reg_2
reg_3 = var_3
reg_4 = param_3
reg_5 = param_4
reg_1 =
FUNC_LIST[57](reg_1, reg_2, reg_3, reg_4, reg_5)
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = var_4
reg_2 = var_1
reg_1 = reg_1 - reg_2
reg_2 = 1
reg_1 = reg_1 + reg_2
param_2 = reg_1
do
do
::continue_at_3::
reg_1 = param_2
reg_2 = -1
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = var_7
reg_2 = 48
reg_3 = var_5
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 16)
reg_1 =
TABLE_LIST[0][reg_3](reg_1, reg_2)
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_3
end
end
reg_1 = 1
do return reg_1 end
::continue_at_2::
end
reg_1 = 1
param_2 = reg_1
reg_1 = var_7
reg_2 = param_5
reg_3 = param_6
reg_4 = var_5
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 12)
reg_1 =
TABLE_LIST[0][reg_4](reg_1, reg_2, reg_3)
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = param_1
reg_2 = var_2
store.i32_n8(MEMORY_LIST[0], reg_1 + 32, reg_2)
reg_1 = param_1
reg_2 = var_6
store.i32(MEMORY_LIST[0], reg_1 + 16, reg_2)
reg_1 = 0
param_2 = reg_1
goto continue_at_0
::continue_at_1::
end
reg_1 = var_4
reg_2 = var_1
reg_1 = reg_1 - reg_2
var_1 = reg_1
do
do
do
reg_1 = param_1
reg_1 = load.i32_u8(MEMORY_LIST[0], reg_1 + 32)
param_2 = reg_1
if reg_1 == 0 then
goto continue_at_1
elseif reg_1 == 1 then
goto continue_at_3
elseif reg_1 == 2 then
goto continue_at_2
elseif reg_1 == 3 then
goto continue_at_3
else
goto continue_at_1
end
::continue_at_3::
end
reg_1 = var_1
param_2 = reg_1
reg_1 = 0
var_1 = reg_1
goto continue_at_1
::continue_at_2::
end
reg_1 = var_1
reg_2 = 1
reg_1 = shr.u32(reg_1, reg_2)
param_2 = reg_1
reg_1 = var_1
reg_2 = 1
reg_1 = reg_1 + reg_2
reg_2 = 1
reg_1 = shr.u32(reg_1, reg_2)
var_1 = reg_1
::continue_at_1::
end
reg_1 = param_2
reg_2 = 1
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 16)
var_4 = reg_1
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 24)
var_7 = reg_1
reg_1 = param_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 20)
var_5 = reg_1
do
do
::continue_at_2::
reg_1 = param_2
reg_2 = -1
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = var_5
reg_2 = var_4
reg_3 = var_7
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 16)
reg_1 =
TABLE_LIST[0][reg_3](reg_1, reg_2)
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
end
reg_1 = 1
do return reg_1 end
::continue_at_1::
end
reg_1 = 1
param_2 = reg_1
reg_1 = var_5
reg_2 = var_7
reg_3 = var_3
reg_4 = param_3
reg_5 = param_4
reg_1 =
FUNC_LIST[57](reg_1, reg_2, reg_3, reg_4, reg_5)
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = var_5
reg_2 = param_5
reg_3 = param_6
reg_4 = var_7
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 12)
reg_1 =
TABLE_LIST[0][reg_4](reg_1, reg_2, reg_3)
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = 0
param_2 = reg_1
do
::continue_at_1::
do
reg_1 = var_1
reg_2 = param_2
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = var_1
reg_2 = var_1
reg_1 = lt.u32(reg_1, reg_2)
do return reg_1 end
::continue_at_2::
end
reg_1 = param_2
reg_2 = 1
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_1 = var_5
reg_2 = var_4
reg_3 = var_7
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 16)
reg_1 =
TABLE_LIST[0][reg_3](reg_1, reg_2)
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_1
end
end
reg_1 = param_2
reg_2 = -1
reg_1 = reg_1 + reg_2
reg_2 = var_1
reg_1 = lt.u32(reg_1, reg_2)
do return reg_1 end
::continue_at_0::
end
reg_1 = param_2
do return reg_1 end
end
FUNC_LIST[56] =
function(
param_1, param_2)
local
var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8= 0, 0, 0, 0, 0, 0, 0, 0
local
reg_1, reg_2, reg_3, reg_4, reg_5, reg_6
do
do
reg_1 = param_2
reg_2 = param_1
reg_3 = 3
reg_2 = reg_2 + reg_3
reg_3 = -4
reg_2 = band.i32(reg_2, reg_3)
var_1 = reg_2
reg_3 = param_1
reg_2 = reg_2 - reg_3
var_2 = reg_2
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = param_2
reg_2 = var_2
reg_1 = reg_1 - reg_2
var_3 = reg_1
reg_2 = 4
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = var_3
reg_2 = 3
reg_1 = band.i32(reg_1, reg_2)
var_4 = reg_1
reg_1 = 0
var_5 = reg_1
reg_1 = 0
param_2 = reg_1
do
reg_1 = var_1
reg_2 = param_1
reg_1 = reg_1 == reg_2 and 1 or 0
var_6 = reg_1
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = 0
param_2 = reg_1
do
do
reg_1 = param_1
reg_2 = var_1
reg_1 = reg_1 - reg_2
var_7 = reg_1
reg_2 = -4
reg_1 = le.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_4
end
reg_1 = 0
var_8 = reg_1
goto continue_at_3
::continue_at_4::
end
reg_1 = 0
var_8 = reg_1
do
::continue_at_4::
reg_1 = param_2
reg_2 = param_1
reg_3 = var_8
reg_2 = reg_2 + reg_3
var_1 = reg_2
reg_2 = load.i32_i8(MEMORY_LIST[0], reg_2 + 0)
reg_3 = -65
reg_2 = reg_2 > reg_3 and 1 or 0
reg_1 = reg_1 + reg_2
reg_2 = var_1
reg_3 = 1
reg_2 = reg_2 + reg_3
reg_2 = load.i32_i8(MEMORY_LIST[0], reg_2 + 0)
reg_3 = -65
reg_2 = reg_2 > reg_3 and 1 or 0
reg_1 = reg_1 + reg_2
reg_2 = var_1
reg_3 = 2
reg_2 = reg_2 + reg_3
reg_2 = load.i32_i8(MEMORY_LIST[0], reg_2 + 0)
reg_3 = -65
reg_2 = reg_2 > reg_3 and 1 or 0
reg_1 = reg_1 + reg_2
reg_2 = var_1
reg_3 = 3
reg_2 = reg_2 + reg_3
reg_2 = load.i32_i8(MEMORY_LIST[0], reg_2 + 0)
reg_3 = -65
reg_2 = reg_2 > reg_3 and 1 or 0
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_1 = var_8
reg_2 = 4
reg_1 = reg_1 + reg_2
var_8 = reg_1
if reg_1 ~= 0 then
goto continue_at_4
end
end
::continue_at_3::
end
reg_1 = var_6
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = param_1
reg_2 = var_8
reg_1 = reg_1 + reg_2
var_1 = reg_1
do
::continue_at_3::
reg_1 = param_2
reg_2 = var_1
reg_2 = load.i32_i8(MEMORY_LIST[0], reg_2 + 0)
reg_3 = -65
reg_2 = reg_2 > reg_3 and 1 or 0
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_1 = var_1
reg_2 = 1
reg_1 = reg_1 + reg_2
var_1 = reg_1
reg_1 = var_7
reg_2 = 1
reg_1 = reg_1 + reg_2
var_7 = reg_1
if reg_1 ~= 0 then
goto continue_at_3
end
end
::continue_at_2::
end
reg_1 = param_1
reg_2 = var_2
reg_1 = reg_1 + reg_2
var_8 = reg_1
do
reg_1 = var_4
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = var_8
reg_2 = var_3
reg_3 = -4
reg_2 = band.i32(reg_2, reg_3)
reg_1 = reg_1 + reg_2
var_1 = reg_1
reg_1 = load.i32_i8(MEMORY_LIST[0], reg_1 + 0)
reg_2 = -65
reg_1 = reg_1 > reg_2 and 1 or 0
var_5 = reg_1
reg_1 = var_4
reg_2 = 1
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = var_5
reg_2 = var_1
reg_2 = load.i32_i8(MEMORY_LIST[0], reg_2 + 1)
reg_3 = -65
reg_2 = reg_2 > reg_3 and 1 or 0
reg_1 = reg_1 + reg_2
var_5 = reg_1
reg_1 = var_4
reg_2 = 2
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = var_5
reg_2 = var_1
reg_2 = load.i32_i8(MEMORY_LIST[0], reg_2 + 2)
reg_3 = -65
reg_2 = reg_2 > reg_3 and 1 or 0
reg_1 = reg_1 + reg_2
var_5 = reg_1
::continue_at_2::
end
reg_1 = var_3
reg_2 = 2
reg_1 = shr.u32(reg_1, reg_2)
var_2 = reg_1
reg_1 = var_5
reg_2 = param_2
reg_1 = reg_1 + reg_2
var_7 = reg_1
do
::continue_at_2::
reg_1 = var_8
var_3 = reg_1
reg_1 = var_2
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = var_2
reg_2 = 192
reg_3 = var_2
reg_4 = 192
reg_3 = lt.u32(reg_3, reg_4)
if reg_3 == 0 then
reg_1 = reg_2
end
var_5 = reg_1
reg_2 = 3
reg_1 = band.i32(reg_1, reg_2)
var_6 = reg_1
reg_1 = var_5
reg_2 = 2
reg_1 = shl.i32(reg_1, reg_2)
var_4 = reg_1
reg_1 = 0
var_1 = reg_1
do
reg_1 = var_2
reg_2 = 4
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_3
end
reg_1 = var_3
reg_2 = var_4
reg_3 = 1008
reg_2 = band.i32(reg_2, reg_3)
reg_1 = reg_1 + reg_2
param_1 = reg_1
reg_1 = 0
var_1 = reg_1
reg_1 = var_3
param_2 = reg_1
do
::continue_at_4::
reg_1 = param_2
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 12)
var_8 = reg_1
reg_2 = -1
reg_1 = bxor.i32(reg_1, reg_2)
reg_2 = 7
reg_1 = shr.u32(reg_1, reg_2)
reg_2 = var_8
reg_3 = 6
reg_2 = shr.u32(reg_2, reg_3)
reg_1 = bor.i32(reg_1, reg_2)
reg_2 = 16843009
reg_1 = band.i32(reg_1, reg_2)
reg_2 = param_2
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 8)
var_8 = reg_2
reg_3 = -1
reg_2 = bxor.i32(reg_2, reg_3)
reg_3 = 7
reg_2 = shr.u32(reg_2, reg_3)
reg_3 = var_8
reg_4 = 6
reg_3 = shr.u32(reg_3, reg_4)
reg_2 = bor.i32(reg_2, reg_3)
reg_3 = 16843009
reg_2 = band.i32(reg_2, reg_3)
reg_3 = param_2
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 4)
var_8 = reg_3
reg_4 = -1
reg_3 = bxor.i32(reg_3, reg_4)
reg_4 = 7
reg_3 = shr.u32(reg_3, reg_4)
reg_4 = var_8
reg_5 = 6
reg_4 = shr.u32(reg_4, reg_5)
reg_3 = bor.i32(reg_3, reg_4)
reg_4 = 16843009
reg_3 = band.i32(reg_3, reg_4)
reg_4 = param_2
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 0)
var_8 = reg_4
reg_5 = -1
reg_4 = bxor.i32(reg_4, reg_5)
reg_5 = 7
reg_4 = shr.u32(reg_4, reg_5)
reg_5 = var_8
reg_6 = 6
reg_5 = shr.u32(reg_5, reg_6)
reg_4 = bor.i32(reg_4, reg_5)
reg_5 = 16843009
reg_4 = band.i32(reg_4, reg_5)
reg_5 = var_1
reg_4 = reg_4 + reg_5
reg_3 = reg_3 + reg_4
reg_2 = reg_2 + reg_3
reg_1 = reg_1 + reg_2
var_1 = reg_1
reg_1 = param_2
reg_2 = 16
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_2 = param_1
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_4
end
end
::continue_at_3::
end
reg_1 = var_2
reg_2 = var_5
reg_1 = reg_1 - reg_2
var_2 = reg_1
reg_1 = var_3
reg_2 = var_4
reg_1 = reg_1 + reg_2
var_8 = reg_1
reg_1 = var_1
reg_2 = 8
reg_1 = shr.u32(reg_1, reg_2)
reg_2 = 16711935
reg_1 = band.i32(reg_1, reg_2)
reg_2 = var_1
reg_3 = 16711935
reg_2 = band.i32(reg_2, reg_3)
reg_1 = reg_1 + reg_2
reg_2 = 65537
reg_1 = reg_1 * reg_2
reg_2 = 16
reg_1 = shr.u32(reg_1, reg_2)
reg_2 = var_7
reg_1 = reg_1 + reg_2
var_7 = reg_1
reg_1 = var_6
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
end
reg_1 = var_3
reg_2 = var_5
reg_3 = 252
reg_2 = band.i32(reg_2, reg_3)
reg_3 = 2
reg_2 = shl.i32(reg_2, reg_3)
reg_1 = reg_1 + reg_2
var_1 = reg_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
param_2 = reg_1
reg_2 = -1
reg_1 = bxor.i32(reg_1, reg_2)
reg_2 = 7
reg_1 = shr.u32(reg_1, reg_2)
reg_2 = param_2
reg_3 = 6
reg_2 = shr.u32(reg_2, reg_3)
reg_1 = bor.i32(reg_1, reg_2)
reg_2 = 16843009
reg_1 = band.i32(reg_1, reg_2)
param_2 = reg_1
do
reg_1 = var_6
reg_2 = 1
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = var_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 4)
var_8 = reg_1
reg_2 = -1
reg_1 = bxor.i32(reg_1, reg_2)
reg_2 = 7
reg_1 = shr.u32(reg_1, reg_2)
reg_2 = var_8
reg_3 = 6
reg_2 = shr.u32(reg_2, reg_3)
reg_1 = bor.i32(reg_1, reg_2)
reg_2 = 16843009
reg_1 = band.i32(reg_1, reg_2)
reg_2 = param_2
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_1 = var_6
reg_2 = 2
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = var_1
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 8)
var_1 = reg_1
reg_2 = -1
reg_1 = bxor.i32(reg_1, reg_2)
reg_2 = 7
reg_1 = shr.u32(reg_1, reg_2)
reg_2 = var_1
reg_3 = 6
reg_2 = shr.u32(reg_2, reg_3)
reg_1 = bor.i32(reg_1, reg_2)
reg_2 = 16843009
reg_1 = band.i32(reg_1, reg_2)
reg_2 = param_2
reg_1 = reg_1 + reg_2
param_2 = reg_1
::continue_at_2::
end
reg_1 = param_2
reg_2 = 8
reg_1 = shr.u32(reg_1, reg_2)
reg_2 = 459007
reg_1 = band.i32(reg_1, reg_2)
reg_2 = param_2
reg_3 = 16711935
reg_2 = band.i32(reg_2, reg_3)
reg_1 = reg_1 + reg_2
reg_2 = 65537
reg_1 = reg_1 * reg_2
reg_2 = 16
reg_1 = shr.u32(reg_1, reg_2)
reg_2 = var_7
reg_1 = reg_1 + reg_2
do return reg_1 end
::continue_at_1::
end
do
reg_1 = param_2
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = 0
do return reg_1 end
::continue_at_1::
end
reg_1 = param_2
reg_2 = 3
reg_1 = band.i32(reg_1, reg_2)
var_8 = reg_1
do
do
reg_1 = param_2
reg_2 = 4
reg_1 = ge.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = 0
var_7 = reg_1
reg_1 = 0
var_1 = reg_1
goto continue_at_1
::continue_at_2::
end
reg_1 = param_2
reg_2 = -4
reg_1 = band.i32(reg_1, reg_2)
var_2 = reg_1
reg_1 = 0
var_7 = reg_1
reg_1 = 0
var_1 = reg_1
do
::continue_at_2::
reg_1 = var_7
reg_2 = param_1
reg_3 = var_1
reg_2 = reg_2 + reg_3
param_2 = reg_2
reg_2 = load.i32_i8(MEMORY_LIST[0], reg_2 + 0)
reg_3 = -65
reg_2 = reg_2 > reg_3 and 1 or 0
reg_1 = reg_1 + reg_2
reg_2 = param_2
reg_3 = 1
reg_2 = reg_2 + reg_3
reg_2 = load.i32_i8(MEMORY_LIST[0], reg_2 + 0)
reg_3 = -65
reg_2 = reg_2 > reg_3 and 1 or 0
reg_1 = reg_1 + reg_2
reg_2 = param_2
reg_3 = 2
reg_2 = reg_2 + reg_3
reg_2 = load.i32_i8(MEMORY_LIST[0], reg_2 + 0)
reg_3 = -65
reg_2 = reg_2 > reg_3 and 1 or 0
reg_1 = reg_1 + reg_2
reg_2 = param_2
reg_3 = 3
reg_2 = reg_2 + reg_3
reg_2 = load.i32_i8(MEMORY_LIST[0], reg_2 + 0)
reg_3 = -65
reg_2 = reg_2 > reg_3 and 1 or 0
reg_1 = reg_1 + reg_2
var_7 = reg_1
reg_1 = var_2
reg_2 = var_1
reg_3 = 4
reg_2 = reg_2 + reg_3
var_1 = reg_2
reg_1 = reg_1 ~= reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
end
::continue_at_1::
end
reg_1 = var_8
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = param_1
reg_2 = var_1
reg_1 = reg_1 + reg_2
param_2 = reg_1
do
::continue_at_1::
reg_1 = var_7
reg_2 = param_2
reg_2 = load.i32_i8(MEMORY_LIST[0], reg_2 + 0)
reg_3 = -65
reg_2 = reg_2 > reg_3 and 1 or 0
reg_1 = reg_1 + reg_2
var_7 = reg_1
reg_1 = param_2
reg_2 = 1
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_1 = var_8
reg_2 = -1
reg_1 = reg_1 + reg_2
var_8 = reg_1
if reg_1 ~= 0 then
goto continue_at_1
end
end
::continue_at_0::
end
reg_1 = var_7
do return reg_1 end
end
FUNC_LIST[57] =
function(
param_1, param_2, param_3, param_4, param_5)
local
var_1= 0
local
reg_1, reg_2, reg_3, reg_4
do
do
do
reg_1 = param_3
reg_2 = 1114112
reg_1 = reg_1 == reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = 1
var_1 = reg_1
reg_1 = param_1
reg_2 = param_3
reg_3 = param_2
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 16)
reg_1 =
TABLE_LIST[0][reg_3](reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_1
end
::continue_at_2::
end
reg_1 = param_4
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = 0
var_1 = reg_1
::continue_at_1::
end
reg_1 = var_1
do return reg_1 end
::continue_at_0::
end
reg_1 = param_1
reg_2 = param_4
reg_3 = param_5
reg_4 = param_2
reg_4 = load.i32(MEMORY_LIST[0], reg_4 + 12)
reg_1 =
TABLE_LIST[0][reg_4](reg_1, reg_2, reg_3)
do return reg_1 end
end
FUNC_LIST[58] =
function(
param_1, param_2, param_3)
local
var_1, var_2, var_3, var_4, var_5, var_6= 0, 0, 0, 0, 0, 0
local
reg_1, reg_2, reg_3, reg_4, reg_5, reg_6, reg_7
reg_1 = GLOBAL_LIST[0].value
reg_2 = 48
reg_1 = reg_1 - reg_2
var_1 = reg_1
GLOBAL_LIST[0].value = reg_1
reg_1 = 39
var_2 = reg_1
do
do
reg_1 = param_1
reg_2 = 10000
reg_1 = ge.u64(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = param_1
var_3 = reg_1
goto continue_at_0
::continue_at_1::
end
reg_1 = 39
var_2 = reg_1
do
::continue_at_1::
reg_1 = var_1
reg_2 = 9
reg_1 = reg_1 + reg_2
reg_2 = var_2
reg_1 = reg_1 + reg_2
var_4 = reg_1
reg_2 = -4
reg_1 = reg_1 + reg_2
reg_2 = param_1
reg_3 = param_1
reg_4 = 10000
reg_3 = div.u64(reg_3, reg_4)
var_3 = reg_3
reg_4 = 10000
reg_3 = reg_3 * reg_4
reg_2 = reg_2 - reg_3
reg_2 = wrap.i64_i32(reg_2)
var_5 = reg_2
reg_3 = 65535
reg_2 = band.i32(reg_2, reg_3)
reg_3 = 100
reg_2 = div.u32(reg_2, reg_3)
var_6 = reg_2
reg_3 = 1
reg_2 = shl.i32(reg_2, reg_3)
reg_3 = 1049268
reg_2 = reg_2 + reg_3
reg_2 = load.i32_u16(MEMORY_LIST[0], reg_2 + 0)
store.i32_n16(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_4
reg_2 = -2
reg_1 = reg_1 + reg_2
reg_2 = var_5
reg_3 = var_6
reg_4 = 100
reg_3 = reg_3 * reg_4
reg_2 = reg_2 - reg_3
reg_3 = 65535
reg_2 = band.i32(reg_2, reg_3)
reg_3 = 1
reg_2 = shl.i32(reg_2, reg_3)
reg_3 = 1049268
reg_2 = reg_2 + reg_3
reg_2 = load.i32_u16(MEMORY_LIST[0], reg_2 + 0)
store.i32_n16(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_2
reg_2 = -4
reg_1 = reg_1 + reg_2
var_2 = reg_1
reg_1 = param_1
reg_2 = 99999999
reg_1 = gt.u64(reg_1, reg_2)
var_4 = reg_1
reg_1 = var_3
param_1 = reg_1
reg_1 = var_4
if reg_1 ~= 0 then
goto continue_at_1
end
end
::continue_at_0::
end
do
reg_1 = var_3
reg_1 = wrap.i64_i32(reg_1)
var_4 = reg_1
reg_2 = 99
reg_1 = le.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = var_1
reg_2 = 9
reg_1 = reg_1 + reg_2
reg_2 = var_2
reg_3 = -2
reg_2 = reg_2 + reg_3
var_2 = reg_2
reg_1 = reg_1 + reg_2
reg_2 = var_3
reg_2 = wrap.i64_i32(reg_2)
var_4 = reg_2
reg_3 = var_4
reg_4 = 65535
reg_3 = band.i32(reg_3, reg_4)
reg_4 = 100
reg_3 = div.u32(reg_3, reg_4)
var_4 = reg_3
reg_4 = 100
reg_3 = reg_3 * reg_4
reg_2 = reg_2 - reg_3
reg_3 = 65535
reg_2 = band.i32(reg_2, reg_3)
reg_3 = 1
reg_2 = shl.i32(reg_2, reg_3)
reg_3 = 1049268
reg_2 = reg_2 + reg_3
reg_2 = load.i32_u16(MEMORY_LIST[0], reg_2 + 0)
store.i32_n16(MEMORY_LIST[0], reg_1 + 0, reg_2)
::continue_at_0::
end
do
do
reg_1 = var_4
reg_2 = 10
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = var_1
reg_2 = 9
reg_1 = reg_1 + reg_2
reg_2 = var_2
reg_3 = -2
reg_2 = reg_2 + reg_3
var_2 = reg_2
reg_1 = reg_1 + reg_2
reg_2 = var_4
reg_3 = 1
reg_2 = shl.i32(reg_2, reg_3)
reg_3 = 1049268
reg_2 = reg_2 + reg_3
reg_2 = load.i32_u16(MEMORY_LIST[0], reg_2 + 0)
store.i32_n16(MEMORY_LIST[0], reg_1 + 0, reg_2)
goto continue_at_0
::continue_at_1::
end
reg_1 = var_1
reg_2 = 9
reg_1 = reg_1 + reg_2
reg_2 = var_2
reg_3 = -1
reg_2 = reg_2 + reg_3
var_2 = reg_2
reg_1 = reg_1 + reg_2
reg_2 = var_4
reg_3 = 48
reg_2 = bor.i32(reg_2, reg_3)
store.i32_n8(MEMORY_LIST[0], reg_1 + 0, reg_2)
::continue_at_0::
end
reg_1 = param_3
reg_2 = param_2
reg_3 = 1049140
reg_4 = 0
reg_5 = var_1
reg_6 = 9
reg_5 = reg_5 + reg_6
reg_6 = var_2
reg_5 = reg_5 + reg_6
reg_6 = 39
reg_7 = var_2
reg_6 = reg_6 - reg_7
reg_1 =
FUNC_LIST[55](reg_1, reg_2, reg_3, reg_4, reg_5, reg_6)
var_2 = reg_1
reg_1 = var_1
reg_2 = 48
reg_1 = reg_1 + reg_2
GLOBAL_LIST[0].value = reg_1
reg_1 = var_2
do return reg_1 end
end
FUNC_LIST[59] =
function(
param_1, param_2, param_3)
local
var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8= 0, 0, 0, 0, 0, 0, 0, 0
local
reg_1, reg_2, reg_3, reg_4
do
do
reg_1 = param_3
reg_2 = 16
reg_1 = ge.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = param_1
var_1 = reg_1
goto continue_at_0
::continue_at_1::
end
reg_1 = param_1
reg_2 = 0
reg_3 = param_1
reg_2 = reg_2 - reg_3
reg_3 = 3
reg_2 = band.i32(reg_2, reg_3)
var_2 = reg_2
reg_1 = reg_1 + reg_2
var_3 = reg_1
do
reg_1 = var_2
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = param_1
var_1 = reg_1
reg_1 = param_2
var_4 = reg_1
do
::continue_at_2::
reg_1 = var_1
reg_2 = var_4
reg_2 = load.i32_u8(MEMORY_LIST[0], reg_2 + 0)
store.i32_n8(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = var_4
reg_2 = 1
reg_1 = reg_1 + reg_2
var_4 = reg_1
reg_1 = var_1
reg_2 = 1
reg_1 = reg_1 + reg_2
var_1 = reg_1
reg_2 = var_3
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_2
end
end
::continue_at_1::
end
reg_1 = var_3
reg_2 = param_3
reg_3 = var_2
reg_2 = reg_2 - reg_3
var_5 = reg_2
reg_3 = -4
reg_2 = band.i32(reg_2, reg_3)
var_6 = reg_2
reg_1 = reg_1 + reg_2
var_1 = reg_1
do
do
reg_1 = param_2
reg_2 = var_2
reg_1 = reg_1 + reg_2
var_7 = reg_1
reg_2 = 3
reg_1 = band.i32(reg_1, reg_2)
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_2
end
reg_1 = var_6
reg_2 = 1
reg_1 = reg_1 < reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = var_7
reg_2 = 3
reg_1 = shl.i32(reg_1, reg_2)
var_4 = reg_1
reg_2 = 24
reg_1 = band.i32(reg_1, reg_2)
param_3 = reg_1
reg_1 = var_7
reg_2 = -4
reg_1 = band.i32(reg_1, reg_2)
var_8 = reg_1
reg_2 = 4
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_1 = 0
reg_2 = var_4
reg_1 = reg_1 - reg_2
reg_2 = 24
reg_1 = band.i32(reg_1, reg_2)
var_2 = reg_1
reg_1 = var_8
reg_1 = load.i32(MEMORY_LIST[0], reg_1 + 0)
var_4 = reg_1
do
::continue_at_3::
reg_1 = var_3
reg_2 = var_4
reg_3 = param_3
reg_2 = shr.u32(reg_2, reg_3)
reg_3 = param_2
reg_3 = load.i32(MEMORY_LIST[0], reg_3 + 0)
var_4 = reg_3
reg_4 = var_2
reg_3 = shl.i32(reg_3, reg_4)
reg_2 = bor.i32(reg_2, reg_3)
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = param_2
reg_2 = 4
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_1 = var_3
reg_2 = 4
reg_1 = reg_1 + reg_2
var_3 = reg_1
reg_2 = var_1
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_3
end
goto continue_at_1
end
::continue_at_2::
end
reg_1 = var_6
reg_2 = 1
reg_1 = reg_1 < reg_2 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_1
end
reg_1 = var_7
param_2 = reg_1
do
::continue_at_2::
reg_1 = var_3
reg_2 = param_2
reg_2 = load.i32(MEMORY_LIST[0], reg_2 + 0)
store.i32(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = param_2
reg_2 = 4
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_1 = var_3
reg_2 = 4
reg_1 = reg_1 + reg_2
var_3 = reg_1
reg_2 = var_1
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_2
end
end
::continue_at_1::
end
reg_1 = var_5
reg_2 = 3
reg_1 = band.i32(reg_1, reg_2)
param_3 = reg_1
reg_1 = var_7
reg_2 = var_6
reg_1 = reg_1 + reg_2
param_2 = reg_1
::continue_at_0::
end
do
reg_1 = param_3
reg_1 = reg_1 == 0 and 1 or 0
if reg_1 ~= 0 then
goto continue_at_0
end
reg_1 = var_1
reg_2 = param_3
reg_1 = reg_1 + reg_2
var_3 = reg_1
do
::continue_at_1::
reg_1 = var_1
reg_2 = param_2
reg_2 = load.i32_u8(MEMORY_LIST[0], reg_2 + 0)
store.i32_n8(MEMORY_LIST[0], reg_1 + 0, reg_2)
reg_1 = param_2
reg_2 = 1
reg_1 = reg_1 + reg_2
param_2 = reg_1
reg_1 = var_1
reg_2 = 1
reg_1 = reg_1 + reg_2
var_1 = reg_1
reg_2 = var_3
reg_1 = lt.u32(reg_1, reg_2)
if reg_1 ~= 0 then
goto continue_at_1
end
end
::continue_at_0::
end
reg_1 = param_1
do return reg_1 end
end
FUNC_LIST[60] =
function(
param_1, param_2, param_3)
local
reg_1, reg_2, reg_3
reg_1 = param_1
reg_2 = param_2
reg_3 = param_3
reg_1 =
FUNC_LIST[59](reg_1, reg_2, reg_3)
do return reg_1 end
end
local function run_init_code()
TABLE_LIST[0] =
{ min = 20
, max = 20
, data = {} }
MEMORY_LIST[0] =
{ min = 17
, data = {} }
GLOBAL_LIST[0] = { value =
1048576
}
GLOBAL_LIST[1] = { value =
1049949
}
GLOBAL_LIST[2] = { value =
1049952
}
do
local target = TABLE_LIST[0]
local offset =
1
target[offset + 0] = FUNC_LIST[51]
target[offset + 1] = FUNC_LIST[30]
target[offset + 2] = FUNC_LIST[16]
target[offset + 3] = FUNC_LIST[20]
target[offset + 4] = FUNC_LIST[18]
target[offset + 5] = FUNC_LIST[13]
target[offset + 6] = FUNC_LIST[10]
target[offset + 7] = FUNC_LIST[14]
target[offset + 8] = FUNC_LIST[11]
target[offset + 9] = FUNC_LIST[37]
target[offset + 10] = FUNC_LIST[38]
target[offset + 11] = FUNC_LIST[17]
target[offset + 12] = FUNC_LIST[35]
target[offset + 13] = FUNC_LIST[36]
target[offset + 14] = FUNC_LIST[15]
target[offset + 15] = FUNC_LIST[9]
target[offset + 16] = FUNC_LIST[46]
target[offset + 17] = FUNC_LIST[47]
target[offset + 18] = FUNC_LIST[53]
end
do
local target = MEMORY_LIST[0].data
local offset =
1048576
/ 4
target[offset + 0] = 0x6C6C6548
target[offset + 1] = 0x7273216F
target[offset + 2] = 0x696C5C63
target[offset + 3] = 0x73722E62
target[offset + 4] = 0x100006
target[offset + 5] = 0xA
target[offset + 6] = 0xA
target[offset + 7] = 0x10
target[offset + 8] = 0x100006
target[offset + 9] = 0xA
target[offset + 10] = 0xC
target[offset + 11] = 0x5
target[offset + 12] = 0x65747461
target[offset + 13] = 0x2074706D
target[offset + 14] = 0x61206F74
target[offset + 15] = 0x77206464
target[offset + 16] = 0x20687469
target[offset + 17] = 0x7265766F
target[offset + 18] = 0x776F6C66
target[offset + 19] = 0x3
target[offset + 20] = 0xC
target[offset + 21] = 0x4
target[offset + 22] = 0x4
target[offset + 23] = 0x5
target[offset + 24] = 0x6
target[offset + 25] = 0x7375722F
target[offset + 26] = 0x65642F74
target[offset + 27] = 0x642F7370
target[offset + 28] = 0x6C616D6C
target[offset + 29] = 0x2D636F6C
target[offset + 30] = 0x2E322E30
target[offset + 31] = 0x72732F36
target[offset + 32] = 0x6C642F63
target[offset + 33] = 0x6C6C616D
target[offset + 34] = 0x722E636F
target[offset + 35] = 0x73736173
target[offset + 36] = 0x69747265
target[offset + 37] = 0x66206E6F
target[offset + 38] = 0x656C6961
target[offset + 39] = 0x70203A64
target[offset + 40] = 0x657A6973
target[offset + 41] = 0x203D3E20
target[offset + 42] = 0x657A6973
target[offset + 43] = 0x6D202B20
target[offset + 44] = 0x6F5F6E69
target[offset + 45] = 0x68726576
target[offset + 46] = 0x646165
target[offset + 47] = 0x100064
target[offset + 48] = 0x29
target[offset + 49] = 0x4A8
target[offset + 50] = 0x9
target[offset + 51] = 0x65737361
target[offset + 52] = 0x6F697472
target[offset + 53] = 0x6166206E
target[offset + 54] = 0x64656C69
target[offset + 55] = 0x7370203A
target[offset + 56] = 0x20657A69
target[offset + 57] = 0x73203D3C
target[offset + 58] = 0x20657A69
target[offset + 59] = 0x616D202B
target[offset + 60] = 0x766F5F78
target[offset + 61] = 0x65687265
target[offset + 62] = 0x6461
target[offset + 63] = 0x100064
target[offset + 64] = 0x29
target[offset + 65] = 0x4AE
target[offset + 66] = 0xD
target[offset + 67] = 0x6F6D656D
target[offset + 68] = 0x61207972
target[offset + 69] = 0x636F6C6C
target[offset + 70] = 0x6F697461
target[offset + 71] = 0x666F206E
target[offset + 72] = 0x79622020
target[offset + 73] = 0x20736574
target[offset + 74] = 0x6C696166
target[offset + 75] = 0x6465
target[offset + 76] = 0x10010C
target[offset + 77] = 0x15
target[offset + 78] = 0x100121
target[offset + 79] = 0xD
target[offset + 80] = 0x7262696C
target[offset + 81] = 0x2F797261
target[offset + 82] = 0x2F647473
target[offset + 83] = 0x2F637273
target[offset + 84] = 0x6F6C6C61
target[offset + 85] = 0x73722E63
target[offset + 86] = 0x100140
target[offset + 87] = 0x18
target[offset + 88] = 0x162
target[offset + 89] = 0x9
target[offset + 90] = 0x7262696C
target[offset + 91] = 0x2F797261
target[offset + 92] = 0x2F647473
target[offset + 93] = 0x2F637273
target[offset + 94] = 0x696E6170
target[offset + 95] = 0x6E696B63
target[offset + 96] = 0x73722E67
target[offset + 97] = 0x100168
target[offset + 98] = 0x1C
target[offset + 99] = 0x284
target[offset + 100] = 0x1E
target[offset + 101] = 0x3
target[offset + 102] = 0xC
target[offset + 103] = 0x4
target[offset + 104] = 0x7
target[offset + 105] = 0x8
target[offset + 106] = 0x8
target[offset + 107] = 0x4
target[offset + 108] = 0x9
target[offset + 109] = 0x8
target[offset + 110] = 0x8
target[offset + 111] = 0x4
target[offset + 112] = 0xA
target[offset + 113] = 0xB
target[offset + 114] = 0xC
target[offset + 115] = 0x10
target[offset + 116] = 0x4
target[offset + 117] = 0xD
target[offset + 118] = 0xE
target[offset + 119] = 0xF
target[offset + 120] = 0x0
target[offset + 121] = 0x1
target[offset + 122] = 0x10
target[offset + 123] = 0x61706163
target[offset + 124] = 0x79746963
target[offset + 125] = 0x65766F20
target[offset + 126] = 0x6F6C6672
target[offset + 127] = 0x77
target[offset + 128] = 0x1001EC
target[offset + 129] = 0x11
target[offset + 130] = 0x7262696C
target[offset + 131] = 0x2F797261
target[offset + 132] = 0x6F6C6C61
target[offset + 133] = 0x72732F63
target[offset + 134] = 0x61722F63
target[offset + 135] = 0x65765F77
target[offset + 136] = 0x73722E63
target[offset + 137] = 0x100208
target[offset + 138] = 0x1C
target[offset + 139] = 0x19
target[offset + 140] = 0x5
target[offset + 141] = 0x6C6C6163
target[offset + 142] = 0x60206465
target[offset + 143] = 0x6974704F
target[offset + 144] = 0x3A3A6E6F
target[offset + 145] = 0x72776E75
target[offset + 146] = 0x29287061
target[offset + 147] = 0x6E6F2060
target[offset + 148] = 0x60206120
target[offset + 149] = 0x656E6F4E
target[offset + 150] = 0x61762060
target[offset + 151] = 0x65756C
target[offset + 152] = 0x12
target[offset + 153] = 0x0
target[offset + 154] = 0x1
target[offset + 155] = 0x13
target[offset + 156] = 0x65646E69
target[offset + 157] = 0x756F2078
target[offset + 158] = 0x666F2074
target[offset + 159] = 0x756F6220
target[offset + 160] = 0x3A73646E
target[offset + 161] = 0x65687420
target[offset + 162] = 0x6E656C20
target[offset + 163] = 0x20736920
target[offset + 164] = 0x74756220
target[offset + 165] = 0x65687420
target[offset + 166] = 0x646E6920
target[offset + 167] = 0x69207865
target[offset + 168] = 0x2073
target[offset + 169] = 0x100270
target[offset + 170] = 0x20
target[offset + 171] = 0x100290
target[offset + 172] = 0x12
target[offset + 173] = 0x31303030
target[offset + 174] = 0x33303230
target[offset + 175] = 0x35303430
target[offset + 176] = 0x37303630
target[offset + 177] = 0x39303830
target[offset + 178] = 0x31313031
target[offset + 179] = 0x33313231
target[offset + 180] = 0x35313431
target[offset + 181] = 0x37313631
target[offset + 182] = 0x39313831
target[offset + 183] = 0x31323032
target[offset + 184] = 0x33323232
target[offset + 185] = 0x35323432
target[offset + 186] = 0x37323632
target[offset + 187] = 0x39323832
target[offset + 188] = 0x31333033
target[offset + 189] = 0x33333233
target[offset + 190] = 0x35333433
target[offset + 191] = 0x37333633
target[offset + 192] = 0x39333833
target[offset + 193] = 0x31343034
target[offset + 194] = 0x33343234
target[offset + 195] = 0x35343434
target[offset + 196] = 0x37343634
target[offset + 197] = 0x39343834
target[offset + 198] = 0x31353035
target[offset + 199] = 0x33353235
target[offset + 200] = 0x35353435
target[offset + 201] = 0x37353635
target[offset + 202] = 0x39353835
target[offset + 203] = 0x31363036
target[offset + 204] = 0x33363236
target[offset + 205] = 0x35363436
target[offset + 206] = 0x37363636
target[offset + 207] = 0x39363836
target[offset + 208] = 0x31373037
target[offset + 209] = 0x33373237
target[offset + 210] = 0x35373437
target[offset + 211] = 0x37373637
target[offset + 212] = 0x39373837
target[offset + 213] = 0x31383038
target[offset + 214] = 0x33383238
target[offset + 215] = 0x35383438
target[offset + 216] = 0x37383638
target[offset + 217] = 0x39383838
target[offset + 218] = 0x31393039
target[offset + 219] = 0x33393239
target[offset + 220] = 0x35393439
target[offset + 221] = 0x37393639
target[offset + 222] = 0x39393839
end
end
return function(wasm)
FUNC_LIST[0] = wasm.wasmtorio_game_script.func_list.print
run_init_code()
return {
func_list = {
add_five_i32 = FUNC_LIST[3],
},
table_list = {
},
memory_list = {
memory = MEMORY_LIST[0],
},
global_list = {
__data_end = GLOBAL_LIST[1],
__heap_base = GLOBAL_LIST[2],
},
} end
