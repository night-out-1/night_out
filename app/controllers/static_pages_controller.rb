class StaticPagesController < ApplicationController
  def home
  	parameters = { term: params[:term], limit: 16 }

    # render json: Yelp.client.search(‘San Francisco’, parameters)
    @response = Yelp.client.search('Philadelphia')
  end

  def about
  end

  def contact
  end

  def search


  end


end
