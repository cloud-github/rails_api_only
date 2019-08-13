# frozen_string_literal: true

module Api
  module V1
    class MacroCategoriesController < BaseController
      def index
        if params[:type] == 'get_name'
          data = MacroCategory.find(params[:query])
        elsif params[:type] == 'like_name'
          data = MacroCategory.where('name LIKE ?', "%#{params[:query]}%")
        else
          data = ::V1::MacroCategorySerializer.new(@macro_categories).serializable_hash
        end

        render json: data
      end

      def create
        @macro_category = MacroCategory.new(macro_category_params)
        if @macro_category.save
          render json: @macro_category, status: :created
        else
          render json: { success: false, response: @macro_category.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def macro_category_params
        params.require(:macro_category).permit(:name)
      end
    end
  end
end
