class WordGuesserGame
  attr_accessor :word, :guesses, :wrong_guesses

  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  def guess(letter)
    raise ArgumentError if letter.nil? || letter !~ /\A[a-zA-Z]\Z/i # match single letter,ignoring case

    letter = letter[0].downcase
    if @word.include?(letter) && @guesses.exclude?(letter)
      @guesses += letter
    elsif @word.exclude?(letter) && @wrong_guesses.exclude?(letter)
      @wrong_guesses += letter
    else
      false
    end
  end

  def word_with_guesses
    @word.gsub(/./) { |letter| @guesses.include?(letter) ? letter : '-' }
  end

  def check_win_or_lose
    return :play if @word.blank?

    if word_with_guesses == @word
      :win
    elsif @wrong_guesses.length > 6
      :lose
    else
      :play
    end
  end

  # Get a word from remote "random word" service

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://randomword.saasbook.info/RandomWord')
    Net::HTTP.post_form(uri, {}).body
  end
end
