require "http"

class WelcomeController < ApplicationController

  def index

	@qd = '{"version" : "0.1","questions": [{"question": "binHexOctDec","repeat": 5}]}'
    @seed = params[:seed] ? params[:seed] : 'abcd1234'

    @url = 'https://pa-service-prod.herokuapp.com/v1/generate'
    @responseJson = HTTP.post(@url, :json => {:type => 'json' ,:qd => ActiveSupport::JSON.decode(@qd), :seed => @seed}).to_s

  end

end
