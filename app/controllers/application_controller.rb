require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipe' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipe/new' do
    erb :new_recipe
  end

  post '/recipe' do
    recipe = Recipe.create(params)
    redirect "/recipe/#{recipe.id}"
  end

  get '/recipe/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show_recipe
  end

  get '/recipe/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit_recipe
  end

  patch "/recipe/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipe/#{@recipe.id}"
  end

  delete "/recipe/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect "/recipe"
  end

end
