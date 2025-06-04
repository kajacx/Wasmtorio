#!/usr/bin/sh
set -e

sed -i '1i\
local bit = require("bit")\
function table_move(source_table, from, to, offset, target_table)\
	offset = offset - 1\
	for i = from, to, 1 do\
		target_table[i + offset] = source_table[i]\
	end\
	return target_table\
end' "$1"
sed -i 's/\([0-9]\+\)LL/\1/g' "$1"
sed -i 's/table.move/table_move/g' "$1"
