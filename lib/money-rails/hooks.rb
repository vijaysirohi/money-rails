module MoneyRails
  class Hooks
    def self.init
      # For Active Record
      ActiveSupport.on_load(:active_record) do
        require 'money-rails/active_record/monetizable'
        ::ActiveRecord::Base.send :include, MoneyRails::ActiveRecord::Monetizable
      end

      # For Mongoid
      begin; require 'mongoid'; rescue LoadError; end
      if defined? ::Mongoid
        if ::Mongoid::VERSION =~ /^2(.*)/
          # Mongoid 2.x stuff here
        end

        if ::Mongoid::VERSION =~ /^3(.*)/
          # Mongoid 3.x stuff here
        end
      end

      # For ActionView
      ActiveSupport.on_load(:action_view) do
        require 'money-rails/helpers/action_view_extension'
        ::ActionView::Base.send :include, MoneyRails::ActionViewExtension
      end
    end
  end
end
