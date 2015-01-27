module ThinreportsSite
  def twitter(account)
    link_to "@#{account}", "https://twitter.com/#{account}", class: 'twitter notranslate'
  end
  alias_method :tw, :twitter

  def link_to_changelog_for(tool, label, attributes = {})
    changelog = case tool
    when :editor    then '/blob/master/doc/CHANGELOG.md'
    when :generator then '/blob/master/CHANGELOG.md'
    end
    link_to label, "#{site_related_url['github'][tool.to_s]}#{changelog}", attributes
  end

  def link_download_mirror_file_to(text, fname, extra_version = nil)
    link_to text, "#{site_related_url['sourceforge']}/files/#{extra_version || version_number}/#{fname}/download",
            title: "Download #{fname} from ThinReports Project in Sourceforge.net"
  end

  def link_to_github(text, repository, path = nil, attributes = {})
    url  = site_related_url['github'][repository]
    url += "/#{path}" if path

    link_to text, url, attributes
  end

  def link_to_discussion_group(text, attributes = {})
    attributes.update title: 'Discussion group'
    link_to text, site_related_url['discussion_group'], attributes
  end

  def mosc_url_for(relative_path = nil)
    "#{site_related_url['matsukei_osc']}/#{relative_path}"
  end

  def project_url_for(relative_path = nil, options = {})
    project = options.delete(:project) || 'thinreports'
    mosc_url_for("projects/#{project}/#{relative_path}")
  end

  def link_project_to(text, relative_path = nil, attributes = {})
    link_to text, project_url_for(relative_path, project: attributes.delete(:project)), attributes
  end

  def link_project_wiki_to(text, relative_path = nil, attributes = {})
    relative_path.gsub! /\s/, '_'
    link_project_to text, "wiki/#{relative_path}", attributes
  end
end
