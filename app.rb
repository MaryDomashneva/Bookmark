require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
require 'pg'
require 'uri'


class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    if Bookmark.create(url: params['url'])
      redirect('/bookmarks')
    else
      flash[:notice] = "You must submit a valid URL."
      redirect('/')
    end
  end

  get '/' do
    erb :error
  end

  run! if app_file == $0
end
