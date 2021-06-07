#!/bin/bash
set -e
rm -f /app/tmp/pids/server.pid
rake db:migrate db:seed
exec "$@"
