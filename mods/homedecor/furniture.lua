local S = homedecor.gettext

-- 3dforniture tables ... well, they used to be :P

local table_colors = { "", "mahogany", "white" }

for _, i in ipairs(table_colors) do
	local color = "_"..i
	local desc = S("Table ("..i..")")

	if i == "" then
		color = ""
		desc = S("Table")
	end

	minetest.register_node("homedecor:table"..color, {
		description = desc,
		tiles = { "forniture_wood"..color..".png" },
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
		    type = "fixed",
		    fixed = {
		        { -0.4, -0.5, -0.4, -0.3,  0.4, -0.3 },
		        {  0.3, -0.5, -0.4,  0.4,  0.4, -0.3 },
		        { -0.4, -0.5,  0.3, -0.3,  0.4,  0.4 },
		        {  0.3, -0.5,  0.3,  0.4,  0.4,  0.4 },
		        { -0.5,  0.4, -0.5,  0.5,  0.5,  0.5 },
		        { -0.4, -0.2, -0.3, -0.3, -0.1,  0.3 },
		        {  0.3, -0.2, -0.4,  0.4, -0.1,  0.3 },
		        { -0.3, -0.2, -0.4,  0.4, -0.1, -0.3 },
		        { -0.3, -0.2,  0.3,  0.3, -0.1,  0.4 },
		    },
		},
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	})  
end

local chaircolors = {
	{ "", "plain" },
	{ "black", "Black" },
	{ "red", "Red" },
	{ "pink", "Pink" },
	{ "violet", "Violet" },
	{ "blue", "Blue" },
	{ "dark_green", "Dark Green" },
}

for i in ipairs(chaircolors) do

	local color = "_"..chaircolors[i][1]
	local color2 = chaircolors[i][1]
	local name = S(chaircolors[i][2])

	if chaircolors[i][1] == "" then 
		color = ""
	end

	minetest.register_node("homedecor:chair"..color, {
	    description = S("Kitchen chair (%s)"):format(name),
		tiles = { 
			"forniture_kitchen_chair_top"..color..".png",
			"forniture_wood.png",
			"forniture_kitchen_chair_sides"..color..".png",
			"forniture_kitchen_chair_sides"..color..".png^[transformFX",
			"forniture_kitchen_chair_back"..color..".png",
			"forniture_kitchen_chair_front"..color..".png",
		 },
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
		    type = "fixed",
		    fixed = {
				{-0.3125, -0.5, 0.1875, -0.1875, 0.5, 0.3125},
				{0.1875, -0.5, 0.1875, 0.3125, 0.5, 0.3125},
				{-0.3125, -0.5, -0.3125, -0.1875, 0, -0.1875},
				{0.1875, -0.5, -0.3125, 0.3125, 0, -0.1875},
				{-0.3125, -0.125, -0.3125, 0.3125, 0, 0.3125},
				{-0.25, 0.0625, 0.25, 0.25, 0.4375, 0.25},
		    },
		},
		selection_box = {
		    type = "fixed",
		    fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3},
		},
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
	})

	if color ~= "" then 
		minetest.register_node("homedecor:armchair"..color, {
			description = S("Armchair (%s)"):format(name),
			tiles = { "forniture_armchair_top"..color..".png" },
			drawtype = "nodebox",
			sunlight_propagates = true,
			paramtype = "light",
			paramtype2 = "facedir",
			node_box = {
			type = "fixed",
			fixed = {
				{ -0.50, -0.50, -0.45, -0.30,  0.05,  0.30 },
				{ -0.45, -0.50, -0.50, -0.35,  0.05, -0.45 },
				{ -0.45,  0.05, -0.45, -0.35,  0.10,  0.15 },
				{  0.30, -0.50, -0.45,  0.50,  0.05,  0.30 },
				{  0.35, -0.50, -0.50,  0.45,  0.05, -0.45 },
				{  0.35,  0.05, -0.45,  0.45,  0.10,  0.15 },
				{ -0.50, -0.50,  0.30,  0.50,  0.45,  0.50 },
				{ -0.45,  0.45,  0.35,  0.45,  0.50,  0.45 },
				{ -0.30, -0.45, -0.35,  0.30, -0.10,  0.30 },
				{ -0.30, -0.45, -0.40,  0.30, -0.15, -0.35 },
				{ -0.50,  0.05,  0.15, -0.30,  0.45,  0.30 },
				{ -0.45,  0.10,  0.10, -0.35,  0.45,  0.15 },
				{ -0.45,  0.45,  0.15, -0.35,  0.50,  0.35 },
				{  0.30,  0.05,  0.15,  0.50,  0.45,  0.30 },
				{  0.35,  0.10,  0.10,  0.45,  0.45,  0.15 },
				{  0.35,  0.45,  0.15,  0.45,  0.50,  0.35 },
			},
			},
			groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
		})

		minetest.register_craft({
			output = "homedecor:armchair"..color.." 2",
			recipe = {
			{ "wool:"..color2,""},
			{ "group:wood","group:wood" },
			{ "wool:"..color2,"wool:"..color2 },
			},
		})
	end
