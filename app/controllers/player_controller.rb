require 'sinatra/reloader' if Sinatra::Base.environment == :development
require 'logger'
require "sinatra/activerecord"

require_relative '../models/player'

class PlayerController < Sinatra::Base 

  configure :production, :development do
    enable :logging
    logger = Logger.new(STDOUT)
    logger.level = Logger::DEBUG if development?
    set :logger, logger
  end

  configure :development do
    register Sinatra::Reloader
    after_reload do
      puts 'Reloaded...'
    end
  end

  configure do 
    set :views, 'app/views/register'
    set :public_folder, 'public'
  end

  get '/players' do
    logger.info(Player.all)
  end

  post '/players' do 
    name = params['name']
    email = params['email']
    password = params['password']
    p = Player.new
    p.name = name 
    p.email = email 
    p.password = password
    p.save
    redirect '/players'
  end

end