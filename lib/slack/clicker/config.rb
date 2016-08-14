module Slack
  module Clicker
    class Config
      attr_reader :slack_token
      def initialize
        ActiveRecord::Base.establish_connection(
          adapter:  'sqlite3',
          database: 'clicker.db',
        )

        @slack_token = ENV['SLACK_TOKEN']
      end
    end
  end
end
