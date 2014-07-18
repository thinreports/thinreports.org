module ThinreportsSite
  def site_url_for(path)
    @config[:base_url] + path
  end

  def item_url(item)
    site_url_for(item.path)
  end

  # Customize to nanoc#link_to_unless_current
  def link_to_unless_current(text, target, attributes={})
    allow_recursive = !!attributes.delete(:allow_recursive)

    # Find path
    path = target.is_a?(String) ? target : target.path

    if @item_rep && @item_rep.path =~ %r!^#{path}#{allow_recursive ? '.*' : ''}$!
      css = [attributes[:class], 'active'].compact.join(' ')
      "<span class=\"#{css}\" title=\"You're here.\">#{text}</span>"
    else
      link_to(text, target, attributes)
    end
  end

  def external_link_to(text, target, attributes = {})
    attributes[:class] = build_css_class('external', attributes[:class])
    link_to text, target, attributes
  end
end