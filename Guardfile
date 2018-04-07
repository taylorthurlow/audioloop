guard 'livereload' do
  watch(%r{app/views/(.*)\//.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/(.*)\//.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{test/.+\.(js)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|scss|js|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
end

# guard :minitest, all_on_start: false, spring: 'bin/rails test', env: { 'NO_COVERAGE' => 'true' } do
#   watch(%r{^app/controllers/application_controller\.rb$}) { 'test/controllers' }
#   watch(%r{^lib/(.+)\.rb$}) { |m| "test/lib/#{m[1]}_test.rb" }
#   watch(%r{^test/.+_test\.rb$})
#   watch(%r{^test/test_helper\.rb$}) { 'test' }
#   watch(%r{^test/(.*)\/?test_(.*)\.rb$})
#   watch(%r{^lib/(.*/)?([^/]+)\.rb$}) { |m| "test/#{m[1]}test_#{m[2]}.rb" }

#   # Rails 4
#   watch(%r{^app/controllers/(.+)\.rb}) { |m| "test/controllers/#{m[1]}_test.rb" }
#   watch(%r{^app/services/(.+)\.rb}) { |m| "test/services/#{m[1]}_test.rb" }
#   watch(%r{^app/jobs/(.+)\.rb}) { |m| "test/jobs/#{m[1]}_test.rb" }
#   watch(%r{^app/views/(.+)\.rb}) { |m| "test/controllers/#{m[1]}_test.rb" }
#   watch(%r{^app/models/(.+)\.rb}) { |m| "test/models/#{m[1]}_test.rb" }
# end

guard :rspec, all_on_start: false, cmd: 'NO_COVERAGE=true bundle exec rspec' do
  watch('spec/spec_helper.rb')                        { 'spec' }
  watch('config/routes.rb')                           { 'spec/routing' }
  watch('app/controllers/application_controller.rb')  { 'spec/controllers' }
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$})          { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }

  # Rails 4
  watch(%r{^app/controllers/(.+)\.rb})                { |m| "test/controllers/#{m[1]}_test.rb" }
  watch(%r{^app/services/(.+)\.rb})                   { |m| "test/services/#{m[1]}_test.rb" }
  watch(%r{^app/jobs/(.+)\.rb})                       { |m| "test/jobs/#{m[1]}_test.rb" }
  watch(%r{^app/views/(.+)\.rb})                      { |m| "test/controllers/#{m[1]}_test.rb" }
  watch(%r{^app/models/(.+)\.rb})                     { |m| "test/models/#{m[1]}_test.rb" }
end
