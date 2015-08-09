class SearchController < ApplicationController
  include SearchHelper

  def index
    @search_query = params[:search]
    terms = define_search_terms(@search_query)
    @charities = search_charity_names(terms)
    @categories = search_charity_categories(terms)
  end
end
