terraform {
  backend "s3" {
    bucket = "join-tf-states"
    key    = "testing/stae"
    region = "us-east-1"
  }
}

resource "null_resource" "dummy1" {}
resource "null_resource" "dummy2" {}