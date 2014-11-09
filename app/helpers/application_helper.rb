module ApplicationHelper
  def flash_class(level)
    case level
      when "notice" then 'blueText'
      when "success" then 'greenText'
      when "error" then 'redText'
      when "alert" then 'orangeText'
    end
  end
end
