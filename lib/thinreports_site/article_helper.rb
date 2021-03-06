module ThinreportsSite
  module ArticleHelper
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

    def summarize_news(news, plain: false)
      summary = "<span>#{attribute_to_time(news[:created_at]).strftime('%Y.%m.%d')}</span> #{news[:title]}"
      plain ? strip_html(summary) : summary
    end

    def summarize_news_for_share(news)
      "News - #{news[:title]} | Thinreports"
    end
  end
end
