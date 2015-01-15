class Term

  @@terms = []

  define_method(:initialize) do |words_array, definitions_array|
    @words_array = words_array
    @definitions_array = definitions_array
  end

  define_method(:get_words) do
    @words_array
  end

  define_method(:get_definition) do
    @definitions_array
  end

  define_singleton_method(:all) do
    @@terms
  end

  define_method(:save) do
    @@terms.push(self)
  end

  define_singleton_method(:clear) do
    @@terms = []
  end

  define_singleton_method(:delete) do |entry|
    @@terms.each() do |term|
      if term.get_words().include?(entry)
        @@terms.delete(term)
      end
    end
  end

  define_singleton_method(:search) do |entry|
    to_return = nil
    @@terms.each() do |term|
      if term.get_words().include?(entry)
        to_return = term
        break
      else
        to_return = "Ain't none of that in here; nice try Bucko!"
      end
    end
    to_return
  end


end

class Word
  define_method(:initialize) do |word, language|
    @word = word
    @language = language
  end

  define_method(:get_word) do
    @word
  end

  define_method(:get_language) do
    @language
  end
end



class Definition
  define_method(:initialize) do |definitions_array, language|
    @definitions_array = definitions_array
    @language = language
  end

  define_method(:get_definition) do
    @definition
  end

  define_method(:get_language) do
    @language
  end
end