end

local repl = { off="low", low="med", med="hi", hi="max", max="off", }
local lamp_colors = { "", "blue", "green", "pink", "red", "violet" }

local function reg_lamp(suffix, nxt, desc, tilesuffix, light, color)
	local lampcolor = "_"..color
	if color == "" then	lampcolor = "" end
	minetest.register_node("homedecor:table_lamp"..lampcolor.."_"..suffix, {
	description = S(desc),
	drawtype = "nodebox",
	tiles = {
		"forniture_table_lamp_s"..tilesuffix..".png",
		"forniture_table_lamp_s"..tilesuffix..".png",
		"forniture_table_lamp"..lampcolor.."_l"..tilesuffix..".png",
	},
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.1500, -0.500, -0.1500,  0.1500, -0.45,  0.1500 },
			{ -0.0500, -0.450, -0.0500,  0.0500, -0.40,  0.0500 },
			{ -0.0250, -0.400, -0.0250,  0.0250, -0.10,  0.0250 },
			{ -0.0125, -0.125, -0.2000,  0.0125, -0.10,  0.2000 },
			{ -0.2000, -0.125, -0.0125,  0.2000, -0.10,  0.0125 },
			{ -0.2000, -0.100, -0.2000, -0.1750,  0.30,  0.2000 },
			{  0.1750, -0.100, -0.2000,  0.2000,  0.30,  0.2000 },
			{ -0.1750, -0.100, -0.2000,  0.1750,  0.30, -0.1750 },
			{ -0.1750, -0.100,  0.1750,  0.1750,  0.30,  0.2000 },
		},
	},
	walkable = false,
	light_source = light,
	selection_box = {
		type = "fixed",
		fixed = { -0.2, -0.5, -0.2, 0.2, 0.30, 0.2 },
	},
	groups = {cracky=2,oddly_breakable_by_hand=1,
		not_in_creative_inventory=((desc == nil) and 1) or nil,
	},
	drop = "homedecor:table_lamp"..lampcolor.."_off",
	on_punch = function(pos, node, puncher)
		node.name = "homedecor:table_lamp"..lampcolor.."_"..repl[suffix]
		minetest.set_node(pos, node)
		nodeupdate(pos)
	end,
	})
	if lampcolor == "" then 
		minetest.register_alias("3dforniture:table_lamp_"..suffix, "homedecor:table_lamp_"..suffix)
	end
end

for _, color in ipairs(lamp_colors) do
	reg_lamp("off", "low", "Table Lamp",  "", nil,	color )
	reg_lamp("low", "med", nil,          "l", 3,	color )
	reg_lamp("med", "hi" , nil,          "m", 7,	color )
	reg_lamp("hi" , "max", nil,          "h", 11,	color )
	reg_lamp("max", "off", nil,          "x", 14,	color )
end

