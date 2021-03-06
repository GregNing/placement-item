class CampaignsController < ApplicationController
  before_action :set_campaign, only: %i[show edit update destroy]
  before_action :load_campaigns, only: %i[index create]

  # GET /campaigns or /campaigns.json
  def index
    if turbo_frame_request?
      render partial: 'campaigns', locals: { campaigns: @campaigns }
    else
      render :index
    end
  end

  # GET /campaigns/1 or /campaigns/1.json
  def show
    @q = @campaign.items.ransack(params[:q])
    @items = @q.result.page(params[:page]).per(20)
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
  end

  # GET /campaigns/1/edit
  def edit; end

  # POST /campaigns or /campaigns.json
  def create
    @campaign = Campaign.new(campaign_params)

    respond_to do |format|
      if @campaign.save
        format.turbo_stream
        format.html { redirect_to campaigns_url, notice: 'Campaign was successfully created.' }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@campaign)}_form", partial: 'form',
                                                                                         locals: { campaign: @campaign })
        end
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaigns/1 or /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        format.html { redirect_to campaigns_url, notice: 'Campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1 or /campaigns/1.json
  def destroy
    @campaign.destroy

    respond_to do |format|
      format.html { redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def campaign_params
    params.require(:campaign).permit(:name)
  end

  def load_campaigns
    @q = Campaign.ransack(params[:q])
    page = params[:page].presence || 1
    @campaigns = @q.result.includes(:items).recent.page(page).per(20)
  end
end
