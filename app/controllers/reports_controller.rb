class ReportsController < ApplicationController
  before_action :set_report, only: :show

  def index
    @reports = Report.all.order('created_at DESC')
  end
  
  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    if @report.valid?
      @report.save
      redirect_to root_path, notice: "日報「#{@report.title}」を作成しました。"
    else
      render :new
    end
  end

  def show
  end

  private

  def report_params
    params.require(:report).permit(:title, :text)
  end

  def set_report
    @report = Report.find(params[:id])
  end
end
