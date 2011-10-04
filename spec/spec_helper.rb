$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'bitly_api'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

API_KEY = 'R_b2f34e27c82c120f4d1790b7710e02fd'
LOGIN   = 'bwmdomains'

Spec::Runner.configure do |config|

  Bitly.configure do |c|
    c.login    = LOGIN
    c.api_key  = API_KEY
  end

end


