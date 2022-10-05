require_relative '../book.rb'

describe Book do
    context "create new book object from book class" do
        it "Create book" do
            book = Book.new('book1', 'auth1')
            title = book.title
            author = book.author
            expect(title).to eq("book1")
            expect(author).to eq("auth1")
        end
    end
end
