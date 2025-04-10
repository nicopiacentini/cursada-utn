puts -4.abs

class especializadorDeString
    def especializar(string)
        string.squeeze(" ").gsub(" ", "-").downcase
    end
end
