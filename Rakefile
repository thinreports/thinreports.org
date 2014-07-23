# encoding: utf-8
require 'nanoc3/tasks'

# Automatic deployment to Github-Pages by TravisCI.
# [WARN] Do not manualy use!
namespace :travis do
  REPOSITORY        = 'https://$GH_TOKEN@github.com/thinreports/thinreports.github.io.git'
  GIT_AUTHOR_NAME   = 'TravisCI'
  GIT_AUTHOR_EMAIL  = 'hidakatsuya@gmail.com'

  task :deploy do
    setup
    build
    publish
  end

  def setup
    sh "git clone --quiet #{REPOSITORY} output"
  end

  def build
    sh 'bundle exec nanoc compile'
  end

  def publish
    message = `git log -n 1 --pretty=format:"%s"`.gsub("'", '')

    return if maintenance_commit?(message)

    cd 'output' do
      if content_changed?
        sh "git config --global user.name '#{GIT_AUTHOR_NAME}'"
        sh "git config --global user.email '#{GIT_AUTHOR_EMAIL}'"
        sh 'git add -A'
        sh "git commit -m '#{message}'"
        sh "git push --quiet #{REPOSITORY} master 2> /dev/null"
      end
    end
  end

  def maintenance_commit?(message)
    message =~ /\A\[maint\]/
  end

  def content_changed?
    !`git status -s`.rstrip.empty?
  end
end

namespace :site do
  task :news do
    require 'date'
    require 'fileutils'

    print 'title: '
    title = STDIN.gets.strip

    if title.empty?
      raise 'Title is required!'
    else
      title.gsub! /[^a-zA-Z0-9]/, '-'
    end

    entry_dir = File.join('content', 'news', "#{Date.today}-#{title}")
    if Dir.exists?(entry_dir)
      raise "#{entry_dir} is already exists!"
    end

    FileUtils.mkdir_p File.join(entry_dir, 'images')
    File.write(File.join(entry_dir, 'article.md'), <<-EOF)
---
id: news-post
kind: article
article_type: news

title: Summary here!
created_at: #{Time.now.strftime('%Y-%m-%dT%H:%M')}
---
EOF

    puts "Done! Let's edit #{File.join(entry_dir, 'article.md')}."
  end
end

desc 'Scaffold a news entry'
task news: [:'site:news']
