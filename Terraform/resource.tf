provider "aws" {
  assume_role {
    role_arn     = "arn:aws:iam::925910328556:group/trerraform-group"
    session_name = "trerraform-group"
    external_id  = "AKIA5PFEOMTWMEF4GZ45"

  }
}