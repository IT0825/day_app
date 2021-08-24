class ReportsController < ApplicationController

  def index
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

  private

  def report_params
    params.require(:report).permit(:title, :text)
  end
end
