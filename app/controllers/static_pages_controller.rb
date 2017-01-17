class StaticPagesController < ApplicationController
  def home

    @user = current_user
  	parameters = { term: params[:term], limit: 16 }

    # render json: Yelp.client.search(‘San Francisco’, parameters)
    @response = Yelp.client.search('Philadelphia')
  end

  def about
  end

  def contact
  end

  def search

	@responses = Yelp.client.search(params[:location])
	render static_pages_home_path
  end


private




  end



end
