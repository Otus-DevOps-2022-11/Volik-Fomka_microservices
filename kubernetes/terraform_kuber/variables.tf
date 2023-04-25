variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable subnet_id {
  description = "Subnet"
}
variable node_count {
  description = "count node"
  default     = 2
}
variable cores {
  description = "VM cores"
  default     = 4
}
variable memory {
  description = "VM memory"
  default     = 16
}
variable disk {
  description = "Disk size"
  default     = 64
}
variable network_id {
  description = "Network id"
}
variable service_account_id {
  description = "Service account ID"
}
variable node_service_account_id {
  description = "Service account ID"
}
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
variable "private_key_path" {
  description = "~/.ssh/yc_docker"
}
variable "image_id" {
  description = "fd8gonjgqskvh3bb4f13"
}
variable "access_key" {
  description = "access_key"
}
variable "secret_key" {
  description = "secret_key"
}
variable service_account_key_file {
  description = "authorized_key.json"
}
