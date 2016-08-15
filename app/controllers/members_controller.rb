class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /members
  def index
    @members = Member.all
    render json: @members
  end

  # GET /members/1
  def show
    render json: @member
  end

  # GET /members/new
  def new
    @member = Member.new
    render json: @member
  end

  # GET /members/1/edit
  def edit
    render json: @member
  end

  # POST /members
  def create
    @member = Member.new(member_params)

    if @member.save
      render json: @member
    else
      render :new
    end
  end

  # PATCH/PUT /members/1
  def update
    if @member.update(member_params)
      render json: @member
    else
      render :edit
    end
  end

  # DELETE /members/1
  def destroy
    @member.destroy
    render json: @member
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def member_params
      params.require(:member).permit(:name)
    end
end
