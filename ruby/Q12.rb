# @param {Integer} num
# @return {String}
def int_to_roman(num)
    order = {"I"=>1, "V" =>5, "X" =>10, "L" => 50, "C" =>100, "D" =>500, "M" =>1000}
    s = ""
    while num>=1000 do s = s +"M"; num -=1000; end;
    while num>=900 do s = s + "CM"; num -= 900; end;
    while num>=500 do s = s + "D"; num -= 500; end;
    while num>=400 do s = s + "CD"; num -= 400; end;
    while num>=100 do s = s + "C"; num -= 100; end;
    while num>=90 do s = s + "XC"; num -= 90; end;
    while num>=50 do s = s + "L"; num -= 50; end;
    while num>=40 do s = s + "XL"; num-=40; end;
    while num>=10 do s = s + "X"; num-=10; end;
    while num>=9 do s = s + "IX"; num-=9; end;
    while num>=5 do s = s + "V"; num-=5; end;
    while num>=4 do s = s + "IV"; num -=4; end;
    while num>=1 do s = s + "I"; num-=1; end;
    return s
end