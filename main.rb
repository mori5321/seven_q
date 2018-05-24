# 起動コマンド: be shotgun -p 3000

require 'sinatra/base'
require 'sinatra/reloader'
require 'sass'
require 'haml'
require 'active_record'
require 'mysql2'
require 'sinatra_more/markup_plugin'
require 'pry'
require 'securerandom'
require 'json'

require './lib/random_number_generator'
require './lib/unique_id_setter'

ActiveRecord::Base.configurations = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations[ENV['RACK_ENV']])


require './models/question'
require './models/question_group'
require "./models/question_room"

class Server < Sinatra::Base
  register SinatraMore::MarkupPlugin

  get '/' do
    erb :index
  end

  get '/question_groups' do
    @question_groups = QuestionGroup.all
    erb :'templates/question_groups/index'
  end

  get "/question_groups/:id" do |id|
    @question_group = QuestionGroup.find(id)
    erb :'templates/question_groups/show'
  end


  # curl -X POST -d "" http://localhost:3000/question_groups/1/question_rooms
  post "/question_groups/:id/question_rooms" do |id|
    @question_room = QuestionRoom.create(question_group_id: id)
    { url: @question_room.generate_url }.to_json
  end

  get "/question_rooms/:id" do |id|
    @question_room = QuestionRoom.find_by(unique_id: id)
    @question_group = @question_room.question_group
    erb :'templates/question_rooms/show'
  end


  # base ----------------------------
  get '/css/base.css' do
    scss :'/scss/base/base'
  end

  get '/css/reset.css' do
    scss :'/scss/base/reset'
  end

  # layouts --------------------------
  get '/css/top.css' do
    scss :'/scss/layouts/top'
  end

  get '/css/questions.css' do
    scss :'/scss/layouts/questions'
  end

end