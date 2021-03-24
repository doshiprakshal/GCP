variable "project_id" {
  type = string
}

# --------------------------------------------------------------------

variable "channel_name" {
  type        = string
  description = "Name to be displayed"
}

variable "channel_type" {
  type        = string
  description = "Type of the notification channel"
 //"email"
}

variable "address" {
  type        = string
  description = "List of email ids"
  //"website-oncall@example.com"
}


# -------------------------------------------------------------------
