def simplify_algebraic_expression (expression)
  if needs_parentheses_simp(expression)
    partially_simplified_expression = add_and_sub_like_terms(partially_simplified_expression)
  end
  if needs_distribution (partially_simplified_expression)
  end
  
  simplified_expression = add_and_sub_like_terms(partially_simplified_expression)
  return simplified_expression
end