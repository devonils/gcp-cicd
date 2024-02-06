resource "google_storage_bucket" "static-site" {
  name          = "test-tf-cloud-build"
  location      = "EU"
  force_destroy = true
  project       = var.project

  uniform_bucket_level_access = true

}