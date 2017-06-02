json = require "json"

local function decode_recipe(recipe)
    return {
        name = recipe.name,
        category = recipe.category,
        ingredients = recipe.ingredients,
        products = recipe.products,
        energy = recipe.energy
    }
end

local function dump_recipes()
    recipes = {}

    for _, recipe in pairs(game.recipe_prototypes) do 
        if not recipe.hidden and recipe.valid then
            table.insert(recipes, decode_recipe(recipe))
        end
    end
    game.write_file("calculator-dump.json", json.encode(recipes), false)
end
commands.add_command("dump", "dump recipes", dump_recipes)
