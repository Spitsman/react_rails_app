class RequestDecorator < Draper::Decorator

  delegate_all

  def display_users
    source.users.decorate.collect(&:display_name).join(', ')
  end

  def display_answered
    source.answered? ? '✓' : '-'
  end

  def display_amount
    h.number_to_currency source.amount
  end

  end