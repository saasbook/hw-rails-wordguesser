require 'webmock/cucumber'

Before do
  stub_request(:get, "https://randomword.saasbook.info/RandomWord.txt")
    .to_return(status: 200, headers: {}, body: "testword")
end
