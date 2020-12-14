def isValid(string)
    str_arr = string.split('')

    # converting array into hash
    str_hash = str_arr.inject({}) {  |acc , str| acc.has_key?(str) ? acc[str] = acc[str] + 1 : acc[str] = 1 ;  acc  }

    # getting max value
    min_value =  str_hash.min_by{| k , v | v }.pop

    
    flag = true 
    index = 0
    str_hash.each do | k , v |
        if min_value == v  
            next
        elsif min_value + 1 == v && index == 0 
            index += 1
        elsif min_value+ 1 <  v  
            flag = false
            break
        else 
            flag = false
            break
        end
    end

    
    if flag 
        return 'YES'
    else 
        return 'NO'
    end
end

string = 'abcccabdeed'

p isValid(string)

