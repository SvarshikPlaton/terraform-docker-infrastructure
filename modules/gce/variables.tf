variable "gcp_project" {
    description = "GCP Project ID"
    type        = string
}
variable "gcp_zone" {
    description = "GCP Zone"
    type        = string
}
variable "provedcode_subnet" {
  description = "The self link of the subnet to be used by the instances"
  type        = string
}

