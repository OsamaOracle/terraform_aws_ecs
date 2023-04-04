resource "aws_cloudwatch_log_group" "this" {
  name_prefix       = var.ecs_task_family
  retention_in_days = 1
}

resource "aws_ecs_task_definition" "this" {
  family = var.ecs_task_family

  container_definitions = <<EOF
[
  {
    "name": "${var.container_name}",
    "image": "${var.container_image}",
    "cpu": "${var.container_cpu}",
    "memory": "${var.container_memory}",
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-region": "${var.region}",
        "awslogs-group": "${aws_cloudwatch_log_group.this.name}",
        "awslogs-stream-prefix": "ec2"
      }
    }
  }
]
EOF
}

resource "aws_ecs_service" "this" {
  name            = "hello_world"
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.this.arn

  desired_count = 1

  deployment_maximum_percent         = 100
  deployment_minimum_healthy_percent = 0
}