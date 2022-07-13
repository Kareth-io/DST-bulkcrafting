-- This information tells other players more about the mod
name = "Bulk Crafting"
author = "Kareth"
description = "Allows for bulk crafting of specific items"
version = "1.0.6" -- This is the version of the template. Change it to your own number.

-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10

-- Compatible with Don't Starve Together
dst_compatible = true


client_only_mod = false
all_clients_require_mod = true

icon_atlas = "bulkcrafting.xml"
icon = "bulkcrafting.tex"



configuration_options = {
    {
        name = "multipler",
        label = "Bundle Resource Cost",
        options =   {
                        {description = "Cheater", data = 0.01},
                        {description = "10%", data = 0.1}, 
                        {description = "20%", data = 0.2},
                        {description = "30%", data = 0.3},
                        {description = "40%", data = 0.4},
                        {description = "50%", data = 0.5},
                        {description = "60%", data = 0.6},
                        {description = "70%", data = 0.7},
                        {description = "80%", data = 0.8},
                        {description = "90%", data = 0.9},                                                                                                                                              
                        {description = "100%", data = 1.0}
                    },
        default = 0.8,
    },
    {
        name = "bundle_size",
        label = "Bundle_size",
        options = {
                    {description = "2", data = 2},
                    {description = "3", data = 3},
                    {description = "4", data = 4},
                    {description = "5", data = 5},
                    {description = "6", data = 6},
                    {description = "7", data = 7},
                    {description = "8", data = 8},
                    {description = "9", data = 9},
                    {description = "10", data = 10},
                    {description = "11", data = 11},
                    {description = "12", data = 12},
                    {description = "13", data = 13},
                    {description = "14", data = 14},
                    {description = "15", data = 15},
                    {description = "16", data = 16},                    
                    {description = "17", data = 17},
                    {description = "18", data = 18},                    
                    {description = "19", data = 19},
                    {description = "20", data = 20}
                  },
        default = 10
    }
}