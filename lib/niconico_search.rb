# -*- frozen_string_literal: true -*-

require "niconico_search/version"
require "niconico_search/result"
require "uri"
require "open-uri"

class ResponseError < StandardError; end

class NiconicoSearch
  def initialize(app = nil)
    @app = app
  end

  def search(query:, targets:, options: {})
    fail ArgumentError, "query is required" if query.nil?
    fail ArgumentError, "target is required" if targets.nil? || targets.length <= 0

    uri = URI.parse("http://api.search.nicovideo.jp/api/v2/snapshot/video/contents/search")
    uri.query = URI.encode_www_form(build_query(query: query, targets: targets, options: options))
    res = uri.open(header).read
    response = JSON.parse(res).deep_symbolize_keys
    fail ::ResponseError, "HTTP status error #{response[:meta][:status]}" if response[:meta][:status] != 200
    response[:data].map { |r| NiconicoSearch::Result.new(r) }
  end

  def build_query(query:, targets:, options:)
    options[:q] = query
    options[:targets] = targets.join(",")
    options = default_options.merge(options)
    options[:fields] = options[:fields].join(",")
    options
  end

  def default_options
    {
      fields: [
        :contentId,
        :title,
        :description,
        :tags,
        :viewCounter
      ],
      _sort: "-viewCounter",
      _context: @app
    }
  end

  def header
    { "User-Agent" => @app }
  end

  def parse_targets(targets)
    targets.join(",")
  end
end
