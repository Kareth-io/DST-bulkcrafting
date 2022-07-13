local AllRecipes = GLOBAL.AllRecipes
local STRINGS = GLOBAL.STRINGS

--Table of items we 
modimport "bulkitems.lua"

MULT=GetModConfigData("multipler")
MULTI_AMT=GetModConfigData("bundle_size")

Assets = {
    Asset("ATLAS", "images/bulkfilter.xml"),
    Asset("IMAGE", "images/bulkfilter.tex")
}

GLOBAL.STRINGS.UI.CRAFTING_FILTERS["BULK"] = "Bulk Recipes"

AddRecipeFilter(
	{ -- filter_def
		name = "BULK", -- internal name.
		atlas = "images/bulkfilter.xml",
		image = "bulkfilter.tex",
	},
	1 -- index
)


local function create_multi(pname)
	local multi_ingredients = {}
	-- Pulls the ingredient table for the base item.
	local original_recipe = AllRecipes[pname]
	local sub_items = original_recipe.ingredients
	local multi_tech = original_recipe.level
	local multi_recipetab = original_recipe.filters


	for table_num in pairs(sub_items) do
		--table_num is a single ingredient for the base item recipe
		local ingredient_name = sub_items[table_num]["type"]
		local ingredient_amt = sub_items[table_num]["amount"]
		table.insert(multi_ingredients, Ingredient(ingredient_name, ingredient_amt*MULTI_AMT*MULT))
	end

	-- Create the actual recipe
	local multi_name = pname .. "multi"
	local multi_item = AddRecipe2(multi_name, multi_ingredients, multi_tech, nil, {"BULK"})

	multi_item.product = pname
	multi_item.numtogive = MULTI_AMT * original_recipe.numtogive
	multi_item.sortkey = AllRecipes[pname]["sortkey"] + 0.1
	multi_item.image = pname .. ".tex"

	-- maintain character exclusivity
	if original_recipe.builder_tag then
		multi_item.builder_tag = original_recipe.builder_tag
	end
	
	-- Setting the recipe name
	local pname_split = pname:gsub("_", " ")
	local nicename	= string.gsub(" "..pname_split, "%W%l", string.upper):sub(2)
	STRINGS["NAMES"][string.upper(multi_name)] = multi_item.numtogive .. "x " .. nicename

	-- This currently does not work. Reason being is because when the game associates a recipe with the visual widget, it looks for the product, not the name of the recipe.
	-- So it will just inherit the base items info. I'm just leaving this in as a placeholder for when I finally think of a possible work around.
	STRINGS["RECIPE_DESC"][string.upper(multi_name)] = "This doesn't even work"
	
end


-- Parse the list and do the thing
for index, item in pairs(bulk_items) do
	create_multi(item)
end