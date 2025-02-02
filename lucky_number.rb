require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get ("/") do 
  return erb(:homepage)
end


get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  erb(:two_six)
end

get ("/dice/2/10") do 
  first_die = rand(1..10)
  sec_die = rand(1..10)
  sum = first_die + sec_die

  @outcome = "You rolled a #{first_die} and a #{sec_die} for a total of #{sum}"

  erb(:two_ten)
end 

get ("/dice/1/20") do 
  @one_roll = rand(1..20)

  @outcome = "You rolled only one die for a total of #{@one_roll}"

  erb(:one_twenty)
end 

get ("/dice/5/4") do 
  first_die = rand(1..4)
  sec_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)
  sum = first_die + sec_die + third_die + fourth_die + fifth_die

  @outcome = "You rolled 5 die, each totals are: #{first_die}, #{sec_die}, #{third_die}, #{fourth_die}, #{fifth_die}. For a total of #{sum}"

  erb(:five_four)
end 

get("/dice/100/6") do
  @rolls = []

  100.times do
    die = rand(1..6)

    @rolls.push(die)
  end

  erb(:one_hundred_six)
end
