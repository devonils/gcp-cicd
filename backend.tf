terraform {
  backend "gcs" {
    bucket  = "tf-nils"
    prefix  = "terraform/state"
  }
}
