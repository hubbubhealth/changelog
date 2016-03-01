require 'sinatra'
require 'sprockets'
require 'sprockets-helpers'
require 'rdiscount'


class Web < Sinatra::Base
  set :environment, ENV['RACK_ENV'] || :development
  set :assets, Sprockets::Environment.new(root)
  set :markdown, layout_engine: :erb

  configure do
    assets.append_path File.join(root, 'assets', 'stylesheets')
    assets.append_path File.join(root, 'assets', 'javascripts')

    Sprockets::Helpers.configure do |config|
      config.environment = assets
      config.prefix      = '/assets'
      config.digest      = true
    end
  end

  helpers do
    include Sprockets::Helpers
  end

  get '/' do
    markdown :changelog
  end

end
