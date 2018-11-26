module ApplicationHelper

  def title
    content_tag(:title, @title || "Reclaim Dinner: Making your dinner planning easier and faster")
  end

  def profile_form(args = {})
    class_insert = "turn-on-toggle" if args[:exist]
    return "<td class='profile-personalization-parameter-column'>#{args[:name].capitalize}: <\/td> \
            <td class='profile-personalization-button-column'><div class='profile-toggle-form-off'>#{args[:off]}<\/div> \
              <div class='toggle-button-frame '> \
                <input type='hidden' value='#{args[:name]}' name='name'> \
                <input type='hidden' value='#{args[:model]}' name='model'> \
                <input type='hidden' value='#{args[:exist]}' name='exist'> \
                <input type='hidden' value='#{args[:user_id]}' name='user_id'> \
                <input type='hidden' value='#{args[:object]}' name='object'> \
                <button class='toggle-button-button #{class_insert}' onclick=\"this.classList.toggle('turn-on-toggle');\" type='submit'> \
                </button> \
              </div><div class='profile-toggle-form-on'>#{args[:on]}<\/div> \
              <\/td>"
  end
end
