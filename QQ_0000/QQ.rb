class QQ
    def run(n)
        for i in 1..n
            for j in 1..n
                puts i.to_s + "x" + j.to_s + "=" + (i*j).to_s
            end
        end
    end
end

QQ.new.run(9)
