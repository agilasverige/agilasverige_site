# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'livereload' do
  watch(%r{app/views/.+\.(rb)})
  watch(%r{app/widgets/.+\.(rb)})
  watch(%r{(public/|app/assets).+\.(css|js|html)})
  watch(%r{(app/assets/.+\.css)\.scss}) { |m| m[1] }
  watch(%r{(app/assets/.+\.js)\.coffee}) { |m| m[1] }
  watch(%r{config/locales/.+\.yml})
end

guard 'rspec', :version => 2, all_on_start: false do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('spec/spec_helper.rb')                        { "spec" }
  watch('config/routes.rb')                           { "spec/routing" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }
  # Capybara request specs
end

guard 'cucumber', cli: '--profile guard' do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$})          { 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
end

# Run JS and CoffeeScript files in a typical Rails 3.1 fashion, placing Underscore templates in app/views/*.jst
# Your spec files end with _spec.{js,coffee}.

spec_location = "spec/javascripts/%s_spec"

# uncomment if you use NerdCapsSpec.js
# spec_location = "spec/javascripts/%sSpec"
