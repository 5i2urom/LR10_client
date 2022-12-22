# frozen_string_literal: true

# operates with a sequence

class SeqController < ApplicationController
  require 'open-uri'

  include SeqHelper

  def input; end

  def show
    @seq = SeqShow.new(seq_params)
    return unless @seq.valid?
    url = URL_SERVER + "?num=#{@seq.num}&str=#{@seq.str.split.join('+')}"
    @server_respone = URI.open(url)
    @response_xml = Nokogiri::XML(URI.open(url))
    show_result(@seq.mode)
  end

  private

  def seq_params
    params.permit(:num, :str, :mode)
  end
end
