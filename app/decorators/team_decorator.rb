class TeamDecorator < Draper::Decorator

  def display_favorite
    source.favorite ? '✓' : '–'
  end

end
