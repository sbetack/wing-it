=begin 
change all plus signs to adding a negative
slice between + and ( and check to see what it is
slice between ) and + and check to see what it is
slice between parens
split on the plus
multiple all inner terms by the outer term
=end
require_relative 'add_sub_like_terms'
# require_relative 'multiply'

# def find_inner_expression(expression)
#   get_parentheses_expression = /\(.*\)/
#   inside_paren = expression[get_parentheses_expression] 
#   if inside_paren != nil
#     chopped_paren = inside_paren[1...-1]
#     return find_inner_expression(chopped_paren)
#   else
#     return "(#{expression})"
#   end
# end

def needs_parentheses_simp(expression)
  expression.include('(')
end

def combine_like_terms_in_inner_expression(expression)
  innermost_expression = find_inner_expression(expression)
  simplified_inner_expression = add_and_sub_like_terms(innermost_expression[1...-1])
  "(#{simplified_inner_expression})"
end

def replace_inner_expression(expression, simplified_inner_expression) #needs to be rewritten too allow for exponent/mult/div simplification before it
  unsimplified_inner_expression = find_inner_expression(expression)
  expression.sub(unsimplified_inner_expression, simplified_inner_expression)
end

def find_index_of_innermost_paren(expression)
  index_of_open_paren = expression.length - expression.reverse.index('(') - 1
  index_of_close_paren = expression.index(')')
  [index_of_open_paren, index_of_close_paren]
end


def find_inner_expression(expression)
  find_index_of_innermost_paren(expression)
  innermost_open_paren = find_index_of_innermost_paren(expression)[0]
  innermost_close_paren = find_index_of_innermost_paren(expression)[1]
  expression[innermost_open_paren..innermost_close_paren]
end



p find_inner_expression('2+(3x((2x(3x+2x+5-6x)+1)-4x))+8x')
p "************"
p combine_like_terms_in_inner_expression('2+(3x((2x(3x+2x+5-6x)+1)-4x))+8x')
# p replace_inner_expression('2+(3x((2x(3x+2x+5-6x)+1)-4x))+8x')
# p "look below"
# p find_index_of_innermost_paren('2+(3x((2x(3x+2x+5-6x)+1)-4x))+8x')


