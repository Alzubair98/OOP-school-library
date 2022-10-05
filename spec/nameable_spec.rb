require_relative '../nameable'
require_relative '../person_class.rb'

describe Nameable do
    context "Checks the Nameable class" do
        it "checks for correct name" do
            correct = Nameable.new
            expect{ correct.correct_name }.to raise_error(NotImplementedError)
        end
    end
end

describe BaseDecorator do
    context "Checks the BaseDecorator class" do
        it "checks for create an object" do
            base = BaseDecorator.new('Ruby')
            expect(base.nameable).to eq('Ruby')
        end
    end
end

describe CapitalizeDecorator do

    $person = Person.new(24, 'alzubairalqaraghuli')

    context "Checks the CapitalizeDecorator class" do
        it "checks for create an object" do
            correct = CapitalizeDecorator.new($person)
            expect(correct.correct_name).to eq("Alzubairalqaraghuli")
        end
    end

    context "check the trimmer method" do
        it "trim the name" do
            trimmer = TrimmerDecorator.new($person)
            expect(trimmer.correct_name).to eq('alzubairal')
        end
    end
end