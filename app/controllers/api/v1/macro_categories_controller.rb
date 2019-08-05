# frozen_string_literal: true

module Api::V1
  class MacroCategoriesController < BaseController
    def index
      render json: 'working fine'
    end


=begin
    def index
      if params[:type] == 'like_name'
        data = Messaging::MacroCategory.where('name LIKE ?', "%#{params[:query]}%")
      else
        @macro_categories = Messaging::MacroCategory.where(organization_id: params[:organization_id])
        data = ::V1::MacroCategorySerializer.new(@macro_categories, options).serializable_hash
      end
      render json: data
    end

    def create
      @macro_category = Messaging::MacroCategory.new(macro_category_params)
      if @macro_category.save
        render json: @macro_category, status: :created
      else
        render json: { success: false, response: @macro_category.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def macro_category_params
      params.require(:macro_category).permit(:name)
    end
=end
  end
end
