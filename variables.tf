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
    email_account_admins_enabled                     = optional(bool) # Default: false
    email_addresses                                  = optional(set(string))
    retention_days                                   = optional(number) # Default: 0
    storage_account_access_key                       = optional(string)
    storage_account_access_key_key_vault_id          = optional(string)
    storage_account_access_key_key_vault_secret_name = optional(string)
    storage_endpoint                                 = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.synapse_workspace_security_alert_policies : (
        v.disabled_alerts == null || (contains(["Sql_Injection", "Sql_Injection_Vulnerability", "Access_Anomaly", "Data_Exfiltration", "Unsafe_Action"], v.disabled_alerts))
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
  # --- Unconfirmed validation candidates, derived from azurerm_synapse_workspace_security_alert_policy's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: synapse_workspace_id
  #   source:    [from validate.WorkspaceID] !ok
  # path: synapse_workspace_id
  #   source:    [from validate.WorkspaceID] err != nil
  # path: policy_state
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
}

