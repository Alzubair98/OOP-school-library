require_relative '../person_class.rb'

describe Person do
    context "check person class" do
        person = Person.new(24, 'lucas')

        it "create new person" do
            expect(person.age).to eq(24)
            expect(person.name).to eq('lucas')
        end

        it "check the method" do
            services = person.can_use_services?
            expect(services).to be true

            correct_name = person.correct_name
            expect(correct_name).to eq(person.name)
        end
    end
    
end
