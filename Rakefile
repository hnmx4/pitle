require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.libs << "lib"
  t.test_files = FileList["test/test_*"]
end

desc "Run Tests"
task :default => :test
