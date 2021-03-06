require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
    end

    post '/teams' do
        @team = Team.new(params[:team])
        params[:team][:members].each do |member|
            Hero.new(member)
        end

        @heroes = Hero.all

        #puts params
        #puts @team.inspect 
        #puts @heroes.inspect

        erb :team
    end

end
