# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Seqs', type: :request do

  describe 'different sides' do
    let(:num_params) { 3 }
    let(:str_params) { '5 6 5' }

    it 'returns result in html' do
      get show_path, params: { num: num_params, str: str_params, mode: 'html' }
      expect(response.content_type).to eq('text/html; charset=utf-8')
    end

    it 'returns result in xml' do
      get show_path, params: { num: num_params, str: str_params, mode: 'xml' }
      expect(response.content_type).to eq('application/xml; charset=utf-8')
    end
  end
end