minetest.register_node(":homedecor:openframe_bookshelf", {
	description = "Bookshelf (open-frame)",
	drawtype = "nodebox",
	is_ground_content = false,
	groups = {choppy=3,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
	tiles = {
		"3dbookshelf_openframe_top.png",
		"3dbookshelf_openframe_bottom.png",
		"3dbookshelf_openframe_right.png",
		"3dbookshelf_openframe_left.png",
		"3dbookshelf_openframe_back.png",
		"3dbookshelf_openframe_front.png"

	},
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, 0, 0.5, 0.5, 0.5 }
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0, -0.375, 0.5, 0.5},
			{0.375, -0.5, 0, 0.4375, 0.5, 0.5},
			{-0.5, -0.5, 0, 0.5, -0.4375, 0.5},
			{-0.5, 0, 0, 0.5, 0.0625, 0.5},
			{-0.375, 0.0625, 0.176, -0.25, 0.5, 0.5},
			{-0.25, 0.0625, 0.253, -0.1875, 0.4375, 0.5},
			{-0.1875, 0.0625, 0.227, -0.125, 0.5, 0.5},
			{-0.125, 0.0625, 0.176, 0, 0.4375, 0.5},
			{0, 0.0625, 0.232, 0.0625, 0.375, 0.5},
			{0.0625, 0.0625, 0.130, 0.1875, 0.5, 0.5},
			{0.1875, 0.0625, 0.217, 0.25, 0.4375, 0.5},
			{0.25, 0.0625, 0.166, 0.3125, 0.5, 0.5},
			{0.3125, 0.0625, 0.242, 0.375, 0.4375, 0.5},
			{-0.375, -0.4375, 0.191, -0.3125, -0.0625, 0.5},
			{-0.3125, -0.4375, 0.191, -0.1875, -0.125, 0.5},
			{-0.1875, -0.4375, 0.227, -0.125, -0.0625, 0.5},
			{-0.125, -0.4375, 0.0737, 0, -0.0625, 0.5},
			{0, -0.4375, 0.145, 0.0625, -0.125, 0.5},
			{0.0625, -0.4375, 0.212, 0.125, -0.1875, 0.5},
			{0.125, -0.4375, 0.207, 0.1875, -0.125, 0.5},
			{0.1875, -0.4375, 0.176, 0.25, -0.125, 0.5},
			{0.25, -0.4375, 0.258, 0.3125, -0.1875, 0.5},
			{0.3125, -0.4375, 0.130, 0.375, -0.0625, 0.5}
		}
	}
})
--[[
local bedcolors = {
	"red",
	"green",
	"blue",
	"violet",
	"brown",
        "darkgrey",
        "orange",
        "yellow",
        "pink",
}

for _, color in ipairs(bedcolors) do

	minetest.register_node("homedecor:bed_"..color.."_head", {
		tiles = {
			"homedecor_bed_"..color.."_top1.png",
			"homedecor_bed_bottom1.png",
			"homedecor_bed_"..color.."_side1.png",
			"homedecor_bed_"..color.."_side1.png^[transformFX",
			"homedecor_bed_"..color.."_head1.png",
			"homedecor_bed_"..color.."_head2.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy=3, not_in_creative_inventory=1},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5,     -0.5,     0.4375,   -0.375,  0.5,      0.5},      --  NodeBox1
				{0.375,    -0.5,     0.4375,   0.5,     0.5,      0.5},      --  NodeBox2
				{-0.5,     0.25,     0.4375,   0.5,     0.4375,   0.5},      --  NodeBox3
				{-0.5,     0,        0.4375,   0.5,     0.1875,   0.5},      --  NodeBox4
				{-0.5,     -0.375,   0.4375,   0.5,     -0.125,   0.5},      --  NodeBox5
				{-0.4375,  -0.375,   -0.5,     -0.375,  -0.125,   0.5},      --  NodeBox6
				{0.375,    -0.375,   -0.5,     0.4375,  -0.125,   0.5},      --  NodeBox7
				{-0.375,   -0.375,   0.25,     0.375,   -0.3125,  0.375},    --  NodeBox8
				{-0.375,   -0.375,   0.0625,   0.375,   -0.3125,  0.1875},   --  NodeBox9
				{-0.375,   -0.375,   -0.125,   0.375,   -0.3125,  0},        --  NodeBox10
				{-0.375,   -0.375,   -0.3125,  0.375,   -0.3125,  -0.1875},  --  NodeBox11
				{-0.375,   -0.375,   -0.5,     0.375,   -0.3125,  -0.375},   --  NodeBox12
				{-0.375,   -0.3125,  -0.5,     0.375,   -0.0625,  0.4375},   --  NodeBox13
				{-0.3125,  -0.125,   0.0625,   0.3125,  0.0625,   0.4375},   --  NodeBox14
			}
		},
		selection_box = {
			type = "fixed",
			fixed = { 0, 0, 0, 0, 0, 0 }
		}
	})

	minetest.register_node("homedecor:bed_"..color.."_foot", {
		tiles = {
			"homedecor_bed_"..color.."_top2.png",
			"homedecor_bed_bottom2.png",
			"homedecor_bed_"..color.."_side2.png",
			"homedecor_bed_"..color.."_side2.png^[transformFX",
			"homedecor_bed_"..color.."_foot2.png",
			"homedecor_bed_"..color.."_foot1.png"
		},
		inventory_image = "homedecor_bed_"..color.."_inv.png",
		description = S("Bed (%s)"):format(color),
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy=3},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5,     -0.5,     -0.5,     -0.375,  0.1875,   -0.4375},  --  NodeBox1
				{0.375,    -0.5,     -0.5,     0.5,     0.1875,   -0.4375},  --  NodeBox2
				{-0.5,     0,        -0.5,     0.5,     0.125,    -0.4375},  --  NodeBox3
				{-0.5,     -0.375,   -0.5,     0.5,     -0.125,   -0.4375},  --  NodeBox4
				{-0.4375,  -0.375,   -0.5,     -0.375,  -0.125,   0.5},      --  NodeBox5
				{0.375,    -0.375,   -0.5,     0.4375,  -0.125,   0.5},      --  NodeBox6
				{-0.375,   -0.375,   0.3125,   0.375,   -0.3125,  0.4375},   --  NodeBox7
				{-0.375,   -0.375,   0.125,    0.375,   -0.3125,  0.25},     --  NodeBox8
				{-0.375,   -0.375,   -0.0625,  0.375,   -0.3125,  0.0625},   --  NodeBox9
				{-0.375,   -0.375,   -0.25,    0.375,   -0.3125,  -0.125},   --  NodeBox10
				{-0.375,   -0.375,   -0.4375,  0.375,   -0.3125,  -0.3125},  --  NodeBox11
				{-0.375,   -0.3125,  -0.4375,  0.375,   -0.0625,  0.5},      --  NodeBox12
			}
		},
		selection_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, -0.5, 0.5, 0.5, 1.5 }
		},
		on_place = function(itemstack, placer, pointed_thing)
			return homedecor.stack_sideways(itemstack, placer, pointed_thing,
				"homedecor:bed_"..color.."_foot", "homedecor:bed_"..color.."_head", false)
		end,
		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			local fdir = oldnode.param2
			if not fdir or fdir > 3 then return end
			local pos2 = { x = pos.x + homedecor.fdir_to_fwd[fdir+1][1], y=pos.y, z = pos.z + homedecor.fdir_to_fwd[fdir+1][2] }
			if minetest.get_node(pos2).name == "homedecor:bed_"..color.."_head" then
				minetest.remove_node(pos2)
			end
		end
	})

