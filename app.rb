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
    @img = Image.create({
        img_url: ""
    })
     
    if params[:file]
        p params[:file][:filename]
        url = "/uploaded_images/#{@img.id}-#{params[:file][:filename]}"
		save_path = "./public"+url
		p save_path
		File.open(save_path, 'wb') do |f|
			f.write params[:file][:tempfile].read
		end
		@img.update_attribute(:img_url,url)
    end
    redirect '/'
end    


get '/:id/pick' do
    @pick = Image.find_by(params[:id])
    erb :pick
end


post '/delete/:id' do 
    Image.find(params[:id]).destroy
    redirect '/'
end

