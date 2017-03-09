=begin
first: simplify both sides of the equals sign
	split the equation by the equals sign and reduce?
second: Add or subtract anything that is outside parentheses (this will be hard?)
third: multiply/divide
fourth: Add/sub if necessary
fifth: Mult/Div if necessary
=end



def linear_equation_solver(equation)
end

=begin
EDGECASE! (simplify the expressions first (exponents, mult/division, radicals))
change everything to + so that the subtractions become adding a negative
split by + 
sort so that like terms are next to eachother
if the variables are the same, add the coefficients, delete the old terms, insert the new term

	
=end

def combine_like_terms(expression)

end

def combine_variables(expression)
end



def find_the_coefficient(term)
end

def change_sub_to_add_negative(expression)
	no_sub_expression = expression.split('').map.with_index do |character, index|
		p(expression[index-1] == '-') && (character.ord <= 122) && (character.ord >= 97)
		if (character != '-') && (expression[index-1] != '-')
			character = character
		elsif character == '-'
			character = '+'
		elsif (expression[index-1] == '-') && (character.ord <= 122) && (character.ord >= 97)
			character.prepend('-1')
		elsif expression[index-1] == '-'
			character = character.to_i * -1
		end
	end
	p no_sub_expression.join('')
end

change_sub_to_add_negative("3x+2y-8xyz+1-8y+2x-y")