end
]]--
minetest.register_node("homedecor:wardrobe_top", {
	tiles = {
		"homedecor_wardrobe_top.png",
		"homedecor_wardrobe_bottom.png",
		"homedecor_wardrobe_sides1.png",
		"homedecor_wardrobe_sides1.png^[transformFX",
		"homedecor_wardrobe_back1.png",
		"homedecor_wardrobe_frontt.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=3, not_in_creative_inventory=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,     -0.5,   -0.4375,  0.5,      0.5,      0.5},      --  NodeBox1
			{0.0625,   -0.4375,  -0.5,     0.4375,   0.4375,   -0.4375},  --  NodeBox2
			{-0.4375,  -0.4375,  -0.5,     -0.0625,  0.4375,   -0.4375},  --  NodeBox3
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { 0, 0, 0, 0, 0, 0 }
	},
})

minetest.register_node("homedecor:wardrobe_bottom", {
	tiles = {
		"homedecor_wardrobe_top.png",
		"homedecor_wardrobe_bottom.png",
		"homedecor_wardrobe_sides2.png",
		"homedecor_wardrobe_sides2.png^[transformFX",
		"homedecor_wardrobe_back2.png",
		"homedecor_wardrobe_frontb.png"
	},
	inventory_image = "homedecor_wardrobe_inv.png",
	description = "Wardrobe",
	drawtype = "nodebox",
	paramtype = "light",
        paramtype2 = "facedir",
        groups = {snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,     -0.5,     -0.4375,  0.5,  0.5,      0.5},      --  NodeBox1
			{-0.4375,  -0.375,   -0.5,     0.4375,   -0.125,   -0.4375},  --  NodeBox2
			{-0.4375,  -0.0625,  -0.5,     0.4375,   0.1875,   -0.4375},  --  NodeBox3
			{-0.4375,  0.25,     -0.5,     0.4375,   0.5,      -0.4375},  --  NodeBox4
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.5, 0.5, 1.5, 0.5 }
	},
	on_place = function(itemstack, placer, pointed_thing)
		return homedecor.stack_vertically(itemstack, placer, pointed_thing,
			"homedecor:wardrobe_bottom", "homedecor:wardrobe_top")
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		local pos2 = { x = pos.x, y=pos.y + 1, z = pos.z }
		if minetest.get_node(pos2).name == "homedecor:wardrobe_top" then
			minetest.remove_node(pos2)
		end
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
				"size[8,8]"..
				"list[current_name;main;0,0;8,3;]"..
				"list[current_player;main;0,4;8,4;]")
		meta:set_string("infotext", S("Wardrobe cabinet"))
		local inv = meta:get_inventory()
		inv:set_size("main", 24)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local inv = meta:get_inventory()
		return inv:is_empty("main")
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", S("%s moves stuff in wardrobe at %s"):format(
		    player:get_player_name(),
		    minetest.pos_to_string(pos)
		))
	end,
    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", S("%s moves stuff to wardrobe at %s"):format(
		    player:get_player_name(),
		    minetest.pos_to_string(pos)
		))
	end,
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", S("%s takes stuff from wardrobe at %s"):format(
		    player:get_player_name(),
		    minetest.pos_to_string(pos)
		))
	end,
})

