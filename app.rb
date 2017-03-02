require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require 'sinatra/json'
require './image_uploader.rb'
require './models.rb'

get '/' do
    @contents = Image.order('id desc').all
    erb :index
end

post '/new' do
    Image.create({
        img_url: ""
    })
    
    if params[:file]
        image_upload(params[:file])
    end
    
    redirect '/'
end    

post '/delete/:id' do 
    Image.find(params[:id]).destroy
    redirect '/'
end