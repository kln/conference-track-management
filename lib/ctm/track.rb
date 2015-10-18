class Track
  def quantity_needed(total_length_talks)
    total_length = Session::MORNING_LENGTH + Session::AFTERNOON_LENGTH
    (total_length_talks / total_length.to_f).ceil
  end
end