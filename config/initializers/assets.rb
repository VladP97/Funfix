# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( jquery.ui.widget.js )
Rails.application.config.assets.precompile += %w( jquery.iframe-transport.js )
Rails.application.config.assets.precompile += %w( jquery.fileupload.js )
Rails.application.config.assets.precompile += %w( jquery.cloudinary.js )
Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( read_chapters_show.js )
Rails.application.config.assets.precompile += %w( read_fanfics_index.js )
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
