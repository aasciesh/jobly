class SearchController < ApplicationController
  def index
  	@params= params
  	@results=Vacancy.search(params)
  end
end
