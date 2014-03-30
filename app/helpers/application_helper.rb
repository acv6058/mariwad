module ApplicationHelper

  def generate_breadcrumbs
    html = '<ol class="breadcrumb">' +
            '<li><a href='"#{admin_path}"'><span class="fa fa-home"></span> Dashboard</a></li>' +
            '<li><a href='"#{url_for(:controller => controller_name, :action => 'index')}"'>' + controller_name.capitalize + '</a></li>' +
            '<li class="active">' + action_name.capitalize + '</li>' +
            '</ol>'

    raw(html)
  end



  def build_navs
    a = content_tag :ul, id: 'main_nav', class: 'nav navbar-nav navbar-left' do
      sections
    end
    a
  end

  def sections
    sections = Page.sections
    sections.collect {|section| concat(content_tag(:li, children(section), class: (section.has_child? ? 'dropdown':'')))}
  end

  def children(section)
    elem = ''
    if section.has_child?
      elem += link_to ("#{section.page_title} <b class='caret'></b>").html_safe, section.page_url, class: 'dropdown-toggle', 'data-toggle' => 'dropdown'
      elem += '<ul class="dropdown-menu">'
      section.pages.active.in_menu.each do |p|
      elem += content_tag(:li, link_to(p.page_title, p.page_url, title: p.page_title))
      end
      elem += '</ul>'
      elem.html_safe
    else
      link_to section.page_title, section.page_url
    end
  end

  def sub_pages(section)
    pages = section.pages


  end

end
