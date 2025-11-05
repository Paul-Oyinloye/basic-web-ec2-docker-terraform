
variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
}

# Optional: limit SSH to your IP while testing; set to "" to disable SSH
variable "your_ip_cidr" {
  type        = string
  default     = "" # e.g., "203.0.113.5/32"
}
