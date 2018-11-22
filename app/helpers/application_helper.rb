module ApplicationHelper

  def title
    content_tag(:title, @title || "Reclaim Dinner: Making your dinner planning easier and faster")
  end

  def toggle_form(args = {})
    return "<!--<form class='profile-toggle-form ' action='\#' method=' name='>--> \
              <td class='profile-personalization-parameter-column'>#{args[:type].capitalize}: <\/td><td><span class='profile-toggle-form-off'>off<\/span>
              <div class='toggle-button-frame'> \
                <input type='hidden' value='#{args[:value]}' name='#{args[:type]}'> \
                <input type='hidden' value='#{args[:user_id].id}' name='user_id'> \
                <button class='toggle-button-button ' onclick=\"this.classList.toggle('turn-on-toggle');\" type='submit'> \
                </button> \
              </div><span class='profile-toggle-form-on'>on<\/span><\/td> \
            </form>"
  end





end
