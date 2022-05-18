require_relative 'point'

class Match < ActiveRecord::Base

  has_many :forecasts
  belongs_to :match_day
  belongs_to :home, class_name: "Team"
  belongs_to :away, class_name: "Team"

  before_update :calculate_points,  if: :result_or_goals_changed?

  def has_result?
    self.result != nil and self.goals_home != nil and self.goals_away != nil
  end

  def set_result(result, goals_home, goals_away)
    self.result = result 
    self.goals_home = goals_home
    self.goals_away = goals_away
  end

  def calculate_points 

    #para cada forecast asociado a ese match
    self.forecasts.each do |forecast|

      #obtiene los puntos
      forecast_points = forecast.calculate_points 
      
      #obtiene o crea un nuevo objeto de tipo Point relacionado con el player y el tournament del forecast
      point = Point.find_or_create_by(player_id: forecast.player_id, tournament_id: forecast.tournament_id)

      #si era el primer forecast de ese player en ese torneo los puntos son nulos por lo tanto se le asignan puntos por primera vez
      if point.total_points == nil 
        point.total_points = forecast_points
      else
        # si ya tenia forecasts ese player en ese torneo se acumulan
        # resta old_points por si el resultado cargado es una correccion de un resultado que ya se cargo antes
        # si no resto old_points voy a sumar los puntos de una misma prediccion varias veces
        point.total_points += forecast_points - forecast.old_points
      end
      point.save
    end
  end

  def result_or_goals_changed? 
    self.result_changed? || self.goals_home_changed? || self.goals_away_changed? 
  end
  
end