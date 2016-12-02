require 'dingding/version'
require 'forwardable'
require 'dry-configurable'
require 'httparty'

require 'dingding/core_ext'
require 'dingding/exceptions'
require 'dingding/client'

module Dingding
  extend Dry::Configurable

  API_URL = 'https://oapi.dingtalk.com'.freeze

  setting :corp_id, nil
  setting :corp_secret, nil
  setting :debug, false

  autoload :Http, 'dingding/http'
  autoload :Chat, 'dingding/api/chat'

  class << self
    extend Forwardable

    attr_reader :client

    def_delegators :client, :token
    def_delegators :client, :request_uri
    def_delegators :client, :request_for

    def client
      @client ||= Dingding::Client.new
    end
  end
end
