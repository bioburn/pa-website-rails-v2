require "http"
require 'securerandom'

class WelcomeController < ApplicationController

  def index

	  @qd = '{"version" : "0.1","questions": [{"question": "mc-change-of-base","repeat": 5}]}'
    @random = SecureRandom.hex(4)
    @seed = params[:seed] ? params[:seed] : @random

    @url = 'https://pa-service-prod.herokuapp.com/v1/generate'
    @responseJson = HTTP.post(@url, :json => {:type => 'json' ,:qd => ActiveSupport::JSON.decode(@qd), :seed => @seed}).to_s

    @check = 'https://pa-service-prod.herokuapp.com/v1/check?type=seed&value=' + @seed
    @checkSeed = HTTP.get(@check).to_s #, :json => {:value => @seed}).to_s
  end

end
