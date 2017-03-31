class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :edit, :update, :destroy]
  def new
    #we instantiate a new `question` object because it will help us in generating
    #the form in `views/new.html.erb`. We have to make it an instance variable
    #so we can access it in the view file
    @question = Question.new
  end
  def create
    #the line below is what's called Strong Parameters feature that was added
    #to rails starting with version 4 to help developers be more explicit about
    #the parameters that they want to allow the user to submit

    question_params = params.require(:question).permit([:title,:body])
    question = Question.new question_params
    # Rails.logger.info '>>>>>>>>>>>>>>'
    # Rails.logger.info question.errors.full_messages
    # Rails.logger.info '>>>>>>>>>>>>>>'
    @question = Question.new question_params
    if @question.save
      # render plain: 'question created successfully'

      # rails gives us access to `flash` object which looks like a Hash. flash
      # utilizes cookies to store a bit of information that we can access in the
      # next request. Flash will automatically be deleted when it's displayed.
      flash[:notice] = "question created!"
      redirect_to question_path(@question)
    else
      flash.now[:alert] = 'Please fix errors below'
      render :new
      # render plain: "errors: #{question.errors.full_messages.join(', ')}"
    end
  end

  def show
  end

  def index
    @question = Question.last(50)
  end

  def edit
  end

  def update
    @question = Question.find params[:id]
    question_params = params.require(:question).permit([:title, :body])
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      render :edit
    end
  end
  def destroy
    question.destroy
    redirect_to questions_path

  end
  def find_question
    @question = Question.find params[:id]
  end

  def question_params
    # the line below is what's called "Strong Parameters" feautre that was added
    # to Rails starting with version 4 to help developer be more explicit about
    # the parameters that they want to allow the user to submit
    params.require(:question).permit([:title, :body])
  end

end
