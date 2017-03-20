class Recipe < ActiveRecord::Base
  include HTTParty

  key_value = ENV['FOOD2FORK_KEY'] || 'e1d2bce724e6bae07124d3feada0c62a'
	hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
	base_uri "http://#{hostport}/api"
	default_params key: "#{key_value}", fields: "image_url, title, social_rank, source_url", q: "search"

  format :json

	def self.for (keyword)

    get("/search", query: { q: keyword})["recipes"]

	end
end
