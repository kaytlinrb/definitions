require('rspec')
require('definition')
require('word')

describe('Definition') do
  before() do
    Definition.clear()
  end

  describe("#definition") do
    it ("returns submitted definition to user") do
      test_definition = Definition.new ({:definition => "offering nothing that is stimulating or challenging"})
      expect(test_definition.definition()).to(eq("offering nothing that is stimulating or challenging"))
    end
  end

  describe("#save") do
    it("pushes definition into definitions array") do
      test_definition = Definition.new ({:definition => "offering nothing that is stimulating or challenging"})
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
    end
  end

  describe(".all") do
    it ("returns all words") do
      test_definition = Definition.new ({:definition => "offering nothing that is stimulating or challenging"})
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
    end
  end

  describe(".clear") do
    it ("clears words array") do
      test_definition = Definition.new ({:definition => "offering nothing that is stimulating or challenging"})
      test_definition.save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end

  describe(".find") do
    it ("returns definition by using id") do
      test_definition = Definition.new ({:definition => "offering nothing that is stimulating or challenging"})
      test_definition.save()
      expect(Definition.find(1)).to(eq(test_definition))
    end
  end
end
