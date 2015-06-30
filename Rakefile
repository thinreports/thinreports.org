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

  def content_changed?
    !`git status -s`.rstrip.empty?
  end
end

namespace :site do
  desc 'Optimize PNG images in static/images'
  task :optimize_images do
    require 'image_optim'
    require 'filesize'
    require 'colorize'

    base = Pathname.new 'static/images'
    targets = Dir[ base.join('**', '*.png') ]

    status = {
      optimized: 'Optimized :'.colorize(:blue),
      skipped:   'Skipped   :'.colorize(:yellow)
    }

    optimizer = ImageOptim.new pngout: false, svgo: false
    optimizer.optimize_images!(targets) do |original, optimized|
      original_path_from_base = Pathname.new(original).relative_path_from base

      if optimized
        print status[:optimized] + " #{original_path_from_base}"
        print ' from ' + Filesize.from("#{optimized.original_size} B").pretty
        print ' to '   + Filesize.from("#{optimized.size} B").pretty
      else
        print status[:skipped] + " #{original_path_from_base}"
      end
      puts ''
    end
  end

  task :news do
    require 'date'
    require 'fileutils'

    print 'title: '

    title = STDIN.gets.strip
    raise 'Title is required!' if title.empty?

    print 'writer name (twitter account): '

    writer_name = STDIN.gets.strip
    raise 'Writer Name is required!' if writer_name.empty?

    dirname = title.dup
    dirname.downcase!
    dirname.gsub! /\./, '_'
    dirname.gsub! /\s/, '-'
    dirname.gsub! /[^a-zA-Z0-9_\-]/, ''

    entry_dir = File.join('content', 'news', "#{Date.today}-#{dirname}")
    if Dir.exists?(entry_dir)
      raise "#{entry_dir} is already exists!"
    end

    FileUtils.mkdir_p File.join(entry_dir, 'images')
    File.write(File.join(entry_dir, 'article.md'), <<-EOF)
---
id: news-post
kind: article
article_type: news

title: #{title}
written_by: #{writer_name.sub(/^@/, '')}
created_at: #{Time.now.strftime('%Y-%m-%dT%H:%M')}
---
EOF

    puts "Done! Let's edit #{File.join(entry_dir, 'article.md')}."
  end
end

desc 'Scaffold a news entry'
task news: [:'site:news']
