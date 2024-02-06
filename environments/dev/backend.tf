terraform {
  backend "gcs" {
    bucket  = "terraform-nils"
    prefix  = "terraform/state"
  }
}
