require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module GraduationApplication
  class Application < Rails::Application
    config.load_defaults 6.0
    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.generators do |g|
      g.assets false 
      g.helper false 
      g.jbuilder false
      g.test_framework :rspec,
                  model_specs: true,
                  view_specs: false,
                  helper_specs: false,
                  routing_specs: false,
                  controller_specs: false,
                  request_specs: false
    end
    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      if instance.kind_of?(ActionView::Helpers::Tags::Label)
        html_tag.html_safe
      else
        "<div class=\"has-error\">#{html_tag}<span class=\"help-block\">#{instance.error_message.first}</span></div>".html_safe
      end
    end
  end
end
