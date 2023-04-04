variable "cluster_id" {
  description = "The ECS cluster ID"
  type        = string
}

variable "ecs_task_family" {
  description = "The ECS task family"
  type        = string
}

variable "container_name" {
  description = "The ECS container name"
  type        = string
}

variable "container_image" {
  description = "The ECS container image"
  type        = string
}

variable "container_cpu" {
  description = "The ECS container CPU"
  type        = number
}

variable "container_memory" {
  description = "The ECS container memory"
  type        = number
}

variable "region" {
  description = "Region of ECS cluster"
  type        = string
  default     = us-east-1
}