require 'rspec'
require_relative '../lib/github.rb'

# describe GHFeed::RepoInfo do
#   describe '.get_repo_data' do
#     context "when parameters are passed in" do
#       it "returns an array of the commits for a given repo" do
#         matchsetter_json = 
#         expect(GHFeed::RepoInfo.get_repo_data("clamstew", "matchsetter")).to eq(matchsetter_json)
#       end
#     end

#     context "when no parameters are passed in" do
#       it "returns an array of the commits for the Rails repo" do
#         expect(GHFeed::RepoInfo.get_repo_data).to eq()
#       end
#     end
#   end
# end

describe GHFeed::UserInfo do
  describe ".gravatar_url" do
    it "returns the url to the user's corresponding gravatar image" do
      expect(GHFeed::UserInfo.gravatar_url("clamstew")).to eq("https://secure.gravatar.com/avatar/4160d85e44344f10d06edf3f2b9ee97c")
    end
  end
end
