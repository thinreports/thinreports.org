module ThinreportsSite
  module TagHelper
    def tag_attrs(attrs)
      (attrs.empty? ? '' : ' ') + attrs.map {|k,v| %!#{k}="#{v}"! }.join(' ')
    end

    def build_css_class(*args)
      args.compact.join(' ')
    end

    def em_tag(type:, label:)
      "<em#{tag_attrs(class: type.to_s + ' notranslate', title: label)}>#{label}</em>"
    end

    def since(version)
      em_tag type: :since, label: "Since #{version}"
    end

    def colorbox_image_tag(img, caption, options = {})
      group = options.delete(:group) || 'scg'
      thumb = img.sub /(\.[a-z]+$)/, '-t\1'
      link_to %!<img src="#{thumb}" alt="#{caption}">!, img,
              {title: caption, rel: group}.merge(options)
    end
  end
end
