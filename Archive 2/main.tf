locals {
  inputs = [
    # {
    #   base = {
    #     name        = "$${prefix}-something"
    #     description = "hi $${target}"
    #   }
    #   default = {
    #     prefix = "a"
    #     target = "b"
    #   }
    #   variants = [
    #     {
    #       "prefix" = "c"
    #     },
    #     {
    #       "target" = "d"
    #     },
    #     {
    #       "prefix" = "f"
    #       "target" = "g"
    #     }
    #   ]
    # },
    {
      base = {
        name        = "$${foo}-lorem"
        description = "yo $${bar}"
        static      = "static"
      }
      default = {
        foo = "a"
        bar = "b"
      }
      variants = [
        {
          "foo" = "c"
        },
        {
          "bar" = "d"
        },
        {
          "foo" = "f"
          "bar" = "g"
        }
      ]
    }
  ]
}

# https://github.com/hashicorp/terraform/issues/30616
resource "local_file" "base" {
  for_each = { for i, v in local.inputs : i => v }

  filename = "${path.module}/base/${each.key}.json"
  content  = jsonencode(each.value.base)
}

resource "local_file" "rendered" {
  depends_on = [local_file.base]
  for_each = merge(flatten([
    for i, input in local.inputs : [
      for j, variant in input.variants : {
        "${i}-${j}" = {
          id = local_file.base["${i}"].id,

          filename = local_file.base["${i}"].filename
          data     = merge(input.default, variant)
        }
      }
    ]
  ])...)


  filename = "${path.module}/rendered/${each.key}.json"
  content = templatefile(
    each.value.id != null ? each.value.filename : each.value.filename, # a hack so that teplatefile wait for local_file to exist first
    each.value.data
  )
}
