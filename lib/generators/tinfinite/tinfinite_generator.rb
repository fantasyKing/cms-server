class TinfiniteGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def db_name
    params = file_name.split('_', 2)
    params[0]
  end

  def model_name
    params = file_name.split('_', 2)
    params[1]
  end

  def create_controller_file
    template "controller/controller_template.erb", ["app/controllers/db_#{db_name}/#{model_name.pluralize}_controller.rb"]
  end
end
