locals {
  mod0toparse = [
    for map_idx in range(0, length(var.maps)) :
    [{
      path  = [],
      value = var.maps[map_idx]
    }]
  ]
  mod0 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod0toparse[map_idx] :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod0toparse[map_idx] :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod1 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod0[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod0[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod2 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod1[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod1[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod3 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod2[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod2[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod4 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod3[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod3[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod5 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod4[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod4[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod6 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod5[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod5[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod7 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod6[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod6[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod8 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod7[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod7[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod9 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod8[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod8[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod10 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod9[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod9[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod11 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod10[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod10[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod12 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod11[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod11[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod13 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod12[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod12[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod14 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod13[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod13[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod15 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod14[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod14[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod16 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod15[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod15[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod17 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod16[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod16[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod18 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod17[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod17[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod19 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod18[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod18[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod20 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod19[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod19[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod21 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod20[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod20[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod22 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod21[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod21[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod23 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod22[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod22[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod24 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod23[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod23[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]
  mod25 = [
    for map_idx in range(0, length(var.maps)) :
    {
      fields = concat([], [
        for item in local.mod24[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            key      = jsonencode(concat(item["path"], [key])),
            path     = concat(item["path"], [key]),
            value    = item["value"][key],
            is_final = item["value"][key] == null || try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) != null
          }
        ]
      ]...)
      remaining = concat([], [
        for item in local.mod24[map_idx].remaining :
        [
          for key in keys(item["value"]) :
          {
            path  = concat(item["path"], [key]),
            value = item["value"][key]
          }
          if item["value"][key] != null && try(tolist(item["value"][key]), toset(item["value"][key]), tonumber(item["value"][key]), tobool(item["value"][key]), tostring(item["value"][key]), null) == null
        ]
      ]...)
    }
  ]

  modules = [
    local.mod0,
    local.mod1,
    local.mod2,
    local.mod3,
    local.mod4,
    local.mod5,
    local.mod6,
    local.mod7,
    local.mod8,
    local.mod9,
    local.mod10,
    local.mod11,
    local.mod12,
    local.mod13,
    local.mod14,
    local.mod15,
    local.mod16,
    local.mod17,
    local.mod18,
    local.mod19,
    local.mod20,
    local.mod21,
    local.mod22,
    local.mod23,
    local.mod24,
    local.mod25,
  ]

  m26 = {}
  m25 = {
    for field in lookup(local.merged_fields_by_depth, 24, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 25, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m26, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m24 = {
    for field in lookup(local.merged_fields_by_depth, 23, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 24, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m25, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m23 = {
    for field in lookup(local.merged_fields_by_depth, 22, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 23, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m24, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m22 = {
    for field in lookup(local.merged_fields_by_depth, 21, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 22, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m23, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m21 = {
    for field in lookup(local.merged_fields_by_depth, 20, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 21, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m22, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m20 = {
    for field in lookup(local.merged_fields_by_depth, 19, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 20, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m21, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m19 = {
    for field in lookup(local.merged_fields_by_depth, 18, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 19, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m20, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m18 = {
    for field in lookup(local.merged_fields_by_depth, 17, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 18, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m19, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m17 = {
    for field in lookup(local.merged_fields_by_depth, 16, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 17, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m18, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m16 = {
    for field in lookup(local.merged_fields_by_depth, 15, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 16, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m17, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m15 = {
    for field in lookup(local.merged_fields_by_depth, 14, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 15, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m16, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m14 = {
    for field in lookup(local.merged_fields_by_depth, 13, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 14, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m15, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m13 = {
    for field in lookup(local.merged_fields_by_depth, 12, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 13, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m14, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m12 = {
    for field in lookup(local.merged_fields_by_depth, 11, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 12, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m13, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m11 = {
    for field in lookup(local.merged_fields_by_depth, 10, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 11, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m12, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m10 = {
    for field in lookup(local.merged_fields_by_depth, 9, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 10, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m11, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m9 = {
    for field in lookup(local.merged_fields_by_depth, 8, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 9, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m10, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m8 = {
    for field in lookup(local.merged_fields_by_depth, 7, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 8, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m9, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m7 = {
    for field in lookup(local.merged_fields_by_depth, 6, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 7, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m8, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m6 = {
    for field in lookup(local.merged_fields_by_depth, 5, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 6, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m7, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m5 = {
    for field in lookup(local.merged_fields_by_depth, 4, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 5, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m6, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m4 = {
    for field in lookup(local.merged_fields_by_depth, 3, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 4, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m5, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m3 = {
    for field in lookup(local.merged_fields_by_depth, 2, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 3, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m4, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m2 = {
    for field in lookup(local.merged_fields_by_depth, 1, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 2, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m3, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
  m1 = {
    for field in lookup(local.merged_fields_by_depth, 0, {}) :
    field.key => { final_val = field.value, sub_val = {
      for subfield in lookup(local.merged_fields_by_depth, 1, {}) :
      subfield.path[length(subfield.path) - 1] => lookup(local.m2, subfield.key, subfield.value)
      if slice(subfield.path, 0, length(subfield.path) - 1) == field.path
    } }[field.is_final ? "final_val" : "sub_val"]
  }
}
