# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      def per_page
        @per_page = params[:per_page] || PER_PAGE
      end

      def with_cursor
        params[:cursor].to_i.zero? ? nil : params[:cursor]
      end
    end
  end
end
