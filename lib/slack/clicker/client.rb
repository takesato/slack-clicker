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

        @client.on :message do |data|
          if data['type'] == 'message' && data['subtype'].nil? && !data['text'].nil?
            channel = Channel.find_or_initialize_by(channel_id: data['channel'])
            channel.count = @channel.count.to_i + 1
            channel.save
          end
        end
      end

      def start
        @client.start
      end
    end
  end
end
