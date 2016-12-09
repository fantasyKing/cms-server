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

  def db_name_camel
    params = file_name.split('_', 2)
    StringCases.snake_to_camel(params[0])
  end

  def model_name_camel
    params = file_name.split('_', 2)
    name = params[1]
    StringCases.snake_to_camel(name)
  end

  def all_instance_name
    file_name.to_s
  end

  def instance_name
    params = file_name.split('_', 2)
    params[1]
  end

  def grid_name
    StringCases.snake_to_camel(file_name)
  end

  # def create_controller_file
  #   template "controller/controller_template.erb", "app/controllers/db_#{db_name}/#{model_name.pluralize}_controller.rb"
  # end

  # def create_grid_file
  #   template "grid/grid_template.erb", "app/grids/#{file_name}_grid.rb"
  # end

  # def create_model_file
  #   template "model/model_template.erb", "app/models/#{file_name}.rb"
  # end

  def create_view_file
    template "view/_actions.html.erb", "app/views/db_#{db_name}/#{model_name.pluralize}/_actions.html.erb"
    template "view/_form.html.erb", "app/views/db_#{db_name}/#{model_name.pluralize}/_form.html.erb"
    template "view/edit.html.erb", "app/views/db_#{db_name}/#{model_name.pluralize}/edit.html.erb"
    template "view/index.html.erb", "app/views/db_#{db_name}/#{model_name.pluralize}/index.html.erb"
    template "view/new.html.erb", "app/views/db_#{db_name}/#{model_name.pluralize}/new.html.erb"
    template "view/show.html.erb", "app/views/db_#{db_name}/#{model_name.pluralize}/show.html.erb"
  end
end
