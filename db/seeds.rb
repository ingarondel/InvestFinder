user = User.create([
{
	name: 'Admin',
	surname: 'Admin',
	email: 'admin@admin.com',
	password: '123456',
	confirmed_at: Time.now
}
])

ideas = Idea.create([
  {
	title: 		 	  Faker::Lorem.sentence(word_count: 3),
	description: 	  Faker::Lorem.sentence,
	fund_capital: 	  Faker::Commerce.price,
	industries: 	  Faker::IndustrySegments.industry,
	problem_solved:   Faker::Lorem.sentence,
	geographic_focus: 'Europe',
	team_members: 	  '1 CEO' ,
	next_steps: 	  Faker::Lorem.sentence,
	investor_require: Faker::Lorem.sentence,
	user_id: 1
  },
{
	title: 		 	  Faker::Lorem.sentence(word_count: 3),
	description: 	  Faker::Lorem.sentence,
	fund_capital: 	  Faker::Commerce.price,
	industries: 	  Faker::IndustrySegments.industry,
	problem_solved:   Faker::Lorem.sentence,
	geographic_focus: 'Asia',
	team_members: 	  '3 CEO' ,
	next_steps: 	  Faker::Lorem.sentence,
	investor_require: Faker::Lorem.sentence,
	user_id: 1
  },
  {
	title: 		 	  Faker::Lorem.sentence(word_count: 3),
	description: 	  Faker::Lorem.sentence,
	fund_capital: 	  Faker::Commerce.price,
	industries: 	  Faker::IndustrySegments.industry,
	problem_solved:   Faker::Lorem.sentence,
	geographic_focus: 'Europe',
	team_members: 	  '1 CEO, 2 CTO' ,
	next_steps: 	  Faker::Lorem.sentence,
	investor_require: Faker::Lorem.sentence,
	user_id: 1
  }
])
