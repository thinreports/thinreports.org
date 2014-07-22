# encoding: utf-8
require 'nanoc3/tasks'

namespace :site do
  desc 'Build site'
  task :build do
    sh 'bundle exec nanoc compile'
  end

  desc 'Preparation for auto-deployment by TravisCI'
  task :setup do
  end

  desc 'Publish built site to thinreports.github.io by TravisCI'
  task :publish do
  end
end