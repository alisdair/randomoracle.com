configure :development do
  activate :livereload
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

configure :build do
  activate :minify_html
  activate :minify_css
  activate :asset_hash do |opts|
    opts.exts += %w(.ico)
  end
  activate :gzip
end

after_configuration do
  sprockets.append_path File.join root, 'bower_components'
end

activate :deploy do |deploy|
  deploy.method = :rsync
  deploy.user   = 'deploy'
  deploy.host   = 'riker.randomoracle.com'
  deploy.path   = 'randomoracle.com'
  deploy.build_before = true
  deploy.clean  = true
end
