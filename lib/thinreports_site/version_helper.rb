module ThinreportsSite
  module VersionHelper
    def version_config(key)
      site_data['version'][key.to_s]
    end

    def version_number(of: nil)
      version_config of || :number
    end

    def version_released_at
      Date.parse(version_config(:released_at)).strftime('%Y.%m.%d')
    end
  end
end
