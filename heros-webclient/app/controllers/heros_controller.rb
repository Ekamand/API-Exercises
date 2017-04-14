class HerosController < ApplicationController

		def index

			@heros = Hero.all
		end
		

	  def show
    @id = params[:id]
    @hero = Hero.find(@id)
    hero_hash = Unirest.get("http://localhost:3000/api/v2/heros/#{@id}.json").body
    @hero = Hero.new(hero_hash)
  end

  def new

  end

  def create
		@hero =  Hero.create(params[:name], params[:power], params[:prefix], params[:suffix],
		params[:descriptor] }).body

	 redirect_to "/heros/#{@hero['id']}"
  end

  def edit 
  	@hero_id = params[:id]
	@heros = Unirest.get("http://localhost:3000/api/v2/heros/#{@hero_id}.json").body
  end

  def update

  		@hero = Hero.create(params[:name], params[:power], params[:prefix], params[:suffix],
		params[:descriptor] }).body

	 redirect_to "/heros/#{@hero['id']}"
  end 

  def destroy
  	# Unirest.delete("http://localhost:3000/api/v2/heros/#{params[:id]}", 
  	# 	:headers => { "Accept" => "application/json" })
  	 @hero = Hero.find(params)
  	redirect_to "/heros"
  end
end
