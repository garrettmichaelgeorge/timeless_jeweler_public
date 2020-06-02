module ApplicationHelper
  def flash_class(level)
    case level.to_sym
    when :notice then "alert alert-success alert-dismissable fade show"
    when :success then "alert alert-success alert-dismissable fade show"
    when :error then "alert alert-danger alert-dismissable fade show"
    when :alert then "alert alert-danger alert-dismissable fade show"
    end
  end

  def flash_icon(level)
    case level.to_sym
    when :notice then "fe fe-alert-circle"
    when :success then "fe fe-check-square"
    when :error then "fe fe-alert-triangle"
    when :alert then "fe fe-alert-octagon"
    end
  end
end
