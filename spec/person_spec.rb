require_relative '../person_class.rb'

describe Person do
    context "check person class" do
        it "create new person" do
            person = Person.new(24, 'lucas')
            expect(person.age).to eq(24)
            expect(person.name).to eq('lucas')
            
            #test the methods
            services = person.can_use_services?
            expect(services).to be true

            correct_name = person.correct_name
            expect(correct_name).to eq(person.name)

        end
    end
    
end
