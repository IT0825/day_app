class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:show, :edit]
  before_action :metastasis_index, except: [:index, :show, :destroy]

  def index
    if admin_signed_in?
      @reports = Report.includes(:user).order("created_at DESC")
    elsif user_signed_in?
      @reports = current_user.reports.order('created_at DESC')
    else
      redirect_to new_user_session_path
    end
  end
  
  def new
    @report = Report.new
  end

  def confirm
    @report = Report.new(report_params)
    render :new unless @report.valid?
  end

  def create
    @report = Report.new(report_params)
    if params[:back] || !@report.save
      render :new and return
    else
      redirect_to root_path, notice: "日報「#{@report.title}」を作成しました。"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @report.update(report_params)
      redirect_to root_path, notice: "日報「#{@report.title}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    report = Report.find(params[:id])
    report.destroy
    redirect_to root_path, notice: "日報「#{report.title}」を削除しました。"
  end

  private

  def report_params
    params.require(:report).permit(:title, :text).merge(user_id: current_user.id)
  end

  def set_report
    @report = Report.find(params[:id])
  end
  
  def move_to_index
    if user_signed_in?
      redirect_to root_path if current_user.id != @report.user.id
    elsif admin_signed_in?
    else
      redirect_to root_path
    end
  end

  def metastasis_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end