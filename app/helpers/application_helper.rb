module ApplicationHelper

  def generate_breadcrumbs
    html = '<ol class="breadcrumb">' +
            '<li><a href='"#{admin_path}"'><span class="fa fa-home"></span> Dashboard</a></li>' +
            '<li><a href='"#{url_for(:controller => controller_name, :action => 'index')}"'>' + controller_name.capitalize + '</a></li>' +
            '<li class="active">' + action_name.capitalize + '</li>' +
            '</ol>'

    raw(html)
  end
end
