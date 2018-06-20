#!/usr/bin/env bats
 
@test "Validate service is running" {
  run systemctl status grafana
  [ "$status" -eq 0 ]
}

@test "Validate service is healthy" {
  run curl -s -o /dev/null -w "%{http_code}" localhost:3000/api/health
  [[ $output = "200" ]]
}