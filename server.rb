# required gem includes
require 'sinatra'
require 'json'

# require file includes
require_relative 'lib/github'

set :bind, '0.0.0.0' # Vagrant fix
set :port, 9797

get '/' do
  "Hey, this is a web app"
end

# first test route to confirm it is when I hard code the method
get '/test' do
	"#{GHFeed::RepoInfo.get_repo_data("clamstew", "matchsetter")}"
end

# second test route for passing in a username and repo from the params hash
get '/test/repo/:username/:reponame' do
	"#{GHFeed::RepoInfo.get_repo_data(params[:username].to_s, params[:reponame].to_s)}"
end

# route with a layout
get '/feed/:username/:reponame' do
  @user_info = {}
	@commits_hash = GHFeed::RepoInfo.get_repo_data(params[:username].to_s, params[:reponame].to_s)
	erb :feed
end

# CLIENT_ID = ENV['GH_BASIC_CLIENT_ID']
# CLIENT_SECRET = ENV['GH_BASIC_SECRET_ID']
get '/callback' do
  # get temporary GitHub code...
  session_code = request.env['rack.request.query_hash']['code']
  # ... and POST it back to GitHub
  result = RestClient.post('https://github.com/login/oauth/access_token',
                          {:client_id => CLIENT_ID,
                           :client_secret => CLIENT_SECRET,
                           :code => session_code},
                           :accept => :json)
  # extract the token and granted scopes
  access_token = JSON.parse(result)['access_token']
end