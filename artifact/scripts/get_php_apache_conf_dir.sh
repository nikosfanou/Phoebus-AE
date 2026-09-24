#!/bin/bash

# Default: no container
container=""

# Parse arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    --container)
      container="$2"
      shift 2
      ;;
    *)
      echo "Unknown argument: $1"
      exit 1
      ;;
  esac
done

# Choose the base command (host or container)
if [[ -n "$container" ]]; then
  exec_cmd="docker exec $container"
else
  exec_cmd=""
fi

# Get PHP version
php_version=$($exec_cmd php -r 'echo PHP_MAJOR_VERSION.".".PHP_MINOR_VERSION;' 2>/dev/null)
if [[ -z "$php_version" ]]; then
  echo "Error: Could not determine PHP version. Is PHP installed or accessible?"
  exit 1
fi

# Build apache2 conf.d path
conf_dir="/etc/php/$php_version/apache2/conf.d"

echo "$conf_dir"
