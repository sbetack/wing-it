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


=begin
change all add to sub
create a hash that maps each term to its coefficient
sort the hash by keys into an array


	
=end
def combine_like_terms(expression)
	
end


def create_hash_coefficent_keys_and_variable_values(expression)
	all_add = change_sub_to_add_negative(expression)
	term_array = all_add.split("+")
	coefficient_and_variables = {}
	term_array.each do |term|
		variable = get_the_variable(term)
		coefficient_and_variables[term] = variable
	end
	p coefficient_and_variables
end




def sort_by_variables(expression)
	all_add_expression = change_sub_to_add_negative(expression)
	term_array = all_add_expression.split("+")
	unsorted_terms_with_vars = []
	term_array.each do |term|
		term_with_var = []
		term_with_var[0] = term
		term_with_var[1] = get_the_variable(term)
		unsorted_terms_with_vars.push(term_with_var)
	end
	sorted_terms_with_vars = unsorted_terms_with_vars.sort_by { |a2| a2[1] }
	sorted_terms = []
	sorted_terms_with_vars.each do |term_and_var_array|
		sorted_terms.push(term_and_var_array[0])
	end
	sorted_terms.join("+")
end


def get_the_variable(term)
	variable = ''
	term.chars.each do |character|
		if (character.ord <= 122) && (character.ord >= 97)
			variable += character
		end
	end
	variable
end

def get_the_coefficient(term)
	coefficient = ''
	term.chars.each do |character|
		if !((character.ord <= 122) && (character.ord >= 97))
			coefficient += character
		end
	end
	coefficient.to_i
end


def change_sub_to_add_negative(expression)
	no_sub_expression = expression.chars.map.with_index do |character, index|
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

all_add = change_sub_to_add_negative("3x+2y-8xyz+1y-8y+2x-y")
# p all_add.split("+")

# p get_the_variable("563xyz")
p get_the_coefficient("-563")
p sort_by_variables("3x+2y-8xyz+1z-8y+26x-y")

# create_hash_coefficent_keys_and_variable_values("3x+2y-8xyz+1y-8y+2x-y")


