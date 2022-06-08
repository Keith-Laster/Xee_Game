module Console

    def self.request
        answer = gets.chomp.downcase
        if answer == "exit" do
           break
        end
answer
    end
end