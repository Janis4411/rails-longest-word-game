require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = (('A'..'Z').to_a).shuffle.first(10)
  end

  def score
    user_value = params[:user_input]
    url = open("https://wagon-dictionary.herokuapp.com/#{user_value}").read
    @result = JSON.parse(url)
   @given_word = @result["word"]
   @error = @result["error"]
   @found = @result["found"]
   @length = @result["length"]
  end
end
