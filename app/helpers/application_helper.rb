module ApplicationHelper

  def add_transparant_to_navbar
    if current_page?(root_path)
      return "transparent"
    end
  end
  
end
