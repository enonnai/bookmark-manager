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
    tag = Tag.create(tag: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/tag/:tag' do
    @tag = Tag.first(params[:tag])
    @tag_links = @tag.links
    erb :'links/tag'
  end

  run! if app_file == $0

end
