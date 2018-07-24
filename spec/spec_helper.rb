require "bundler/setup"
require "rest-client"

RSpec.configure do |config|
  def docker_container_port
    port_output = `docker port #{ENV["DOCKER_CONTAINER_ID"]} 80`.chomp
    port_output.split(":").last
  end

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.default_formatter = "doc" if config.files_to_run.one?

  config.add_setting :container_url, default: "127.0.0.1:#{docker_container_port}"

  config.order = :random
  Kernel.srand config.seed
end
