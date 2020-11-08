local fireutil = require("__base__.prototypes.fire-util")

local thermobaric_rocket_recipe = {
    type = "recipe",
    name = "thermobaric-rocket",
    enabled = false,
    energy_required = 30,
    ingredients =
    {
      {"explosive-rocket", 1},
      {"advanced-circuit", 4},
      {"rocket-fuel", 20},
      {"empty-barrel", 2}
    },
    result = "thermobaric-rocket"
}

local thermobaric_rocket_item = table.deepcopy(data.raw["ammo"]["atomic-bomb"])
thermobaric_rocket_item.name = "thermobaric-rocket"
thermobaric_rocket_item.order = "d[rocket-launcher]-b[thermobaric]"
thermobaric_rocket_item.ammo_type.action.action_delivery.projectile = "thermobaric-rocket"
thermobaric_rocket_item.icon = "__True-Nukes__/graphics/thermobaric-rocket.png"

local thermobaric_rocket_projectile = table.deepcopy(data.raw["projectile"]["atomic-rocket"])
thermobaric_rocket_projectile.name = "thermobaric-rocket"
thermobaric_rocket_projectile.action = {
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "script",
		effect_id = "Thermobaric Weapon hit medium"
      },
      {
        type = "create-entity",
        entity_name = "nuke-explosion"
      },
      {
        type = "create-entity",
        entity_name = "medium-scorchmark-tintable",
        check_buildability = true
      },
      {
        type = "destroy-decoratives",
        from_render_layer = "decals",
        to_render_layer = "object",
        include_soft_decoratives = true,
        include_decals = true,
        invoke_decorative_trigger = false,
        decoratives_with_trigger_only = false,
        radius = 6
      },
      {
        type = "nested-result",
        action =
		 {
		   type = "area",
		   radius = 80,
		   action_delivery =
		   {
		     type = "instant",
		     target_effects =
		     {
		       type = "damage",
		       damage = {amount = 0.1, type = "fire"}
		     }
		   }
		 }
      },
      {
        type = "nested-result",
        action =
        {
          type = "area",
          radius = 6,
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "damage",
                damage = {amount = 600, type = "explosion"}
              }
            }
          }
        }
      }
    }
  }
}

data:extend{thermobaric_rocket_recipe, thermobaric_rocket_item, thermobaric_rocket_projectile}



local thermobaric_cannon_recipe = {
    type = "recipe",
    name = "thermobaric-cannon-shell",
    enabled = false,
    energy_required = 20,
    ingredients =
    {
      {"explosive-cannon-shell", 1},
      {"advanced-circuit", 2},
      {"rocket-fuel", 10},
      {"empty-barrel", 1}
    },
    result = "thermobaric-cannon-shell"
}

local thermobaric_cannon_item = table.deepcopy(data.raw["ammo"]["explosive-cannon-shell"])
thermobaric_cannon_item.name = "thermobaric-cannon-shell"
thermobaric_cannon_item.ammo_type.action.action_delivery.projectile = "thermobaric-cannon-projectile"
thermobaric_cannon_item.icon = "__True-Nukes__/graphics/thermobaric-cannon-shell.png"

local thermobaric_cannon_projectile = table.deepcopy(data.raw["projectile"]["explosive-cannon-projectile"])
thermobaric_cannon_projectile.name = "thermobaric-cannon-projectile"
thermobaric_cannon_projectile.action = {
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "script",
		effect_id = "Thermobaric Weapon hit small"
      },
      {
        type = "create-entity",
        entity_name = "nuke-explosion"
      },
      {
        type = "create-entity",
        entity_name = "medium-scorchmark-tintable",
        check_buildability = true
      },
      {
        type = "destroy-decoratives",
        from_render_layer = "decals",
        to_render_layer = "object",
        include_soft_decoratives = true,
        include_decals = true,
        invoke_decorative_trigger = false,
        decoratives_with_trigger_only = false,
        radius = 3
      },
      {
        type = "nested-result",
        action =
		 {
		   type = "area",
		   radius = 60,
		   action_delivery =
		   {
		     type = "instant",
		     target_effects =
		     {
		       type = "damage",
		       damage = {amount = 0.1, type = "fire"}
		     }
		   }
		 }
      },
      {
        type = "nested-result",
        action =
        {
          type = "area",
          radius = 3,
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "damage",
                damage = {amount = 600, type = "explosion"}
              }
            }
          }
        }
      }
    }
  }
}
data:extend{thermobaric_cannon_recipe, thermobaric_cannon_item, thermobaric_cannon_projectile}



