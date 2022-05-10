require 'sinatra/base'
require 'bundler/setup'
require 'sinatra/reloader' if Sinatra::Base.environment == :development
require 'logger'
require "sinatra/activerecord"

require_relative './player_controller'
require_relative '../models/init'

class App < Sinatra::Application

  use PlayerController

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
    set :views, 'app/views'
    set :public_folder, 'public'
  end

  def initialize(app = nil)
    super()
  end

  get '/' do
    logger.info(123)
    erb :index
  end

  get '/register' do 
    erb :register
  end
end