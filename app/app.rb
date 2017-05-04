ENV['RACK_ENV'] ||="development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManagerWeb < Sinatra::Base
  enable :sessions #First, we need to enable the sessions and set the encryption key to make sure nobody can tamper with our cookies.
  set :session_secret, 'super secret'

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
     link = Link.create(title: params[:title], url: params[:url])
    params[:tags].split.each do |tag|
       link.tags << Tag.first_or_create(tag: tag)
    end
    link.save
    redirect('/links')
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    #  let's save the user id in the session after it's created
    session[:user_id] = user.id
    redirect('/links')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
# create a helper method current_user, that returns an instance of User for the currently logged-in user.

  get '/links/new' do
    erb :'links/new'
  end

  get '/tags/:tag' do
    @tag = Tag.all(:tag => params[:tag])
    @tag_links = @tag.links
    erb :'links/tags'
  end

  run! if app_file == $0

end
