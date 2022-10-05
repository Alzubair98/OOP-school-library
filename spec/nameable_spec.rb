require_relative '../nameable'

describe Nameable do
    context "Checks the Nameable class" do
        it "checks for correct name" do
            correct = Nameable.new
            correct.correct_name
            expect(correct).to raise_error(NotImplementedError: "Implement!!") 
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
    context "Checks the CapitalizeDecorator class" do
        it "checks for create an object" do
            correct = CapitalizeDecorator.new
            correct.correct_name
            # expect(correct).to eq(.....) Alzubair 
        end
    end
end