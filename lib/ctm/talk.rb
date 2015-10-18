class Talk
  attr_reader :title
  attr_reader :length

  LIGHTNING_TALK_LENGTH = 5

  def initialize(talk)
    @title, @length = *title_and_length(talk)
  end

  private

    def title_and_length(talk)
      title = talk[/.*(?=\s)/]
      str_length = talk.split.last

      if str_length.downcase == "lightning"
        length = LIGHTNING_TALK_LENGTH
      elsif str_length =~ /^(\d+)min/
        length = str_length.gsub!("min", '').to_i
      else
        fail ArgumentError, "invalid talk length"
      end

      [title, length]
    end

end
