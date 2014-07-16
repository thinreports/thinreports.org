include Nanoc::Helpers::Rendering
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::Capturing
include Nanoc::Helpers::XMLSitemap
include Nanoc::Helpers::Text

module ThinreportsSite
  def site_data
    @site_data ||= YAML.load_file('config/site.yml')
  end

  def site_related_url
    site_data['related_url']
  end

  def news_feed_path
    '/news/feed.xml'
  end
end

$:.unshift File.expand_path(File.dirname(__FILE__) + '/thinreports_site')

require 'version_helper'
require 'article_helper'
require 'external_resource_helper'
require 'link_helper'
require 'tag_helper'

include ThinreportsSite