variable "cloud_id" {
  description = "Cloud"
}
variable "folder_id" {
  description = "Folder"
}
variable "zone" {
  description = "Zone"
  default     = "ru-central1-a"
}
variable "public_key_path" {
  description = "~/.ssh/yc_docker.pub"
}
variable "private_key_path" {
  description = "~/.ssh/yc_docker"
}
variable "image_id" {
  description = "fd8gonjgqskvh3bb4f13"
}
variable "subnet_id" {
  description = "ru-central1-a"
}
variable "access_key" {
  description = "access_key"
}
variable "secret_key" {
  description = "secret_key"
}
