--[[ Bog iron sometimes spawns in clay. 
	Combine with water bucket to wash clay off nuggets.
	Combine nuggets with charcoal to get bloom material. 
	Cook bloom material in furnace to get iron bloom.
	Cook iron bloom in furnace to get ingot.
	Add bog_iron tools.
]]


-- Bog iron will appear sometimes in clay.

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "bog_iron:clay_with_ore",
	wherein        = "default:clay",
	clust_scarcity = 5 * 5 * 5,
	clust_num_ores = 5,
	clust_size     = 3,
	y_max          = 0,
	y_min          = -100,
})


-- Register the new nodes

minetest.register_node("bog_iron:clay_with_ore", {
	description = ("Clay with bog iron"),
	tiles = {"default_clay.png^bog_iron_ore.png"},
	groups = {crumbly = 3},
	drop = "bog_iron:clay_with_ore",
	sounds = default.node_sound_dirt_defaults(),
})


-- Register tools

minetest.register_tool("bog_iron:pickaxe", {
	description = ("Bog Iron Pickaxe"),
	inventory_image = "bog_iron_pickaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=2.0, [3]=1.00}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1}
})


-- Register craftitems

minetest.register_craftitem("bog_iron:charcoal", {
	description = ("Charcoal"),
	inventory_image = "bog_iron_charcoal.png"
})

minetest.register_craftitem("bog_iron:iron_nugget", {
	description = ("Iron Nugget"),
	inventory_image = "bog_iron_nugget.png"
})

minetest.register_craftitem("bog_iron:bloom_material", {
	description = ("Iron Bloom Material"),
	inventory_image = "bog_iron_bloom_material.png"
})

minetest.register_craftitem("bog_iron:bloom", {
	description = ("Iron Bloom"),
	inventory_image = "bog_iron_bloom.png"
})

minetest.register_craftitem("bog_iron:ingot", {
	description = ("Iron Ingot"),
	inventory_image = "bog_iron_ingot.png"
})


-- Register craft recipes

minetest.register_craft({
    type = "fuel",
    recipe = "bog_iron:charcoal",
    burntime = 30,
})

minetest.register_craft({
	type = "cooking",
	output = "bog_iron:bloom",
	recipe = "bog_iron:bloom_material",
	cooktime = 6,
})

minetest.register_craft({
	type = "cooking",
	output = "bog_iron:ingot",
	recipe = "bog_iron:bloom",
	cooktime = 6,
})

minetest.register_craft({
	type = "cooking",
	output = "bog_iron:charcoal",
	recipe = "group:tree",
	cooktime = 6,
})

minetest.register_craft({
    type = "shapeless",
    output = "bog_iron:iron_nugget",
    recipe = {
        "bucket:bucket_water", "bog_iron:clay_with_ore"},
        replacements = {
            {"bucket:bucket_water", "bucket:bucket_empty"},
        }
    }
)

minetest.register_craft({
	output = "bog_iron:bloom_material",
	recipe = {
		{"bog_iron:iron_nugget", "bog_iron:iron_nugget", "bog_iron:iron_nugget"},
		{"bog_iron:iron_nugget", "bog_iron:charcoal", "bog_iron:iron_nugget"},
		{"bog_iron:iron_nugget", "bog_iron:iron_nugget", "bog_iron:iron_nugget"},
	}
})

minetest.register_craft({
	output = "bog_iron:pickaxe",
	recipe = {
		{"bog_iron:ingot", "bog_iron:ingot", "bog_iron:ingot"},
		{"", "default:stick", ""},
		{"", "default:stick", ""},
	}
})