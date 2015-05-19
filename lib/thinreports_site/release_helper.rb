module ThinreportsSite
  module ReleaseHelper
    def editor_release
      site_data['editor']
    end

    def generator_release
      site_data['generator']
    end

    def current_version
      site_data['version']
    end

    def formatted_release_date(date_string)
      Date.parse(date_string).strftime('%Y.%m.%d')
    end
  end
end
