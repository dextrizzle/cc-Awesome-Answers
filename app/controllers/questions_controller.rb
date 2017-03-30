class QuestionsController < ApplicationController
  def new
    #we instantiate a new `question` object because it will help us in generating
    #the form in `views/new.html.erb`. We have to ake it an instance variable
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
      redirect_to question_path(@question)
    else
      render :new
      # render plain: "errors: #{question.errors.full_messages.join(', ')}"
    end
  end
  def show
    @question = Question.find params[:id]
    # render json: params
  end
  def index
    @question = Question.last(50)
  end
  def edit
    @question = Question.find params[:id]
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
    question = Question.find params[:id]
    question.destroy
    redirect_to questions_path

  end
end
