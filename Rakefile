require 'opal'
require 'opal-jquery'

desc "Build our app to app.js"
task :build do
  Opal.append_path "."
  File.binwrite "app.js", Opal::Builder.build("app").to_s
end

task :default => [:build]