minetest.register_node("homedecor:simple_bench", {
	tiles = {
		"homedecor_generic_wood.png",
		"homedecor_generic_wood.png",
		"homedecor_generic_wood.png",
		"homedecor_generic_wood.png",
		"homedecor_bench_large_2_left_back.png",
		"homedecor_bench_large_2_left_front.png"
	},
	description = "Simple Bench",
	drawtype = "nodebox",
	paramtype = "light",
        paramtype2 = "facedir",
        groups = {snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
                    {-0.5, -0.15, 0,  0.5,  -0.05, 0.4},
                    {-0.4, -0.5,  0.1, -0.3, -0.15, 0.3},
                    { 0.3, -0.5,  0.1,  0.4, -0.15, 0.3},
	}
	},
})


minetest.register_node("homedecor:bench_large_1_left", {
	description = "Garden Bench (style 1)",
	tiles = {
		"homedecor_bench_large_1_left_top.png",
		"homedecor_bench_large_1_left_bottom.png",
		"homedecor_bench_large_1_ends.png^[transformFX",
		"homedecor_bench_large_1_ends.png",
		"homedecor_bench_large_1_left_back.png",
		"homedecor_bench_large_1_left_front.png"
	},
	inventory_image = "homedecor_bench_large_1_inv.png",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.25, 0.375, 0.5, 0.4375, 0.4375}, -- NodeBox1
			{-0.5, 0, 0.375, 0.5, 0.1875, 0.4375}, -- NodeBox2
			{-0.5, -0.125, 0.115, 0.5, -0.0625, 0.35}, -- NodeBox3
			{-0.5, -0.125, -0.0872, 0.5, -0.0625, 0.079}, -- NodeBox4
			{-0.3125, -0.5, 0.4375, -0.25, 0.375, 0.5}, -- NodeBox5
			{-0.3125, -0.25, -0.0625, -0.25, -0.125, 0.4375}, -- NodeBox6
			{-0.3125, -0.5, -0.0625, -0.25, -0.25, 0}, -- NodeBox7
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.09375, 1.5, 0.5, 0.5 }
	},
	on_place = function(itemstack, placer, pointed_thing)
		return homedecor.stack_sideways(itemstack, placer, pointed_thing,
			"homedecor:bench_large_1_left", "homedecor:bench_large_1_right", true)
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		local fdir = oldnode.param2
		if not fdir or fdir > 3 then return end
		local pos2 = { x = pos.x + homedecor.fdir_to_right[fdir+1][1], y=pos.y, z = pos.z + homedecor.fdir_to_right[fdir+1][2] }
		if minetest.get_node(pos2).name == "homedecor:bench_large_1_right" then
			minetest.remove_node(pos2)
		end
	end
})

