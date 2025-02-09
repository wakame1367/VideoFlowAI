resource "google_storage_bucket" "tfstate_backend" {
  location = "asia-northeast1"
  name     = "${var.project_name}-tfstate-backend"
}
