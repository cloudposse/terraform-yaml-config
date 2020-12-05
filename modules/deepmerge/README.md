# Deepmerge

This module performs a deep map merge of standard Terraform maps/objects. It is functionally similar to the built-in `merge` function, except that it will merge maps at the same depth instead of overwriting them. It can handle maps with a depth up to 100 (see commented-out code at the bottom of `main.tf` if you want to modify it to handle deeper maps).

It functions by "flattening" each input map into a map of depth 1 where each key is the full path to the value in question. It then uses the standard merge function on these flat maps, and finally it re-builds the map structure in reverse order.

## Example:

```
locals {
  map1 = {
    key1-1 = {
        key1-1-1 = "value1-1-1"
        key1-1-2 = "value1-1-2"
        key1-1-3 = {
            key1-1-3-1 = "value1-1-3-1"
            key1-1-3-2 = "value1-1-3-2"
        }
    }
    key1-2 = "value1-2"
    key1-3 = {
        key1-3-1 = "value1-3-1"
        key1-3-2 = "value1-3-2"
    }
  }

  map2 = {
    key1-1 = {
        key1-1-1 = "value1-1-1(overwrite)"
        key1-1-3 = {
            key1-1-3-2 = "value1-1-3-2(overwrite)"
            key1-1-3-3 = {
                key1-1-3-3-1 = "value1-1-3-3-1"
            }
        }
        key1-1-4 = "value1-1-4"
    }
    key1-2 = {
        key1-2-1 = "value1-2-1"
        key1-2-2 = "value1-2-2"
        key1-2-3 = {
            key1-2-3-1 = "value1-2-3-1"
        }
    }
    key1-3 = "value1-3(overwrite)"
  }

  map3 = {
    key1-3 = "value1-3(double-overwrite)"
    key1-2 = {
        key1-2-3 = {
            key1-2-3-2 = "value1-2-3-2"
        }
    }
  }
}

module "deepmerge" {
  source = "github.com/Imperative-Systems-Inc/terraform-modules/deepmerge"
  maps = [
    local.map1,
    local.map2,
    local.map3
  ]
}

// The merged map
output "merged" {
    value = module.deepmerge.merged
}
```

```
Outputs:

merged = {
  "key1-1" = {
    "key1-1-1" = "value1-1-1(overwrite)"
    "key1-1-2" = "value1-1-2"
    "key1-1-3" = {
      "key1-1-3-1" = "value1-1-3-1"
      "key1-1-3-2" = "value1-1-3-2(overwrite)"
      "key1-1-3-3" = {
        "key1-1-3-3-1" = "value1-1-3-3-1"
      }
    }
    "key1-1-4" = "value1-1-4"
  }
  "key1-2" = {
    "key1-2-1" = "value1-2-1"
    "key1-2-2" = "value1-2-2"
    "key1-2-3" = {
      "key1-2-3-1" = "value1-2-3-1"
      "key1-2-3-2" = "value1-2-3-2"
    }
  }
  "key1-3" = "value1-3(double-overwrite)"
}
```
