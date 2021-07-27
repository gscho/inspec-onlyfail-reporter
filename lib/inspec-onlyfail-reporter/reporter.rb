require 'inspec/reporters/cli'

module InspecPlugins::OnlyfailReporter
  class Reporter < Inspec.plugin(2, :reporter)
    def render
      run_data[:profiles].each do |profile|
        profile[:controls].select! do |control|
          control[:results].any? { |res| res.status.eql?('failed') }
        end
      end
      config = {}
      config[:run_data] = run_data
      output(Inspec::Reporters::CLI.new(config).render)
    end

    def self.run_data_schema_constraints
      '~> 0.0'
    end
  end
end
