terraform {
  backend "s3" {
    bucket = "production-terraform-state-suseendhar"
    key    = "production/terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = true
  }
}
