require 'active_support/version'

# because of major changes in ActiveSupport structure
# the require is version dependent.
if ActiveSupport::VERSION::STRING < '3.0'
  require 'active_support'
else
  require 'active_support/time'
end
