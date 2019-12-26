local AllRecipes = GLOBAL.AllRecipes
local STRINGS = GLOBAL.STRINGS



MULT=GetModConfigData("multipler")
MULTI_AMT=GetModConfigData("bundle_size")

--List of items we're going to bulk-ify
bulk_items = {
	'rope',
	'cutstone', 
	'boards',
	'papyrus', 
	'blowdart_pipe', 
	'blowdart_yellow', 
	'blowdart_sleep', 
	'blowdart_fire', 
	'gunpowder', 
	'giftwrap', 
	'bandage', 
	'healingsalve', 
	'bundlewrap'
}


local function create_multi(pname)
	local multi_ingredients = {}
	-- Pulls the ingredient table for the base item.
	local original_recipe = AllRecipes[pname]
	local sub_items = original_recipe.ingredients
	local multi_tech = original_recipe.level
	local multi_recipetab = original_recipe.tab


	for table_num in pairs(sub_items) do
		--table_num is a single ingredient for the base item recipe
		local ingredient_name = sub_items[table_num]["type"]
		local ingredient_amt = sub_items[table_num]["amount"]
		table.insert(multi_ingredients, Ingredient(ingredient_name, ingredient_amt*MULTI_AMT*MULT))
	end

	-- Create the actual recipe
	local multi_name = pname .. "multi"
	local multi_item = AddRecipe(multi_name, multi_ingredients, multi_recipetab, multi_tech)

	multi_item.product = pname
	multi_item.numtogive = MULTI_AMT
	multi_item.sortkey = AllRecipes[pname]["sortkey"] + 0.1
	multi_item.image = pname .. ".tex"

	-- Setting the recipe name/description
	-- This currently does not work. Reason being is because when the game associates a recipe with the visual widget, it looks for the product, not the name of the recipe.
	-- So it will just inherit the base items info. I'm just leaving this in as a placeholder for when I finally think of a possible work around.
	STRINGS["RECIPE_DESC"][string.upper(multi_name)] = "This doesn't even work"
	STRINGS["NAMES"][string.upper(multi_name)] = MULTI_AMT .. "x " .. pname
end


-- Parse the list and do the thing
for index, item in pairs(bulk_items) do
	create_multi(item)
end