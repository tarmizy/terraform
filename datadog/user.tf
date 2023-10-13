data "datadog_role" "ro_role" {
  filter = "Datadog Read Only Role"
}

# Create a new Datadog user
resource "datadog_user" "test" {
  email = "new@example.com"

  roles = [data.datadog_role.ro_role.id]
}