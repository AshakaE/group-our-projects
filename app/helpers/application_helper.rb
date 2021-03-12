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
    render(partial: 'layouts/nav') unless name == 'Home' || name == 'Profile'
  end

  def show_project(project)
    content = ''
    if project.group
      content << "<img src=' #{project.group.icon} ' alt='' class='h-20 w-20 my-auto'>"
    else 
      content << "<div class='my-auto h-20 w-20 border rounded-md border-gray-300'>
                  <small class='block text-center mt-5 font-bold'>no group</small>
                  </div>"
    end
    content.html_safe
  end
end
