# 起動コマンド: be shotgun -p 3000

require 'sinatra/base'
require 'sinatra/reloader'
require 'sass'
require 'haml'
require 'active_record'
require 'mysql2'
require 'sinatra_more/markup_plugin'
require 'pry'

ActiveRecord::Base.configurations = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations[ENV['RACK_ENV']])

require './models/question'
require './models/question_group'

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


  # base ----------------------------
  get '/css/base.css' do
    scss :'scss/base/base'
  end

  get '/css/reset.css' do
    scss :'scss/base/reset'
  end

  # layouts --------------------------
  get '/css/top.css' do
    scss :'scss/layouts/top'
  end

  get '/css/questions.css' do
    scss :'/scss/layouts/questions'
  end

end