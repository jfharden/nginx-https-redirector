describe docker_container(id: ENV["DOCKER_CONTAINER_ID"]) do
  it { should exist }
  it { should be_running }
  its("id") { should_not eq "" }
  its("image") { should eq "nginx-https-redirector:tests" }
  its("command") { should eq "nginx -g 'daemon off;'" }
  its("ports") { should eq "80/tcp" }
end
