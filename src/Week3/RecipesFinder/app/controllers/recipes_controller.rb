class RecipesController < ApplicationController
  def index
    @search_term = params[:search] || 'chocolate'
    if @search_term == "mocha"
      @searcha = "Kahlúa-Spiked"
    else
      @searcha = "#{@search_term}"
    end
    @recipe = Recipe.for(@search_term)
  end
end

