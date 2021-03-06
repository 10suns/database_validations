require 'active_record/railtie'

module DatabaseValidations
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'database_validations/tasks/database_validations.rake'

      Rake.application.in_namespace(:db) do |namespace|
        namespace.tasks.each do |task|
          task.enhance %w[database_validations:skip_db_uniqueness_validator_index_check]
        end
      end
    end
  end
end
