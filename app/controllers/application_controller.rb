require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :team
  end
  
  post '/teams' do
    team = Team.new(:name => params[:team][:name], :motto => params[:team][:motto])
    params[:team][:heroes].each do |hero_data|
      hero = Hero.new(hero_data)
      hero.team = team
      hero.save
    end
    binding.pry
    erb :super_hero
  end
  
  get '/teams/:id'
  
  end

end
