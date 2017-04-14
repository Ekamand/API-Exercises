class Hero

	attr_accessor :name, :power, :prefix, :suffix, :descriptor

	def initialize(hero_params)
		@name = hero_params["name"]
		@power = hero_params["power"]
		@prefix = hero_params["prefix"]
		@suffix = hero_params["suffix"]
		@descriptor = hero_params["descriptor"]
	end

	#instance Method
	#@hero.allcaps_name
	def capitalized_name
		return @name.upcase
	end

	#Class method
	def self.find(id)
		hero_hash = Unirest.get("http://localhost:3000/api/v2/heros/#{id}.json").body
		hero = Hero.new(hero_hash)
		return hero
	end

	def self.all
		heros_api_array = Unirest.get("http://localhost:3000/api/v2/heros.json").body
		# heros = Unirest.get("http://localhost:3000/api/v2/heros.json").body

		@heros = []

		heros_api_array.each do |hero_hash| 
			@heros << Hero.new(hero_hash)
		end
		return @heros
	end

	def self.create(name, power, prefix, suffix, descriptor)

		@hero = Unirest.post("http://localhost:3000/api/v2/heros.json", :headers => { "Accept" => "application/json" },
		:parameters => { :name => name, :power => power, :prefix => prefix, :suffix => suffix,
		:descriptor => descriptor }).body

	end

	def self.update(id, name, power, prefix, suffix, descriptor)

	end

	def destroy
		  	Unirest.delete("http://localhost:3000/api/v2/heros/#{id}", 
  		:headers => { "Accept" => "application/json" })
  	
	end




end