class ResultsController < ApplicationController
  def index
  end

  def new
    @result = Result.new
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
    @prizes = Prize.where(questionnaire_id: @questionnaire.id)
    # redirect_to questionnaire_results_path(@questionnaire.id)
  end

  def create

    @result = Result.new
    @result.questionnaire_id = params[:questionnaire_id]
    @result.prize_id = params[:result][:result]
    @result.profile_id = current_profile.id
    # @result = Result.find(params[:result_id])
    @result.save!

    filthy_var = Questionnaire.find(params[:questionnaire_id]).questions.first.id

    redirect_to question_intro_path(filthy_var)
  end

  def edit
    @result = Result.find(params[:id])
    @result.status = 1
    @result.save!
  end

  def update
    # @result.save!
  end

  private

  def prize_params
    params.require(:questionnaire).permit(:prize_id, :result)
  end
end
