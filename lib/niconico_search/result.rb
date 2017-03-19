# -*- frozen_string_literal: true -*-
class NiconicoSearch
  class Result
    @@names = [
      :contentId, :title, :description, :tags, :categoryTags,
      :viewCounter, :mylistCounter, :commentCounter, :startTime,
      :lastCommentTime, :lengthSeconds
    ]

    attr_accessor(*@@names)

    def initialize(hash = nil)
      hash ||= {}
      hash.each do |k, v|
        send("#{k}=", v) if respond_to? "#{k}="
      end
    end

    def to_hash
      Hash[*@@names.map { |v| [v, send(v)] }.flatten]
    end

    def inspec
      to_hash.inspect
    end
  end
end
