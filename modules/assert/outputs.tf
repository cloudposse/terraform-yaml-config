output "checked" {
  description = "Whether the condition has been checked (used for assertion dependencies)."
  depends_on  = [data.external.assertion]
  value       = true
}
