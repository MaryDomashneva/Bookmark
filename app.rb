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
    is_valid_url = Bookmark.is_url?(params['url'])
    is_unique_url = Bookmark.unique?(params['url'])
    if is_valid_url && is_unique_url
      Bookmark.create(url: params['url'], title: params['title'])
      redirect('/bookmarks')
    else
      flash[:notice] = "You must submit a valid URL." unless is_valid_url
      flash[:notice] = "URL already exists!" unless is_unique_url
      redirect('/')
    end
  end

  get '/' do
    erb :error
  end

  run! if app_file == $0
end
