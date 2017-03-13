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
  expression[f...l]*exponent.to_i
end
# this only finds the first one, so it need to be run repeatedly until there are no exponents
#this doesn't work for multi-digit exponents

def split_exponential_expression_on_paren(expression)
  expanded = expand_exponential_expression(expression)
  split_expanded = expanded.split(")(")
  split_expanded[0].delete!("(")
  split_expanded[-1].delete!(")")
  split_expanded
end

def split_polynomials_on_add(expression)
  split_expanded = split_exponential_expression_on_paren(expression)
  split_expanded.map { |poly| poly.split('+') }

end
#returns a nested array like this [["3x", "-2"], ["3x", "-2"], ["3x", "-2"]]

p split_exponential_expression_on_paren('5x+7(x-2)+(3x-2)^7+3x-7(2x+2)')
p split_polynomials_on_add('5x+7(x-2)+(3x-2)^3+3x-7(2x+2)')

# p expand_exponential_expression('5x+7(x-2)+(3x+2)^7+3x-7(2x+2)')
# p split_expanded = expand_exponential_expression('5x+7(x-2)+(3x+2)^7+3x-7(2x+2)').split(")(")

# p split_expanded.map {|poly| poly.split('+')}
#the first one still has ( and the last one has )