minetest.register_node("homedecor:bench_large_1_right", {
	tiles = {
		"homedecor_bench_large_1_right_top.png",
		"homedecor_bench_large_1_right_bottom.png",
		"homedecor_bench_large_1_ends.png^[transformFX",
		"homedecor_bench_large_1_ends.png",
		"homedecor_bench_large_1_right_back.png",
		"homedecor_bench_large_1_right_front.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0.25, 0.375, 0.5, 0.4375, 0.4375}, -- NodeBox1
			{-0.5, 0, 0.375, 0.5, 0.1875, 0.4375}, -- NodeBox2
			{-0.5, -0.125, 0.115, 0.5, -0.0625, 0.35}, -- NodeBox3
			{-0.5, -0.125, -0.0872, 0.5, -0.0625, 0.079}, -- NodeBox4
			{0.25, -0.5, 0.4375, 0.3125, 0.375, 0.5}, -- NodeBox5
			{0.25, -0.25, -0.0625, 0.3125, -0.125, 0.5}, -- NodeBox6
			{0.25, -0.5, -0.0625, 0.3125, -0.25, 0}, -- NodeBox7
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { 0, 0, 0, 0, 0, 0 }
	},
})


minetest.register_node("homedecor:bench_large_2_left", {
	description = "Garden Bench (style 2)",
	tiles = {
		"homedecor_generic_wood.png",
		"homedecor_generic_wood.png",
		"homedecor_generic_wood.png",
		"homedecor_generic_wood.png",
		"homedecor_bench_large_2_left_back.png",
		"homedecor_bench_large_2_left_front.png"
	},
	inventory_image = "homedecor_bench_large_2_inv.png",
	drawtype = "nodebox",
	paramtype = "light",
        paramtype2 = "facedir",
	groups = {snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5}, -- NodeBox1
			{-0.375, 0.3125, 0.4375, 0.5, 0.4375, 0.5}, -- NodeBox2
			{-0.375, -0.0625, 0.4375, 0.5, 0.0625, 0.5}, -- NodeBox3
			{-0.3125, 0.0625, 0.45, -0.25, 0.3125, 0.48}, -- NodeBox4
			{-0.1875, 0.0625, 0.45, -0.125, 0.3125, 0.48}, -- NodeBox5
			{-0.0625, 0.0625, 0.45, 0, 0.3125, 0.48}, -- NodeBox6
			{0.0625, 0.0625, 0.45, 0.125, 0.3125, 0.48}, -- NodeBox7
			{0.1875, 0.0625, 0.45, 0.25, 0.3125, 0.48}, -- NodeBox8
			{0.3125, 0.0625, 0.45, 0.375, 0.3125, 0.48}, -- NodeBox9
			{0.4375, 0.0625, 0.45, 0.5, 0.3125, 0.48}, -- NodeBox10
			{-0.5, 0.0625, -0.145362, -0.375, 0.125, 0.375}, -- NodeBox11
			{-0.5, -0.5, -0.0625, -0.375, 0.0625, 0.0625}, -- NodeBox12
			{-0.4375, -0.125, -0.0625, 0.5, -0.0911603, 0.4375}, -- NodeBox13
			{-0.4375, -0.4375, 0.0625, -0.375, -0.3125, 0.375}, -- NodeBox14
			{-0.375, -0.342324, 0.25, 0.5, -0.4375, 0.1875}, -- NodeBox15
			{-0.5, -0.25, -0.0290173, 0.5, -0.125, 0.0125346}, -- NodeBox16
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.15625, 1.5, 0.5, 0.5 }
	},
	on_place = function(itemstack, placer, pointed_thing)
		return homedecor.stack_sideways(itemstack, placer, pointed_thing,
			"homedecor:bench_large_2_left", "homedecor:bench_large_2_right", true)
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		local fdir = oldnode.param2
		if not fdir or fdir > 3 then return end
		local pos2 = { x = pos.x + homedecor.fdir_to_right[fdir+1][1], y=pos.y, z = pos.z + homedecor.fdir_to_right[fdir+1][2] }
		if minetest.get_node(pos2).name == "homedecor:bench_large_2_right" then
			minetest.remove_node(pos2)
		end
	end
})

