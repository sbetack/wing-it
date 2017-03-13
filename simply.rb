def simplify_algebraic_expression (expression)
  #Think I need to change all subtraction to addition first
  if needs_parentheses_simp(expression)
    find_inner_expression(expression)
    #simplify inside parentheses
    if has_exponent(inner_expression)
      #evaluate the exponents
    end
    if has_multiplication(inner_expression)
      #evaluate the mult
    end
    if has_division(inner_expression)
      #evaluate the div
    end
    replace_inner_expression(expression) #needs to be rewritten
    if needs_distribution(partially_simplified_expression)
      #distribute
    end
  end



  simplified_expression = add_and_sub_like_terms(partially_simplified_expression)
  return simplified_expression
end