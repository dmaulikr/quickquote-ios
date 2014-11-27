require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
t.cucumber_opts = "features --format junit --out reports"
end

Cucumber::Rake::Task.new(:junit) do |t|
t.cucumber_opts = "features --format junit --out reports"
end
