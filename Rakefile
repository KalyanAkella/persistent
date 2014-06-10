require 'rake'

task :default => :test

task :test do
  Dir.chdir 'spec'
  sh 'rspec . --color --format doc'
end
