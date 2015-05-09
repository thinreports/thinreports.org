require 'pathname'

include Nanoc::Helpers::Rendering
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::Capturing
include Nanoc::Helpers::XMLSitemap
include Nanoc::Helpers::Text

Dir[Pathname.pwd.join('lib', 'thinreports_site', '*.rb')].each {|f| require f }

include ThinreportsSite::ArticleHelper
include ThinreportsSite::ExternalResourceHelper
include ThinreportsSite::LinkHelper
include ThinreportsSite::TagHelper
include ThinreportsSite::VersionHelper

def site_data
  @site_data ||= YAML.load_file('config/site.yml')
end

def site_title
  site_data['title']
end

def site_related_url
  site_data['related_url']
end

def news_feed_path
  '/news/feed.xml'
end
