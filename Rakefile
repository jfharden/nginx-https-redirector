require "rspec/core/rake_task"

task default: %i[inspec spec]

def with_docker_container(docker_options = "")
  container_id = `docker run -d #{docker_options} --rm nginx-https-redirector:tests`.chomp

  begin
    yield container_id
  ensure
    sh("docker kill #{container_id}")
  end
end

desc "Run the specs."
task :spec do
  with_docker_container("-p 80") do |container_id|
    sh("DOCKER_CONTAINER_ID=#{container_id} bin/rspec spec/")
  end
end

desc "Run inspec tests"
task :inspec do
  with_docker_container do |container_id|
    sh("DOCKER_CONTAINER_ID=#{container_id} bin/inspec exec --no-distinct-exit inspec/docker")
  end
end
