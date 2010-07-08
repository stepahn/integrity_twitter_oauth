require 'pathname'

begin
  require "twitter"
rescue LoadError
  abort "install twitter gem"
end

module Integrity
  class Notifier
    class Twitter < Notifier::Base
      attr_reader :config
      def self.to_haml
        @haml ||= File.read(Pathname.new(__FILE__).dirname.join("twitter.haml"))
      end

      def deliver!
        client.update("#{build.commit.author.name} | #{build.project.name}: #{short_message}")
      end

      private
      def client
        @client ||= ::Twitter::Base.new(authorize)
      end

      def authorize
        oauth = ::Twitter::OAuth.new(config['consumer_token'], config['consumer_secret'])
        oauth.authorize_from_access(config['access_token'], config['access_secret'])
        oauth
      end

    end
    register Twitter
  end
end

