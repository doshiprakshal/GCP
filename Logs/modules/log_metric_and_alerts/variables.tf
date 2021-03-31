variable "project_id" {
  type = string
}

# ------------------------------------------------------------------

variable "metric_name" {
  type        = string
  description = "name of the metric"
}

variable "metric_filter" {
  type        = string
  description = "value of the filter"
}

variable "metric_kind" {
  type        = string
  description = "kind of the metric"
}

variable "metric_value_type" {
  type        = string
  description = "type of the metric"
}


# --------------------------------------------------------------------

variable "alert_name" {
  type        = string
  description = "Name of the alert to be displayed"
}

variable "alert_combiner" {
  type        = string
  description = "Combiner of alert"
}

variable "condition_name" {
  type        = string
  description = "Name of alert condition"
}

variable "condition_filter" {
  type        = string
  description = "Log metric used as a condition filter "
}

variable "condition_threshold" {
  type        = string
  description = "Threshold of the condition"
}

variable "condition_duration" {
  type        = string
  description = "Duration of the condition"
}

variable "condition_comparison" {
  type        = string
  description = "Comparison such as greater than or lower than of the given condition"
}

variable "aggregations_period" {
  type        = string
  description = "Period of aggregation"
}

variable "aggregations_aligner" {
  type        = string
  description = "Aggregation aligner to be displayed"
}

variable "aggregations_reducer" {
  type        = string
  description = "Aggregation aligner to be displayed"
}

variable "notification_channels" {
  type = list
  description = "List of email ids"
}
# -------------------------------------------------------------------

