class AnswersController < ApplicationController

  skip_before_filter  :verify_authenticity_token

  def index
    #recordar que este lleva a la ventana con index en el view de answers
  end

  def create
    description = params[:answer_description]
    question_id = params[:question_id]
    answer = Answer.create(description: description, users_id: session[:id], questions_id: question_id)
    redirect_to questions_path
  end

  def upvote
    @question_id = params[:q_id]
    question =  Question.find(@question_id)
    votes = question.votes + 1
    question.update(votes: votes)
    @total_votes = question.votes
  end

end
