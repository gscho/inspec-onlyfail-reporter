require 'inspec/reporters/cli'

module InspecPlugins::OnlyfailReporter
  class Reporter < Inspec.plugin(2, :reporter)
    def render
      puts 'here!'
      run_data[:profiles] = run_data[:profiles].each do |profile|
        profiles[:controls].each do |control|
          control.results.select do |result|
            result.status.eql?('failed')
          end
        end
      end
      puts run_data[:profiles].inspect
    end
    def self.run_data_schema_constraints
      "~> 0.0" # Accept any non-breaking change
    end
  end
end
