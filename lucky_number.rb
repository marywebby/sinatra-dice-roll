require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get ("/") do 
  return "
  <h1>Dice Roll</h1>
    <ul>
      <li><a href=/dice/2/6 >Roll 2-Six Sided Dice</a></li>
      <li><a href=/dice/2/10 >Roll 2-Ten Sided Dice</a></li>
      <li><a href=/dice/1/20 >Roll 1-Twenty Sided Dice</a></li>
      <li><a href=/dice/5/4 >Roll 5-Four Sided Dice</a></li>
    </ul>"
end


get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h1>2 dice with 6 sides</h1>
   <p>#{outcome}</p>"
end

get ("/dice/2/10") do 
  first_die = rand(1..10)
  sec_die = rand(1..10)
  sum = first_die + sec_die

  outcome = "You rolled a #{first_die} and a #{sec_die} for a total of #{sum}"

  "<h1>2 dice with 10 sides</h1>
   <p>#{outcome}</p>"
end 

get ("/dice/1/20") do 
  one_roll = rand(1..20)

  outcome = "You rolled only one die for a total of #{one_roll}"

  "<h1>1 dice with 20 sides</h1>
   <p>#{outcome}</p>"
end 

get ("/dice/5/4") do 
  first_die = rand(1..4)
  sec_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)
  sum = first_die + sec_die + third_die + fourth_die + fifth_die

  outcome = "You rolled 5 die, each totals are: #{first_die}, #{sec_die}, #{third_die}, #{fourth_die}, #{fifth_die}. For a total of #{sum}"

  "<h1>2 dice with 4 sides</h1>
   <p>#{outcome}</p>"
end 
