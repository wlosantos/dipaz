Rails.application.configure do
  config.generators do |g|
    g.orm :active_record, migration: true
    g.test_framework :rspec,
                     view_specs: false,
                     model_specs: false,
                     helper_specs: false,
                     routing_specs: false,
                     request_specs: false,
                     fixtures: false
    g.helper false
    g.jbuilder false
    g.assets false
    g.template_engine :slim
    g.controller assets: false
  end
end