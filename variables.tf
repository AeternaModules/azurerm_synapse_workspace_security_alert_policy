variable "synapse_workspace_security_alert_policies" {
  description = <<EOT
Map of synapse_workspace_security_alert_policies, attributes below
Required:
    - policy_state
    - synapse_workspace_id
Optional:
    - disabled_alerts
    - email_account_admins_enabled
    - email_addresses
    - retention_days
    - storage_account_access_key
    - storage_account_access_key_key_vault_id (alternative to storage_account_access_key - read from Key Vault instead)
    - storage_account_access_key_key_vault_secret_name (alternative to storage_account_access_key - read from Key Vault instead)
    - storage_endpoint
EOT

  type = map(object({
    policy_state                                     = string
    synapse_workspace_id                             = string
    disabled_alerts                                  = optional(set(string))
    email_account_admins_enabled                     = optional(bool)
    email_addresses                                  = optional(set(string))
    retention_days                                   = optional(number)
    storage_account_access_key                       = optional(string)
    storage_account_access_key_key_vault_id          = optional(string)
    storage_account_access_key_key_vault_secret_name = optional(string)
    storage_endpoint                                 = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.synapse_workspace_security_alert_policies : (
        v.disabled_alerts == null || (alltrue([for x in v.disabled_alerts : contains(["Sql_Injection", "Sql_Injection_Vulnerability", "Access_Anomaly", "Data_Exfiltration", "Unsafe_Action"], x)]))
      )
    ])
    error_message = "must be one of: Sql_Injection, Sql_Injection_Vulnerability, Access_Anomaly, Data_Exfiltration, Unsafe_Action"
  }
  validation {
    condition = alltrue([
      for k, v in var.synapse_workspace_security_alert_policies : (
        v.retention_days == null || (v.retention_days >= 0)
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.synapse_workspace_security_alert_policies : (
        v.storage_account_access_key == null || (length(v.storage_account_access_key) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.synapse_workspace_security_alert_policies : (
        v.storage_endpoint == null || (length(v.storage_endpoint) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