local thermobaric_artillery_recipe = {
    type = "recipe",
    name = "thermobaric-artillery-shell",
    enabled = false,
    energy_required = 40,
    ingredients =
    {
      {"artillery-shell", 1},
      {"advanced-circuit", 5},
      {"rocket-fuel", 30},
      {"empty-barrel", 3}
    },
    result = "thermobaric-artillery-shell"
}

local thermobaric_artillery_item = table.deepcopy(data.raw["ammo"]["artillery-shell"])
thermobaric_artillery_item.name = "thermobaric-artillery-shell"
thermobaric_artillery_item.ammo_type.action.action_delivery.projectile = "thermobaric-artillery-projectile"
thermobaric_artillery_item.icon = "__True-Nukes__/graphics/thermobaric-artillery-shell.png"

local thermobaric_artillery_projectile = table.deepcopy(data.raw["artillery-projectile"]["artillery-projectile"])
thermobaric_artillery_projectile.name = "thermobaric-artillery-projectile"

--Hack to fix Make Artillery Great Again's removal of the 'chart_picture'... also just being defensive
if(thermobaric_artillery_projectile.chart_picture) then
	thermobaric_artillery_projectile.chart_picture.filename = "__True-Nukes__/graphics/thermobaric-artillery-map-visualization.png"
else
	thermobaric_artillery_projectile.chart_picture = {
	      filename = "__True-Nukes__/graphics/thermobaric-artillery-map-visualization.png",
	      flags = { "icon" },
	      frame_count = 1,
	      width = 64,
	      height = 64,
	      priority = "high",
	      scale = 0.25
	    }
end

thermobaric_artillery_projectile.action = {
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      {
        type = "script",
		effect_id = "Thermobaric Weapon hit large"
      },
      {
        type = "create-entity",
        entity_name = "nuke-explosion"
      },
      {
        type = "create-entity",
        entity_name = "medium-scorchmark-tintable",
        check_buildability = true
      },
      {
        type = "destroy-decoratives",
        from_render_layer = "decals",
        to_render_layer = "object",
        include_soft_decoratives = true,
        include_decals = true,
        invoke_decorative_trigger = false,
        decoratives_with_trigger_only = false,
        radius = 9
      },
      {
        type = "nested-result",
        action =
		 {
		   type = "area",
		   radius = 120,
		   action_delivery =
		   {
		     type = "instant",
		     target_effects =
		     {
		       type = "damage",
		       damage = {amount = 0.1, type = "fire"}
		     }
		   }
		 }
      },
      {
        type = "nested-result",
        action =
        {
          type = "area",
          radius = 9,
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "damage",
                damage = {amount = 600, type = "explosion"}
              }
            }
          }
        }
      }
    }
  }
}
data:extend{thermobaric_artillery_recipe, thermobaric_artillery_item, thermobaric_artillery_projectile}


local thermobaric_tech = table.deepcopy(data.raw["technology"]["military-3"])
thermobaric_tech.name = "thermobaric-weaponry"
thermobaric_tech.effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thermobaric-artillery-shell"
      },
      {
        type = "unlock-recipe",
        recipe = "thermobaric-cannon-shell"
      },
      {
        type = "unlock-recipe",
        recipe = "thermobaric-rocket"
      }
    }
thermobaric_tech.prerequisites = {"rocket-fuel", "flamethrower", "military-3"}
thermobaric_tech.icon = "__True-Nukes__/graphics/thermobaric-tech.png"
thermobaric_tech.unit.count=250
data:extend{thermobaric_tech}