module Slack
  module Clicker
    class Notifier
      include Singleton
      attr_reader :config

      def self.fire
        instance.fire
      end

      def initialize
        @config = Slack::Clicker::Config.new
        Slack.configure { |config| config.token = @config.slack_token }
      end

      def fire
        count = Channel.sum(:count)

        message = {
          token: config.slack_token,
          channel: config.channel,
          text: "click count: #{count}"
        }
        puts message
        Slack.chat_postMessage message
      end
    end
  end
end
