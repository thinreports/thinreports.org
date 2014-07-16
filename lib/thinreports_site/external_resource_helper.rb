module ThinreportsSite
  def document_name(name, lang)
    lang == :en ? "En_#{name}" : name
  end

  def link_document_to_lang(lang, name)
    link_project_to lang.to_s, "wiki/#{document_name(name, lang)}", class: "doc doc-#{lang}"
  end

  def link_download_file_to(text, fid, fname, attributes = {})
    link_to text, mosc_url_for("attachments/download/#{fid}/#{fname}"),
            attributes.merge(title: fname)
  end

  def link_download_mirror_file_to(text, fname, extra_version = nil)
    link_to text, "#{site_related_url['sourceforge']}/files/#{extra_version || version_number}/#{fname}/download",
            title: "Download #{fname} from ThinReports Project in Sourceforge.net"
  end

  def link_to_github(text, repository = nil, attributes = {})
    type = case repository
    when :editor    then 'editor'
    when :generator then 'generator'
    when nil        then 'top'
    end
    link_to text, site_related_url['github'][type], attributes
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

  def project_wiki_url_for(relative_path = nil, options = {})
    project_url_for("wiki/#{relative_path}", options)
  end

  def link_news_to(text, news_id, attributes = {})
    link_to text, mosc_url_for("news/#{news_id}"), attributes
  end

  def link_project_to(text, relative_path = nil, attributes = {})
    attributes[:class] ||= 'external'
    link_to text, project_url_for(relative_path, project: attributes.delete(:project)), attributes
  end

  def link_project_wiki_to(text, relative_path = nil, attributes = {})
    relative_path.gsub! /\s/, '_'
    link_project_to text, "wiki/#{relative_path}", attributes
  end

  def link_document_to(text, name, default_lang: :en, attrs: {})
    name.gsub! /\s/, '_'
    ''.tap {|html|
      html << link_project_wiki_to(text, document_name(name, default_lang), class: 'navigate')
      html << '<span class="doc">'
      html << link_document_to_lang(:ja, name)
      html << link_document_to_lang(:en, name)
      html << '</span>'
    }
  end
end