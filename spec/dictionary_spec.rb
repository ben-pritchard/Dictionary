require('rspec')
require('dictionary')

describe(Term) do

  before() do
    Term.clear()
  end

  describe("#get_words") do
    it("returns the word of an instance of Term") do
      word_ball = Word.new("ball", "English")
      word_pelota = Word.new("pelota", "Spanish")
      definition_ball = Definition.new(["something men like to protect", "used in sports"], "English")
      term_ball = Term.new([word_ball, word_pelota], [definition_ball])
      expect(term_ball.get_words()).to(eq([word_ball, word_pelota]))
    end
  end

  describe("#get_definition") do
    it("returns the definition of an instance of Term") do
      word_fruit = Word.new("fruit", "English")
      definition_fruit = Definition.new(["a sweet delicious gift from Mother Nature", "slang for private areas"], "English")
      term_fruit = Term.new([word_fruit], [definition_fruit])
      expect(term_fruit.get_definition()).to(eq([definition_fruit]))
    end
  end

  describe(".all") do
    it("returns all the terms (words and definitions) in the dictionary - but it should be empty at first") do
      expect(Term.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves the term") do
      term_fancy = Term.new(["fancy"], ["frills and pinkies in the air", "the type of pants that snobs wear"])
      term_fancy.save()
      expect(Term.all()).to(eq([term_fancy]))
    end
  end

  describe(".clear") do
    it("clears out the class variable array that holds all the terms") do
      term_swim = Term.new(["swim"], ["to travel through water seamlessly like a beautiful fish"])
      term_silver = Term.new(["silver"], ["a shiny thing people like to steal"])
      term_swim.save()
      term_silver.save()
      Term.clear()
      expect(Term.all()).to(eq([]))
    end
  end

  describe(".delete") do
    it("deletes targeted entry") do
      term_swim = Term.new(["swim"], ["to travel through water seamlessly like a beautiful fish"])
      term_silver = Term.new(["silver"], ["a shiny thing people like to steal"])
      term_swim.save()
      term_silver.save()
      Term.delete("swim")
      expect(Term.all()).to(eq([term_silver]))
    end
  end

  describe(".search") do
    it("searches the list of terms against the word") do
      term_swim = Term.new(["swim"], ["to travel through water seamlessly like a beautiful fish"])
      term_silver = Term.new(["silver"], ["a shiny thing people like to steal"])
      term_swim.save()
      term_silver.save()
      expect(Term.search("tulip")).to(eq("Ain't none of that in here; nice try Bucko!"))
    end
  end

  describe(".search") do
    it("searches the list of terms against the word") do
      term_swim = Term.new(["swim"], ["to travel through water seamlessly like a beautiful fish"])
      term_silver = Term.new(["silver"], ["a shiny thing people like to steal"])
      term_swim.save()
      term_silver.save()
      expect(Term.search("swim")).to(eq(term_swim))
    end
  end

end

describe(Word) do
  describe("#get_word") do
    it("returns the word of an instance of Word") do
      word_ball = Word.new("ball", "English")
      expect(word_ball.get_word()).to(eq("ball"))
    end
  end

  describe("#get_language") do
    it("returns the language of an instance of Word") do
      word_ball = Word.new("ball", "English")
      expect(word_ball.get_language()).to(eq("English"))
    end
  end
end

describe(Definition) do

end
