output "synapse_workspace_security_alert_policies_id" {
  description = "Map of id values across all synapse_workspace_security_alert_policies, keyed the same as var.synapse_workspace_security_alert_policies"
  value       = { for k, v in azurerm_synapse_workspace_security_alert_policy.synapse_workspace_security_alert_policies : k => v.id if v.id != null && length(v.id) > 0 }
}
output "synapse_workspace_security_alert_policies_disabled_alerts" {
  description = "Map of disabled_alerts values across all synapse_workspace_security_alert_policies, keyed the same as var.synapse_workspace_security_alert_policies"
  value       = { for k, v in azurerm_synapse_workspace_security_alert_policy.synapse_workspace_security_alert_policies : k => v.disabled_alerts if v.disabled_alerts != null && length(v.disabled_alerts) > 0 }
}
output "synapse_workspace_security_alert_policies_email_account_admins_enabled" {
  description = "Map of email_account_admins_enabled values across all synapse_workspace_security_alert_policies, keyed the same as var.synapse_workspace_security_alert_policies"
  value       = { for k, v in azurerm_synapse_workspace_security_alert_policy.synapse_workspace_security_alert_policies : k => v.email_account_admins_enabled if v.email_account_admins_enabled != null }
}
output "synapse_workspace_security_alert_policies_email_addresses" {
  description = "Map of email_addresses values across all synapse_workspace_security_alert_policies, keyed the same as var.synapse_workspace_security_alert_policies"
  value       = { for k, v in azurerm_synapse_workspace_security_alert_policy.synapse_workspace_security_alert_policies : k => v.email_addresses if v.email_addresses != null && length(v.email_addresses) > 0 }
}
output "synapse_workspace_security_alert_policies_policy_state" {
  description = "Map of policy_state values across all synapse_workspace_security_alert_policies, keyed the same as var.synapse_workspace_security_alert_policies"
  value       = { for k, v in azurerm_synapse_workspace_security_alert_policy.synapse_workspace_security_alert_policies : k => v.policy_state if v.policy_state != null && length(v.policy_state) > 0 }
}
output "synapse_workspace_security_alert_policies_retention_days" {
  description = "Map of retention_days values across all synapse_workspace_security_alert_policies, keyed the same as var.synapse_workspace_security_alert_policies"
  value       = { for k, v in azurerm_synapse_workspace_security_alert_policy.synapse_workspace_security_alert_policies : k => v.retention_days if v.retention_days != null }
}
output "synapse_workspace_security_alert_policies_storage_account_access_key" {
  description = "Map of storage_account_access_key values across all synapse_workspace_security_alert_policies, keyed the same as var.synapse_workspace_security_alert_policies"
  value       = { for k, v in azurerm_synapse_workspace_security_alert_policy.synapse_workspace_security_alert_policies : k => v.storage_account_access_key if v.storage_account_access_key != null && length(v.storage_account_access_key) > 0 }
  sensitive   = true
}
output "synapse_workspace_security_alert_policies_storage_endpoint" {
  description = "Map of storage_endpoint values across all synapse_workspace_security_alert_policies, keyed the same as var.synapse_workspace_security_alert_policies"
  value       = { for k, v in azurerm_synapse_workspace_security_alert_policy.synapse_workspace_security_alert_policies : k => v.storage_endpoint if v.storage_endpoint != null && length(v.storage_endpoint) > 0 }
}
output "synapse_workspace_security_alert_policies_synapse_workspace_id" {
  description = "Map of synapse_workspace_id values across all synapse_workspace_security_alert_policies, keyed the same as var.synapse_workspace_security_alert_policies"
  value       = { for k, v in azurerm_synapse_workspace_security_alert_policy.synapse_workspace_security_alert_policies : k => v.synapse_workspace_id if v.synapse_workspace_id != null && length(v.synapse_workspace_id) > 0 }
}

