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
  @new_url = { url: params['url'] }
    if Bookmark.is_url?(params['url']) && Bookmark.unique?(params['url'])
      Bookmark.create(@new_url)
      redirect('/bookmarks')
    else
      flash[:notice_1] = "You must submit a valid URL."
      flash[:notice_2] = "URL already exists!"
      redirect('/')
    end
  end

  get '/' do
    erb :error
  end

  run! if app_file == $0
end
