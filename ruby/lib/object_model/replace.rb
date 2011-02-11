class Array
    def replace(from, to)
        each_with_index do |e, i|
            self[i] = to if e == from
        end
    end
end
