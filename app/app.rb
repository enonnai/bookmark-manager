ENV['RACK_ENV'] ||="development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManagerWeb < Sinatra::Base

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

  get '/links/new' do
    erb :'links/new'
  end

  get '/tag/:tag' do
    @tag = Tag.all(:tag => params[:tag])
    @tag_links = @tag.links
    erb :'links/tag'
  end

  run! if app_file == $0

end
