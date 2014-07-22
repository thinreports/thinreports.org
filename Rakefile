# encoding: utf-8
require 'nanoc3/tasks'

# Automatic deployment to Github-Pages by TravisCI
namespace :travis do
  REPOSITORY = 'https://github.com/thinreports/thinreports.github.io.git'.freeze

  task deploy: [:_setup, :_build, :_publish]

  task :_setup do
    sh "git clone --quiet #{REPOSITORY} output"
  end

  task :_build do
    sh 'bundle exec nanoc compile'
  end

  task :_publish do
    message = `git log -n 1 --pretty=format:"%s"`
    message.gsub! "'", ''

    cd 'output' do
      sh 'git add -A'
      sh "git commit -m '#{message}'"
      sh "git push --quiet #{REPOSITORY} master 2> /dev/null"
    end
  end
end
