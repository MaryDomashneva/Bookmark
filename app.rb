require 'sinatra/base'

class Bookmark < Sinatra::Base
  
  get '/bookmarks' do
    bookmarks = [
              "http://makersacademy.com",
             ]
    bookmarks.join
  end


  run! if app_file == $0
end
