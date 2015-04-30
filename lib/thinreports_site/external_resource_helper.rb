module ThinreportsSite
  module ExternalResourceHelper
    def twitter(account)
      link_to "@#{account}", "https://twitter.com/#{account}", class: 'twitter notranslate'
    end
    alias_method :tw, :twitter

    def link_to_related_url(url_name, label, attributes = {})
      link_to label, site_related_url[url_name.to_s], attributes
    end

    def link_to_changelog_for(tool, label, attributes = {})
      changelog = case tool
      when :editor
        'https://github.com/thinreports/thinreports-editor/blob/master/doc/CHANGELOG.md'
      when :generator
        'https://github.com/thinreports/thinreports-generator/blob/master/CHANGELOG.md'
      end
      link_to label, changelog, attributes
    end
  end
end
