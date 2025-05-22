local init = require("plugins/rust/rust-control.lua")
local module = init()
local add_five_i32 = module.func_list.add_five_i32;


script.on_event(defines.events.on_player_selected_area, function(event)
    game.print(
        "Control.lua start, ANSWER: " .. add_five_i32(37),
        { skip = defines.print_skip.never }
    )
end)
