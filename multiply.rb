require_relative 'add_sub_like_terms'
require_relative 'exponents'


def distribute(monomial_to_distribute, inner_expression)
  combined_and_sorted_inner_expression = add_and_sub_like_terms(inner_expression)
  inner_terms = combined_and_sorted_inner_expression.split('+')
  term_products = inner_terms.map do |monomial|
    multiply_two_monomials(monomial_to_distribute, monomial)
  end
  term_products.join("+")
end

def needs_distribution?(expression)
  expression.chars.each.with_index do |character, index|
    if (character == '(') && (expression[index-1] != '+') 
      return true
    elsif (character == ')') && (expression[index+1] != '+')
      return true 
    else
      return false 
    end
  end

end

# def find_parts_of_distribution(expression)
#   all_addition_expression = change_sub_to_add_neg(expression)
#   all_addition_expression.chars.each.with_index do |character, index|
#     if (character == "(") && (all_addition_expression[index-1]!= +)

#   if return_value == [[""""]]
#     false
#   end
# end


def multiply_two_monomials(monomial_1, monomial_2)
  coefficient_1 = get_the_coefficient(monomial_1)
  coefficient_2 = get_the_coefficient(monomial_2)
  product_coefficient = coefficient_1 * coefficient_2
  variable_1 = get_the_variable(monomial_1)
  variable_2 = get_the_variable(monomial_2)
  product_variable = multiply_two_variable_expressions(variable_1, variable_2)
  product = "#{product_coefficient}#{product_variable}"
end

def multiply_two_variable_expressions(variable_1, variable_2) 
  variable_1_hash = separate_variables_with_corresponding_exponents(variable_1)
  variable_2_hash = separate_variables_with_corresponding_exponents(variable_2)
  product_variable_hash = {}
  variable_1_hash.each do |letter, exponent|
    if variable_2_hash[letter] == nil
      product_variable_hash[letter] = exponent
    else 
      product_variable_hash[letter] = variable_2_hash[letter] + exponent
    end
  end
  variable_2_hash.each do |letter, exponent|
    if product_variable_hash[letter] == nil
      product_variable_hash[letter] = exponent
    end
  end
  product_variable_arr = product_variable_hash.sort #sort turns hash into a nested array
  product_variable = ''
  product_variable_arr.each do |letter_and_exponent|
    letter = letter_and_exponent[0]
    exponent = letter_and_exponent[1]
    if exponent != 1
      product_variable += "#{letter}^#{exponent}"
    else
      product_variable += "#{letter}"
    end
  end
  product_variable
end

def separate_variables_with_corresponding_exponents(variable_expression)
  variables_mapped_to_exponents = {}
  variable_expression.chars.each.with_index do |character, index|
    if (is_letter(character)) && (index == variable_expression.length - 1)
      variables_mapped_to_exponents[character] = 1 
    elsif is_letter(character) && (is_letter(variable_expression[index+1]))
      variables_mapped_to_exponents[character] = 1 
    elsif is_letter(character) && (variable_expression[index+1] == '^')
      variables_mapped_to_exponents[character] = variable_expression[index+2].to_i
    end
  end
  variables_mapped_to_exponents #this is a hash that maps each variable letter to it's corresponding exponent for ex: x^6yz^3 returns {'x' => 6, 'y' => 1, 'z' => 3}
end


#must call split_polynomials_on_add(expression) before this
#split polys at split on the () and then again on the +
# split polys look like this [["3x", "-2"], ["3x", "-2"], ["3x", "-2"]]
def multiply_polynomials(split_polys)
  new_first_paren = []
  split_polys[0].map! do |first_paren_term|
    new_expression = distribute(first_paren_term, split_polys[1].join('+'))
    new_first_paren.push(new_expression)
  end
  split_polys.delete_at(1)
  split_polys[0] = add_and_sub_like_terms(new_first_paren.join('+')).split('+')
  if split_polys[1] != nil
    multiply_polynomials(split_polys)
  else
    split_polys[0].reverse!
    return split_polys.join('+')
  end
end

split_polys = split_polynomials_on_add('5x+7(x-2)+(3x-2)^7+3x-7(2x+2)')
p multiply_polynomials(split_polys)
# p multiply_two_variable_expressions('a^7x^3yz', 'xyz^2')

# p separate_variables_with_corresponding_exponents('585x^2yz^7ab^3cd')

# p multiply_two_monomials('4','-6')
# p distribute('3x','-3z-6x+7y+18xy')







