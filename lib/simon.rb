class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []

  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    sleep(5)
    system('clear')
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    seq.each {|color| print color + " "}
    print "\n"
  end

  def require_sequence
    p "Now it's your turn!"
    user_seq = gets.chomp.split
    @game_over = true if user_seq != seq
  end

  def add_random_color

    sequence_length.times {seq.push(COLORS.sample)}

  end

  def round_success_message
    p "Moving on to next method"
  end

  def game_over_message
    p "Game over!"
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end
end

# simon = Simon.new
# simon.play
