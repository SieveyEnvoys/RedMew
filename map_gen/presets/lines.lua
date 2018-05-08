map_gen_decoratives = false -- Generate our own decoratives
map_gen_rows_per_tick = 8 -- Inclusive integer between 1 and 32. Used for map_gen_threaded, higher numbers will generate map quicker but cause more lag.

-- Recommend to use generate, but generate_not_threaded may be useful for testing / debugging.
--require "map_gen.shared.generate_not_threaded"
require "map_gen.shared.generate"

local b = require "map_gen.shared.builders"

local pic = require "map_gen.data.presets.lines"
pic= b.decompress(pic)

local shape = b.picture(pic)

local map = b.single_pattern(shape, pic.width, pic.height)

--map = b.translate(map, 10, -96)
map = b.scale(map,10,10)

return map