module ApplicationHelper
  def edit_path_if_can object
    link_to 'Edit', [:edit, object] if can?( :update, object)
  end
  def action_isnt_blacklisted(action, blacklist)
    !action_is_blacklisted action, blacklist
  end
  def action_is_blacklisted action, blacklist
    blacklist.present? && blacklist.include?(action  )
  end
  def sort_link_to(entity, field, label = nil)
    label ||= field.to_s.titleize
    direction = sort_field == field.to_s && sort_direction == "asc" ? "desc" : "asc"
    css_class = (field.to_s == sort_field) ? "current #{sort_direction}" : nil
    link_to label, {:sort_field => field.to_s, :sort_direction => direction}, :class => css_class
  end
end
