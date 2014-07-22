# encoding: utf-8
require 'nanoc3/tasks'

# Automatic deployment to Github-Pages by TravisCI
namespace :travis do
  REPOSITORY = 'https://$GH_TOKEN@github.com/thinreports/thinreports.github.io.git'
  GIT_AUTHOR_NAME = 'TravisCI'
  GIT_AUTHOR_EMAIL = 'hidakatsuya@gmail.com'

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
      sh "git config --global user.name #{GIT_AUTHOR_NAME}"
      sh "git config --global user.email #{GIT_AUTHOR_EMAIL}"
      sh 'git add -A'
      sh "git commit -m '#{message}'"
      sh "git push --quiet #{REPOSITORY} master 2> /dev/null"
    end
  end
end