minetest.register_node("homedecor:bench_large_2_right", {
	tiles = {
		"homedecor_generic_wood.png",
		"homedecor_generic_wood.png",
		"homedecor_generic_wood.png",
		"homedecor_generic_wood.png",
		"homedecor_bench_large_2_right_back.png",
		"homedecor_bench_large_2_right_front.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
        paramtype2 = "facedir",
	groups = {snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, 0.3125, 0.4375, 0.375, 0.4375, 0.5}, -- NodeBox2
			{-0.5, -0.0625, 0.4375, 0.375, 0.0625, 0.5}, -- NodeBox3
			{-0.5, 0.0625, 0.45, -0.4375, 0.3125, 0.48}, -- NodeBox4
			{-0.375, 0.0625, 0.45, -0.3125, 0.3125, 0.48}, -- NodeBox5
			{-0.25, 0.0625, 0.45, -0.1875, 0.3125, 0.48}, -- NodeBox6
			{-0.125, 0.0625, 0.45, -0.0625, 0.3125, 0.48}, -- NodeBox7
			{0, 0.0625, 0.45, 0.0625, 0.3125, 0.48}, -- NodeBox8
			{0.125, 0.0625, 0.45, 0.1875, 0.3125, 0.48}, -- NodeBox9
			{0.25, 0.0625, 0.45, 0.3125, 0.3125, 0.48}, -- NodeBox10
			{0.375, 0.0625, -0.145362, 0.5, 0.125, 0.375}, -- NodeBox11
			{0.375, -0.5, -0.0625, 0.5, 0.125, 0.0625}, -- NodeBox12
			{0.375, -0.4375, 0.0625, 0.4375, -0.3125, 0.375}, -- NodeBox13
			{-0.5, -0.4375, 0.1875, 0.375, -0.342324, 0.25}, -- NodeBox14
			{-0.5, -0.125, -0.0625, 0.4375, -0.0911603, 0.4375}, -- NodeBox15
			{-0.5, -0.25, -0.0290173, 0.5, -0.125, 0.0125346}, -- NodeBox16
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { 0, 0, 0, 0, 0, 0 }
	},
})

