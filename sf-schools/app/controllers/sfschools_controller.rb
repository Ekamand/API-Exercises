class SfschoolsController < ApplicationController

	def index 
		@sfschools = Unirest.get("https://data.sfgov.org/resource/mmsr-vumy.json").body
	end

end
