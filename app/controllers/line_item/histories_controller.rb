class LineItem::HistoriesController < ApplicationController
  before_action :set_line_item, only: %i[index]

  # GET /line_item/histories or /line_item/histories.json
  def index
    @histories = @item.history
  end

  private

  def set_line_item
    @item = LineItem.find(params[:line_item_id])
  end
end
