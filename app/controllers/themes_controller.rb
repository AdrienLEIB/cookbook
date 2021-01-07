class ThemesController < ApplicationController
before_action :set_theme, only: [:show]

  def index
    @themes = Theme.all
  end

  def show
    @figurines = ScraperService.new(@theme.name).call
    TestJob.perform_later
  end

  def new
    @themes = Theme.new
  end

  def create
    @theme = Theme.new(theme_params)
    if @theme.save
      redirect_to theme_path(@theme)
    else
      render 'new'
    end
  end

  private

  def set_theme
    @theme = Theme.find(params[:id])
  end

  def theme_params
    params.require(:theme).permit(:name)
  end
end