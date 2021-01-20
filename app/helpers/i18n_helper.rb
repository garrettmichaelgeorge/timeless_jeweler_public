module I18nHelper
  def pundit_error_message_for(exception)
    t error_message_path(exception), scope: 'pundit', default: :default
  end

  private

  def error_message_path(exception)
    "#{policy_name_from(exception)}.#{query_from(exception)}"
  end

  def policy_name_from(exception)
    exception.policy.class.to_s.underscore
  end

  def query_from(exception)
    exception.query
  end
end
