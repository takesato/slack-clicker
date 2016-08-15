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

        fields = Channel.where('count > 0').map(&:to_field)
        attachments = [
          {
            fields: fields,
            color: "#36a64f",
            footer: "slack clicker"
          }
        ]
        message = {
          token: config.slack_token,
          channel: config.channel,
          text: "総クリック?数 #{count}",
          attachments: attachments.to_json
        }
        puts message
        Slack.chat_postMessage message
      end
    end
  end
end
