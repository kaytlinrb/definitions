require('rspec')
require('word')
require('definition')

describe('Word') do
  before() do
    Word.clear()
  end

  describe("#word") do
    it ("returns submitted word to user") do
      test_word = Word.new ({:word => "vapid"})
      expect(test_word.word()).to(eq("Vapid"))
    end
  end

  describe("#save") do
    it("pushes word into words array") do
      test_word = Word.new ({:word => "vapid"})
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".all") do
    it ("returns all words") do
      test_word = Word.new ({:word => "vapid"})
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".clear") do
    it ("clears words array") do
      test_word = Word.new ({:word => "vapid"})
      test_word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".find") do
    it ("returns word by using id") do
      test_word = Word.new ({:word => "vapid"})
      test_word.save()
      test_word2 = Word.new ({:word => "soothsayer"})
      test_word2.save()
      expect(Word.find(2)).to(eq(test_word2))
    end
  end

  describe ("#add_definition") do
    it ("adds a definition to a word") do
      test_word = Word.new({:word => "vapid"})
      test_definition = Definition.new({:definition => "offering nothing that is stimulating or challenging"})
      test_word.add_definition(test_definition)
      expect(test_word.definition()).to(eq([test_definition]))
    end
  end
end
