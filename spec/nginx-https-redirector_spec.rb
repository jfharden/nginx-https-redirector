RSpec.describe "webservice" do
  let(:url) { "#{RSpec.configuration.container_url}#{resource}" }
  let(:url_without_port) { "#{RSpec.configuration.container_url.split(':').first}#{resource}" }

  def response
    RestClient::Request.execute(method: :get, url: "http://#{url}", max_redirects: 0)
  rescue RestClient::ExceptionWithResponse => err
    err.response
  end

  shared_examples :it_redirects_to_https do
    it { expect(response.code).to eq(301) }

    it "should redirect to https" do
      expect(response.headers).to include(location: "https://#{url_without_port}")
    end
  end

  describe "/" do
    let(:resource) { "/" }

    it_behaves_like :it_redirects_to_https
  end

  describe "/style.css?with=params" do
    let(:resource) { "/style.css?with=params" }

    it_behaves_like :it_redirects_to_https
  end
end
