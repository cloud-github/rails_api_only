# frozen_string_literal: true

module Api
  module V1
    class MacrosController < BaseController
      before_action :set_macro, only: %i[update]

      def index
        @macros = Macro.includes(:macro_category).before(with_cursor).limit(per_page)
        render json: ::V1::MacroSerializer.new(@macros, index_options).serializable_hash
      end

      def create
        @macro = Macro.new(macro_params)
        if @macro.save
          render json: ::V1::MacroSerializer.new(@macro, options).serializable_hash
        else
          render json: { success: false, response: @macro.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @macro.update(macro_params)
          render json: ::V1::MacroSerializer.new(@macro, options).serializable_hash
        else
          render json: @macro.errors, status: :unprocessable_entity
        end
      end

      def destroy
        Macro.where(id: params[:ids]).destroy_all
        render json: { success: true, response: 'Removed Successfully' }
      rescue StandardError => e
        render json: { success: false, response: e }, status: :unprocessable_entity
      end

      private

      def set_macro
        @macro = Macro.where(id: params[:id])
      end

      def options(associations = %i[macro_category])
        {
          include: associations
        }
      end

      def macro_params
        params.require(:macro).permit(
          :name,
          :body,
          :subject,
          :macro_type,
          :macro_category_id,
        ).tap do |p|
          p[:body] = nil if p[:macro_type] == 'sms'
        end
      end

      def index_options
        options.merge!(meta: { cursor: @macros.cursor_before })
      end
    end
  end
end