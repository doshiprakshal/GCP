variable "project_id" {
  type        = string
  description = "The default project to manage resources in. If another project is specified on a resource, it will take precedence."
}

variable "clinical_app_project_id" {
  type = string
  description = "Name of the GCP Project for clinical applications"
}

variable "region" {
  type        = string
  description = "The default region to manage resources in. If another region is specified on a regional resource, it will take precedence."
}

variable "prefix" {
  type        = string
  description = "Tag name for the resources(calantic)"
}

variable "region_shorthand" {
  type        = string
  description = "Region shorthand"
}

variable "location" {
  type        = string
  description = "Multi-regional location for resource delpoyment"
}

variable "location_shorthand" {
  type        = string
  description = "Multi-regional location shorthand for resource delpoyment"
}

variable "zone" {
  type        = string
  description = "The default zone to manage resources in. Generally, this zone should be within the default region you specified. If another zone is specified on a zonal resource, it will take precedence."
}

variable "zone_shorthand" {
  type        = string
  description = "Zone shorthand"
}

variable "env" {
  type        = string
  description = "Deployment Environment"
}

# -------------------------------------------------------------------

variable "channel_name" {
  type        = string
  description = "Name of the notification channel"
  default     = "bayer-and-quantiphi"
}

variable "channel_type" {
  type        = string
  description = "Type of the notification channel"
  default     = "email"
}

variable "address" {
  type        = list(string)
  description = "Name of the notification channel"
  default     = [
    "saiteja.jayanti@quantiphi.com",
    "martyn.webb@bayer.com",
    "francesco.desensi@bayer.com",
    "prakshal.doshi@quantiphi.com",
    "tejas.ved@quantiphi.com",
    "rishabh.rusia@quantiphi.com"
    ]
}

# -------------------------------------------------------------------

variable "metric_name" {
  type        = list(string)
  description = "name of the metric"
  default = [
    "audit-configuration-logs",
    "custom-role-logs",
    "gcs-iam-logs",
    "project-ownership-logs",
    "sql-configuration-logs",
    "vpc-firewall-logs",
    "vpc-network-logs",
    "vpc-route-logs"
  ]
}

variable "metric_filter" {
  type        = list(string)
  description = "value of the filter"
  //"resource.type=\"gce_firewall_rule\" AND protoPayload.methodName:\"compute.firewalls.insert\" OR protoPayload.methodName:\"compute.firewalls.patch\" OR protoPayload.methodName:\"compute.firewalls.delete\""
  default = [
    "protoPayload.methodName=\"SetIamPolicy\" AND protoPayload.serviceData.policyDelta.auditConfigDeltas:*",
    "resource.type=\"iam_role\" AND protoPayload.methodName:\"CreateRole\" OR protoPayload.methodName:\"DeleteRole\" OR protoPayload.methodName:\"UpdateRole\"",
    "resource.type=\"gcs_bucket\" AND protoPayload.methodName=\"storage.setIamPermissions\"",
    "(protoPayload.serviceName=\"cloudresourcemanager.googleapis.com\") AND (ProjectOwnership OR projectOwnerInvitee) OR (protoPayload.serviceData.policyDelta.bindingDeltas.action=\"REMOVE\" AND protoPayload.serviceData.policyDelta.bindingDeltas.role=\"roles/owner\") OR (protoPayload.serviceData.policyDelta.bindingDeltas.action=\"ADD\" AND protoPayload.serviceData.policyDelta.bindingDeltas.role=\"roles/owner\")",
    "resource.type=\"cloudsql_database\" AND protoPayload.methodName:\"cloudsql.instances.update\" OR protoPayload.methodName:\"cloudsql.instances.insert\" OR protoPayload.methodName:\"cloudsql.instances.delete\"",
    "resource.type=\"gce_firewall_rule\" AND protoPayload.methodName:\"compute.firewalls.insert\" OR protoPayload.methodName:\"compute.firewalls.patch\" OR protoPayload.methodName:\"compute.firewalls.delete\"",
    "resource.type=\"gce_network\" AND protoPayload.methodName:\"compute.networks.insert\" OR protoPayload.methodName:\"compute.networks.patch\" OR protoPayload.methodName:\"compute.networks.delete\" OR protoPayload.methodName:\"compute.networks.removePeering\" OR protoPayload.methodName:\"compute.networks.addPeering\"",
    "resource.type=\"gce_route\" AND protoPayload.methodName:\"compute.routes.insert\" OR protoPayload.methodName:\"compute.routes.delete\""
  ]
}

variable "metric_kind" {
  type        = string
  description = "kind of the metric"
  default     = "DELTA"
}

variable "metric_value_type" {
  type        = string
  description = "type of the metric"
  default     = "INT64"
}

# --------------------------------------------------------------------

variable "alert_name" {
  type        = list(string)
  description = "Name of the alert to be displayed"
  default = [
    "audit-configuration-alert",
    "custom-role-alert",
    "gcs-iam-alert",
    "project-ownership-alert",
    "sql-configuration-alert",
    "vpc-firewall-alert",
    "vpc-network-alert",
    "vpc-route-alert"
  ]
}

variable "alert_combiner" {
  type        = string
  description = "Combiner of alert"
  default     = "OR"
}

variable "condition_name" {
  type        = list(string)
  description = "Name of alert condition"
  default = [
    "audit-configuration",
    "custom-role",
    "gcs-iam",
    "project-ownership",
    "sql-configuration",
    "vpc-firewall",
    "vpc-network",
    "vpc-route"
  ]
}

variable "condition_filter" {
  type        = list(string)
  description = "Log metric used as a condition filter "
  # default //"metric.type=\"logging.googleapis.com/user/${google_logging_metric.logging_metric_1.name}\" AND resource.type=\"global\""
  default = [
    "global",
    "global",
    "gcs_bucket",
    "global",
    "global",
    "global",
    "global",
    "global"
  ]

}

variable "condition_threshold" {
  type        = number
  description = "Threshold of the condition"
  default     = 0
}

variable "condition_duration" {
  type        = string
  description = "Duration of the condition"
  default     = "0s"
}

variable "condition_comparison" {
  type        = string
  description = "Comparison such as greater than or lower than of the given condition"
  default     = "COMPARISON_GT"
}

variable "aggregations_period" {
  type        = string
  description = "Period of aggregation"
  default     = "300s"
}

variable "aggregations_aligner" {
  type        = string
  description = "Aggregation aligner to be displayed"
  default     = "ALIGN_RATE"
}

variable "aggregations_reducer" {
  type        = string
  description = "Aggregation aligner to be displayed"
  default     = "REDUCE_COUNT"
}

# -------------------------------------------------------------------
