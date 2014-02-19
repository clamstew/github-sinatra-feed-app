require "json"
require 'unirest'
require 'pry'

module GHFeed
  class RepoInfo

    def self.get_repo_data(username = "rails", reponame = "rails")
      # for psuedo api calls
      # https://gist.github.com/clamstew/9097429/raw/a510b4a660d6212bc38cfa26fc6ebcc03d62ad6a/gh_api_dump.json
      response = Unirest::get "https://gist.github.com/clamstew/9097429/raw/a510b4a660d6212bc38cfa26fc6ebcc03d62ad6a/gh_api_dump.json"
      # response = Unirest::get "https://api.github.com/repos/#{username}/#{reponame}/commits"
      web_json_hash = response.body
    end

    def self.get_user_info(username = "rails")
      response = Unirest::get "https://api.github.com/users/#{username}"
      response.body
    end
  end

  class UserInfo
    def self.gravatar_url(username = "rails")
      user = RepoInfo.get_user_info(username)
      "https://secure.gravatar.com/avatar/#{user["gravatar_id"]}"
    end
  end

  # class Auth
  #   # in case we need add auth
  #   # good guide with sinatra here: http://developer.github.com/guides/basics-of-authentication/
  #   def authenticated?
  #     session[:access_token]
  #   end

  #   def authenticate!
  #     erb :index, :locals => {:client_id => CLIENT_ID}
  #   end
  # end
end
