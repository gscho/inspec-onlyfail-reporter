require 'inspec-onlyfail-reporter/version'


module InspecPlugins
  module OnlyfailReporter
    class Plugin < ::Inspec.plugin(2)
      plugin_name :'inspec-onlyfail-reporter'

      reporter :onlyfail do
        require "inspec-onlyfail-reporter/reporter"
        InspecPlugins::OnlyfailReporter::Reporter
      end
    end
  end
end
