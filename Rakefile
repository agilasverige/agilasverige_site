begin
  require 'vlad'
  Vlad.load :scm => 'git', :app => 'thin'
rescue LoadError
  # do nothing
end

require 'spec/rake/spectask' 
Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ["--color"] 
end 
  

