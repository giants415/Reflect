module PostsHelper

  def wordCount_formatter(counter_token_frequency)
    output = []
    word_freq_array = counter_token_frequency
    word_freq_array.each_with_index do |word_block,index|
      word_hash = {}
      word_hash["text"] = word_block[0].to_s
      word_hash["weight"] = word_block[1].to_i
      output << word_hash
    end
    output
  end

end
