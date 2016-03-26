require 'capybara/rspec'
require 'rack'

Capybara.default_selector =  :css
Capybara.default_driver   =  :rack_test

Capybara.app = Rack::Builder.new do
  map "/" do
    use Rack::Static, :urls => [""], root: "../public"
    run lambda { |env|
      [
        200,
        {
          'Content-Type'  => 'text/html',
          'Cache-Control' => 'public, max-age=86400'
        },
        File.open('../public/index.html', File::RDONLY)
      ]
    }
  end
end.to_app
