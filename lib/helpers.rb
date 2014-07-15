include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::LinkTo
include Nanoc3::Helpers::Blogging
include Nanoc3::Helpers::Capturing
include Nanoc3::Helpers::XMLSitemap
include Nanoc3::Helpers::Text

def news_feed_url
  '/news/feed.xml'
end

def external_link_to(text, target, attributes = {})
  attributes[:class] = build_css_class('external', attributes[:class])
  link_to text, target, attributes
end

def link_to_github(text, repository = nil, attributes = {})
  repo = if repository
    case repository
    when :editor    then '/thinreports-editor'
    when :generator then '/thinreports-generator'
    end
  end
  link_to text, "https://github.com/thinreports#{repo}", attributes
end

def link_to_discussion_group(text, attributes = {})
  attributes.update title: 'Discussion group'
  link_to text, 'https://groups.google.com/forum/#!forum/thinreports', attributes
end

def mosc_url_for(relative_path = nil)
  "http://osc.matsukei.net/#{relative_path}"
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
  link_to text, "http://sourceforge.net/projects/thinreports/files/#{extra_version || version_number}/#{fname}/download",
          title: "Download #{fname} from ThinReports Project in SourceForge.net"
end

def file_data(type)
  site_data['latest_files'][type.to_s]
end

def build_css_class(*args)
  args.compact.join(' ')
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

def em_for_future_plan
  '<em class="future-plan" title="Future Plan">Future Plan</em>'
end

def em_for_under_pre
  '<em class="under-pre" title="Comming Soon">Comming Soon</em>'
end

def colorbox_image_tag(img, caption, options = {})
  group = options.delete(:group) || 'scg'
  thumb = img.sub /(\.[a-z]+$)/, '-t\1'
  link_to %!<img src="#{thumb}" alt="#{caption}">!, img,
          {title: caption, rel: group}.merge(options)
end

def sorted_articles_for(article_type)
  article_type = article_type.to_s
  sorted_articles.select {|article| article[:article_type] == article_type }
end

def sorted_case_details
  sorted_articles_for :case
end

def sorted_news_posts
  @news_posts ||= sorted_articles_for :news
end

def latest_news
  @latest_news ||= sorted_news_posts.first
end

def summarize_news(news)
  "<span>#{attribute_to_time(news[:created_at]).strftime('%Y.%m.%d')}</span> #{news[:title]}"
end

def summarize_news_for_share(news)
  "News - #{news[:title]} | ThinReports"
end

def site_data
  @site_data ||= YAML.load_file('config/site.yml')
end

def version_data(key)
  site_data['version'][key.to_s]
end

def version_number(options = {})
  version_data options[:of] || :number
end

def version_released_at
  Date.parse(version_data(:released_at)).strftime('%Y.%m.%d')
end

def tag_attrs(attrs)
  (attrs.empty? ? '' : ' ') + attrs.map {|k,v| %!#{k}="#{v}"! }.join(' ')
end

def site_url_for(path)
  @config[:base_url] + path
end

def item_url(item)
  site_url_for(item.path)
end
