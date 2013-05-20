# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'livereload' do
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html))).*}) { |m| "/assets/#{m[3]}" }
end

guard 'minitest', zeus: true do
  watch(%r|^test\/(.*)\/?(.*)_spec\.rb|)
  watch(%r|^test\/spec_helper\.rb|)      { "test" }
  watch(%r|factories.rb|)                { "test" }
  
  # Rails
  watch(%r|^app\/models\/(.*)\.rb|)      { |m| "test/unit/#{m[1]}_spec.rb"}
  watch(%r|^app\/workers\/(.*)\.rb|)      { |m| "test/workers/#{m[1]}_spec.rb"}
  watch(%r|^app\/controllers\/(.*)\.rb|) { |m| "test/functional/#{m[1]}_spec.rb" }
  watch(%r|^app\/helpers\/(.*)\.rb|)     { |m| "test/helpers/#{m[1]}_spec.rb" }
  watch(%r|^lib\/(.*)\/(.*).rb|)         { |m| "test/lib/#{m[1]}/#{m[2]}_spec.rb" }
end

guard 'bundler' do
  watch('Gemfile')
  # Uncomment next line if Gemfile contain `gemspec' command
  # watch(/^.+\.gemspec/)
end

guard 'annotate' do
  watch( 'db/schema.rb' )

  # Uncomment the following line if you also want to run annotate anytime
  # a model file changes
  #watch( 'app/models/**/*.rb' )

  # Uncomment the following line if you are running routes annotation
  # with the ":routes => true" option
  #watch( 'config/routes.rb' )
end

guard 'annotate' do
  watch( 'db/schema.rb' )
end

# guard 'spork', :test_unit => false, :minitest => true, :minitest_env => { 'RAILS_ENV' => 'test' }, :bundler => true do
#   watch('config/application.rb')
#   watch('config/environment.rb')
#   watch('config/environments/test.rb')
#   watch(%r{^config/initializers/.+\.rb$})
#   watch('Gemfile')
#   watch('Gemfile.lock')
#   watch('spec/spec_helper.rb') { :rspec }
#   watch('test/test_helper.rb') { :test_unit }
#   watch(%r{features/support/}) { :cucumber }
# end
