class GameController < ApplicationController

  before_action :get_game_from_session
  after_action  :store_game_in_session
  
  def new
  end

  def create
    word = params[:word] || WordGuesserGame.get_random_word
    @game = WordGuesserGame.new(word)
    redirect_to game_path
  end

  def show
    status = @game.check_win_or_lose
    redirect_to win_game_path if status == :win
    redirect_to lose_game_path if status == :lose
  end

  def guess
    letter = params[:guess]
    begin
      if ! @game.guess(letter[0])
        flash[:message] = "You have already used that letter." 
      end
    rescue ArgumentError
      flash[:message] = "Invalid guess."
    end
    redirect_to game_path
  end

  def win
    redirect_to game_path unless @game.check_win_or_lose == :win
  end
  
  def lose
    redirect_to game_path unless @game.check_win_or_lose == :lose
  end

  private
  
  def get_game_from_session
    @game = WordGuesserGame.new('')
    if !session[:game].blank?
      @game = YAML.load(session[:game])
    end
  end

  def store_game_in_session
    session[:game] = @game.to_yaml
  end
end
