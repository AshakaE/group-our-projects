# rubocop:disable Layout/BlockAlignment
# rubocop:disable Layout/LineLength
# rubocop:disable Style/RedundantInterpolation

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
    render(partial: 'layouts/nav') unless %w[Home Profile].any? name
  end

  def navlink(*)
    content = ''
    content << if logged_in?
                 "<a href='/users/ #{current_user.id}'>"
               else
                 "<a href='/'>"
               end
    content.html_safe
  end

  def show_project(project)
    content = ''
    content << if project.group
                 "<img src=' #{project.group.icon} ' alt='' class='h-20 w-20 my-auto'>"
               else
                 "<div class='my-auto h-20 w-20 border rounded-md border-gray-300'>
                  <small class='block text-center mt-5 font-bold'>no group</small>
                  </div>"
               end
    content.html_safe
  end

  def new_group
    content = ''
    content << "#{link_to new_group_path do
       'NEW GROUP'
     end}"
    content.html_safe
  end

  def new_project
    content = ''
    content << "#{link_to new_project_path do
       'NEW PROJECT'
     end}"
    content.html_safe
  end

  def show_proj_group(project)
    content = ''
    content << if project.group
                 "<img src='#{project.group.icon}' alt='' class='h-20 w-20 my-auto'>"
               else
                 "<div class='my-auto ml-2 h-28 w-28 border rounded-md border-gray-300'>
                   <small class='block text-center mt-5 font-bold'>no group</small>
                   </div>"
               end
    content.html_safe
  end

  def show_proj_name(project)
    content = ''
    if controller_name == 'groups' && action_name == 'show'
      content << "<p class='font-bold mr-3 text-md'>
                  <small class='font-medium mr-1'>
                  created by </small>  #{project.user.name} </p>"
    end
    content.html_safe
  end

  def show_icons(ico)
    content = ''
    1.upto(20) do |i|
      content << "<li class='p-4 m-1'>
                  #{ico.radio_button :icon, @icons[i]['link'], class: 'focus:ring-secondary h-4 w-4 text-secondary border-gray-300'}"
      content << "#{ico.label :icon, value: @icons[i]['link'], class: 'w-2 h-2 py-4' do
                    image_tag(@icons[i]['link'], class: 'w-14 h-14')
                  end}"
      content << '</li>'
    end
    content.html_safe
  end
end
# rubocop:enable Style/RedundantInterpolation
# rubocop:enable Layout/LineLength
# rubocop:enable Layout/BlockAlignment
