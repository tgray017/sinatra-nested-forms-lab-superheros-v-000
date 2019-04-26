require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :team
  end
  
  get '/teams/:id' do
    @team = Team.find(params[:id])
    erb :super_hero
  end
  
  post '/teams' do
    team = Team.new(:name => params[:team][:name], :motto => params[:team][:motto])
    params[:team][:heroes].each do |hero_data|
      hero = Hero.new(hero_data)
      hero.team = team
      hero.save
    end
    
    redirect to "/teams/#{team.id}"
  end
  
end