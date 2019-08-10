# frozen_string_literal: true

module Api
  module V1
    class MacrosController < BaseController
      before_action :set_macro, only: %i[update]

      def index
        @macros = Macro.includes(:macro_category)
        render json: ::V1::MacroSerializer.new(@macros).serializable_hash
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
        @deleted = Macro.where(id: params[:ids]).destroy_all
        render json: { success: true, response: @deleted }
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
    end
  end
end
