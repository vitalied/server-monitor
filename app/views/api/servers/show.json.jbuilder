json.extract! @server, :id, :cpu_usage, :memory_usage, :disk_usage
json.force_shutdown @server.force_shutdown?
