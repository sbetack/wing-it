def has_exponent(expression)
  expression.include?('^')
end


def is_simple_exponent(expression)
  i = expression.index('^')
  if expression[i-1] != ')'
    true
  else
    false
  end
end

def expand_exponential_expression(expression)
  expression = change_sub_to_add_negative(expression)
  l = expression.index('^')
  exponent = expression[l+1]
  f = l-1
  until expression[f] == '('
    f -= 1
  end
  expanded_expression = expression[f...l]*exponent.to_i
  expanded_expression
end
# this only finds the first one, so it need to be run repeatedly until there are no exponents
#this doesn't work for multi-digit exponents

def has_polynomial_multiplication(expression)
  expression.include?(")(")
end

def is_polynomial_raised_to_exponent(expression)
  expression.include?(')^')
end

def grab_poly_multiplication(expression)
  i = expression.index(')(')
  until expression[i] == '('
    i -= 1
  end
  poly_mult = expression[i..-1]
  closing_paren = poly_mult.index(')')
  until poly_mult[closing_paren+1] != '('
    #find 
    until poly_mult[closing_paren] == ')'
      closing_paren += 1
    end
    p poly_mult[0..closing_paren]
  end
  # if poly_mult[l+1..-1] != nil
  #   expression = poly_mult[l+1..-1]
  #   grab_poly_multiplication(expression)
  # else
  #   return poly_mult_array
  # end
end

p grab_poly_multiplication('2+(3x((2x(3x+2x+5-6x)+1)-4x))+8x+(3x-1)(2x+6)(x-1)+16x')

def split_exponential_expression_on_paren(expression)
  if is_polynomial_raised_to_exponent(expression)
    expanded = expand_exponential_expression(expression)
    split_expanded = expanded.split(")(")
    split_expanded[0].delete!("(")
    split_expanded[-1].delete!(")")
    return split_expanded
  elsif has_polynomial_multiplication(expression)
    i = expression.index(')(')
    until expression[i] == '('
      i -= 1
    end
    p i
    expression[i..-1]
    #get the polynomial expression that needs to be multiplied
  end

end

def split_polynomials_on_add(expression)
  split_expanded = split_exponential_expression_on_paren(expression)
  split_expanded.map { |poly| poly.split('+') }

end
#returns a nested array like this [["3x", "-2"], ["3x", "-2"], ["3x", "-2"]]


# p split_polynomials_on_add('5x+7(x-2)+(3x-2)^3+3x-7(2x+2)')

# p expand_exponential_expression('5x+7(x-2)+(3x+2)^7+3x-7(2x+2)')
# p split_expanded = expand_exponential_expression('5x+7(x-2)+(3x+2)^7+3x-7(2x+2)').split(")(")

# p split_expanded.map {|poly| poly.split('+')}
#the first one still has ( and the last one has )