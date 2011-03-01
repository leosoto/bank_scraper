require 'ephemeral_response'

RSpec.configure do |config|

  config.before(:suite) do
    EphemeralResponse.activate
  end

  config.after(:suite) do
    EphemeralResponse.deactivate
  end
end