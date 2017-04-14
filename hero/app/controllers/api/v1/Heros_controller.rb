class Api::V1::HerosController < ApplicationController

	def index
		@heros = MyHero.all
	end

	def show
		@heros = Myhero.find_by(params[:id])
	end

	def create
		@hero = Myhero.create(name: params[:name], power: params[:power], 
							prefix: params[:prefix], suffix: params[:suffix],
							descriptor: params[:descriptor])

		render :show
	end

	def update
		@hero = Myhero.find_by(:id params[:id])
		@hero.name = params[:name]
		@hero.power = params[:power]
		@hero.save
	end

	def destroy
		@hero = Myhero.find_by(:id params[:id])
		@hero.destroy

		@hero = Myhero.all

		# #option 1
		# render :index

		#option 2
		render json: {message: "hero #{params[:id]} was successfully deleted"}
	end
end
