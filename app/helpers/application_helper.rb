module ApplicationHelper
  def show_alive
    if flash[:alert]
      render(partial: 'shared/alert')
    elsif flash[:notice]
      render(partial: 'shared/notice')
    elsif flash[:warning]
      render(partial: 'shared/warning')
    end
  end

  def show_errors(inst)
    content = ''
    if inst.errors.any?
      inst.errors.full_messages.each do |m|
        content << "<div class='bg-red-100 text-red-900 px-5 py-3 rounded-md mp:mx-3 text-center'>
                      <div>#{m}</div>
                    </div>"
      end
    end
    content.html_safe
  end

  def navbar(name) 
    unless name == 'Home' || name == 'Profile' 
      render(partial: 'layouts/nav')
    end 
  end
end
