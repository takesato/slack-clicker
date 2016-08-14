module Slack
  module Clicker
    class Client
      include Singleton
      attr_reader :client, :config

      def self.start
        instance.start
      end

      def self.client
        instance.client
      end

      def initialize
        @config = Slack::Clicker::Config.new
        Slack.configure {|config| config.token = @config.slack_token }
        @client = Slack.realtime
      end

      def start
        @client.start
      end
    end
  end
end