minetest.register_node("homedecor:deckchair_head", {
	tiles = {
		"homedecor_deckchair_top_c1.png",
		"homedecor_deckchair_bottom.png",
		"homedecor_deckchair_sides.png",
		"homedecor_deckchair_sides.png^[transformFX",
		"homedecor_deckchair_back.png",
		"homedecor_deckchair_front.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
        groups = { snappy = 3, not_in_creative_inventory = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.3125, -0.0625, 0.375, -0.25, 0}, -- NodeBox1
			{-0.375, -0.25, 0, 0.375, -0.1875, 0.0625}, -- NodeBox2
			{-0.375, -0.1875, 0.0625, 0.375, -0.125, 0.125}, -- NodeBox3
			{-0.375, -0.125, 0.125, 0.375, -0.0625, 0.1875}, -- NodeBox4
			{-0.375, -0.0625, 0.1875, 0.375, 0, 0.25}, -- NodeBox5
			{-0.375, 0, 0.25, 0.375, 0.0625, 0.3125}, -- NodeBox6
			{-0.375, 0.0625, 0.3125, 0.375, 0.125, 0.375}, -- NodeBox7
			{-0.375, 0.125, 0.375, 0.375, 0.1875, 0.4375}, -- NodeBox8
			{-0.375, 0.1875, 0.4375, 0.375, 0.25, 0.5}, -- NodeBox9
			{-0.375, -0.375, -0.5, 0.375, -0.3125, 0.0625}, -- NodeBox10
			{0.3125, -0.1875, -0.5, 0.4375, -0.1575, 0.0625}, -- NodeBox11
			{-0.4375, -0.1875, -0.5, -0.3125, -0.1575, 0.0625}, -- NodeBox12
			{0.3125, -0.5, 0, 0.375, -0.25, 0.0625}, -- NodeBox13
			{-0.375, -0.5, 0, -0.3125, -0.25, 0.0625}, -- NodeBox14
		}
	},
		selection_box = {
			type = "fixed",
			fixed = { 0, 0, 0, 0, 0, 0 }
		}
})

minetest.register_node("homedecor:deckchair_foot", {
	tiles = {
		"homedecor_deckchair_top_c2.png",
		"homedecor_deckchair_bottom.png",
		"homedecor_deckchair_sides.png",
		"homedecor_deckchair_sides.png^[transformFX",
		"homedecor_deckchair_front.png"
	},
	description = "Deck chair",
	inventory_image = "homedecor_deckchair_inv.png",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
        groups = { snappy = 3 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.375, -0.5, 0.375, -0.3125, 0.5}, -- NodeBox1
			{0.3125, -0.5, -0.5, 0.375, -0.375, -0.4375}, -- NodeBox2
			{-0.375, -0.5, -0.5, -0.3125, -0.375, -0.4375}, -- NodeBox3
			{0.3125, -0.1875, 0.3, 0.4375, -0.1575, 0.5}, -- NodeBox4
			{-0.4375, -0.1875, 0.3, -0.3125, -0.1575, 0.5}, -- NodeBox5
			{-0.365, -0.3125, 0.32, -0.3225, -0.1875, 0.4375}, -- NodeBox6
			{0.3225, -0.3125, 0.32, 0.365, -0.1875, 0.4375}, -- NodeBox7
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.45, -0.5, -0.5, 0.45, 0.35, 1.5 }
	},
	on_place = function(itemstack, placer, pointed_thing)
		return homedecor.stack_sideways(itemstack, placer, pointed_thing,
			"homedecor:deckchair_foot", "homedecor:deckchair_head", false)
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		local fdir = oldnode.param2
		if not fdir or fdir > 3 then return end
		local pos2 = { x = pos.x + homedecor.fdir_to_fwd[fdir+1][1], y=pos.y, z = pos.z + homedecor.fdir_to_fwd[fdir+1][2] }
		if minetest.get_node(pos2).name == "homedecor:deckchair_head" then
			minetest.remove_node(pos2)
		end
	end
})

-- Aliases for 3dforniture mod.

minetest.register_alias("3dforniture:table", "homedecor:table")
minetest.register_alias("3dforniture:chair", "homedecor:chair")
minetest.register_alias("3dforniture:armchair", "homedecor:armchair_black")
minetest.register_alias("homedecor:armchair", "homedecor:armchair_black")

minetest.register_alias('table', 'homedecor:table')
minetest.register_alias('chair', 'homedecor:chair')
minetest.register_alias('armchair', 'homedecor:armchair')
