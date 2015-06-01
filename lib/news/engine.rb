require 'ckeditor'

module News
  class Engine < ::Rails::Engine
    isolate_namespace News

    config.to_prepare do
      Dir.glob(Rails.root + "app/decorators/**/*_decorator*.rb").each do |c|
        require_dependency(c)
      end
    end

    initializer "ckeditor.assets_precompile", :group => :all do |app|
      app.config.assets.precompile += Ckeditor.assets
    end

    initializer :news do
      if defined?(ActiveAdmin)
        ActiveAdmin.application.load_paths.unshift *Dir[File.dirname(__FILE__) + '/news/admin']
      end
    end
  end
end
