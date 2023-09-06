output "host" {
  value = "${azurerm_redis_cache.redis.name}.redis.cache.windows.net"
}

output "key" {
  value = azurerm_redis_cache.redis.primary_access_key
  sensitive = true
}