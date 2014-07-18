module ThinreportsSite
  def version_data(key)
    site_data['version'][key.to_s]
  end

  def version_number(options = {})
    version_data options[:of] || :number
  end

  def version_released_at
    Date.parse(version_data(:released_at)).strftime('%Y.%m.%d')
  end

  def file_data(type, extra_key = nil)
    files = site_data['latest_files'][type.to_s]
    extra_key ? files[extra_key.to_s] : files
  end
end