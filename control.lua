local init = require("plugins/rust/rust-control.lua")

local imports = {
    wasmtorio_game_script = {
        func_list = {
            print = function(addr, len) game.print("Printing a message of length " .. len) end
        }
    }
}

local module = init(imports)

local add_five_i32 = module.func_list.add_five_i32;


script.on_event(defines.events.on_player_selected_area, function(event)
    game.print(
        "Control.lua start, ANSWER: " .. add_five_i32(1) .. " and " .. add_five_i32(3),
        { skip = defines.print_skip.never }
    )
    -- game.print(string.pack)
end)
