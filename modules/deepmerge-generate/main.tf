# Use this to generate a new `depth.tf` file in the `deepmerge` module with a different max depth

resource "local_file" "depth" {
  content  = templatefile("${path.module}/../deepmerge/depth.tmpl", { max_depth = 25 })
  filename = "${path.module}/../deepmerge/depth.tf"
}
