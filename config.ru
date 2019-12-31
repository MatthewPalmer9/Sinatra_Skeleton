require './config/environment'

# Rack::MethodOverride must be placed above ALL controllers
# to maintain access to the middleware's functionality.
use Rack::MethodOverride

#controller(s)
run ApplicationController
