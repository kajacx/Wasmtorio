#!/usr/bin/sh
set -e

sed -i '1i\
local bit = require("bit")\
function table_move()\
end' "$1"
sed -i 's/\([0-9]\+\)LL/\1/g' "$1"
sed -i 's/table.move/table_move/g' "$1"
