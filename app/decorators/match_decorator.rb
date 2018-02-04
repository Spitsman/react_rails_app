class MatchDecorator < Draper::Decorator

  def display_date
    source.date.strftime('%d.%m.%Y')
  end

end
