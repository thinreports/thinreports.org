module ThinreportsSite
  module TagHelper
    def tag_attrs(attrs)
      (attrs.empty? ? '' : ' ') + attrs.map {|k,v| %!#{k}="#{v}"! }.join(' ')
    end

    def build_css_class(*args)
      args.compact.join(' ')
    end

    def since(version)
      label = "Since #{version}"
      "<em#{tag_attrs(class: 'since' + ' notranslate', title: label)}>#{label}</em>"
    end
  end
end
