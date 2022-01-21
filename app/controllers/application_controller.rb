class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # get '/games' do
  #   # get all the games from the database
  #   games = Game.all
  #   # return a JSON response with an array of all the game data
  #   games.to_json
  # end

  # get '/games/:id' do
  #   game = Game.find(params[:id])

  #   # include associated reviews in the JSON response
  #   game.to_json(include: { reviews: { include: :user } })
  # end

  
  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    # get all the bakeries from the database
    bakery = Bakery.find(params[:id])
    # send them back as a JSON array
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.all.order(price: :desc)
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    exp_baked_good = BakedGood.all.order(price: :desc).first
    exp_baked_good.to_json
  end


end
