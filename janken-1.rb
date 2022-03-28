def janken
	puts "じゃんけん..."
	puts "0(✊を出す) 1(✌️ を出す) 2(✋を出す) 6(やらない)"
	$user_janken_type = gets.chomp.to_i
	enemy_janken_type = Random.rand(0..2).to_i
	
	janken_types = ["✊","✌️","✋"]
	
	if $user_janken_type == 0 || $user_janken_type == 1 || $user_janken_type == 2  
		puts "ポンッッ!!"
		puts "----------------------"
		puts "自分は#{janken_types[$user_janken_type]} を出した!!"
		puts "相手は#{janken_types[enemy_janken_type]} を出した!!"
		puts "----------------------"

		if ($user_janken_type == 0 && enemy_janken_type == 1) || ($user_janken_type == 1 && enemy_janken_type == 2) || ($user_janken_type == 2 && enemy_janken_type == 0)
			return "win"
		elsif ($user_janken_type == 0 && enemy_janken_type == 2) || ($user_janken_type == 1 && enemy_janken_type == 0) || ($user_janken_type == 2 && enemy_janken_type == 1)
			return "lose"
		elsif $user_janken_type == enemy_janken_type
			return "equal"
		end

	elsif $user_janken_type == 6
		puts "じゃんけんをやめました"
	else
		puts "無効な入力です"
		puts "もう一度やり直してください"
	end
end

$user_winner_or_loser = janken #ユーザーの勝敗を、win(勝ち)、lose(負け)、equal(あいこ)で管理

janken_winner_or_loser_result = {"win"=>"あなたはじゃんけんに勝った!","lose"=>"あなたはじゃんけんに負けた!","equal"=>"あいこだった!もう一度..."}

while $user_winner_or_loser == "equal"
	puts janken_winner_or_loser_result[$user_winner_or_loser]
	$user_winner_or_loser = janken 
end

puts janken_winner_or_loser_result[$user_winner_or_loser]


def acchimuitehoi
	puts "あっち向いて..."

	acchimuitehoi_point_result = ["上を指した!","右を指した!","下を指した!","左を指した!"]
	acchimuitehoi_direction_result = ["上を向いた!","右を向いた!","下を向いた!","左を向いた!"]

	if $user_winner_or_loser == "win"
		puts "0(上を指す) 1(右を指す) 2(下を指す) 3(左を指す)"
		user_acchimuitehoi_point = gets.chomp.to_i
	  enemy_acchimuitehoi_direction = Random.rand(0..3).to_i

		if user_acchimuitehoi_point == 0 || user_acchimuitehoi_point == 1 || user_acchimuitehoi_point == 2 || user_acchimuitehoi_point == 3
			puts "ホイッッ!!"
			puts "----------------------"
			puts "自分は#{acchimuitehoi_point_result[user_acchimuitehoi_point]}"
			puts "相手は#{acchimuitehoi_direction_result[enemy_acchimuitehoi_direction]}"
			puts "----------------------"

			if user_acchimuitehoi_point == enemy_acchimuitehoi_direction
				puts "あなたはあっち向いてホイに勝った!!"
			end
		else
			puts "無効な入力です"
			puts "もう一度やり直してください"
		end

	elsif $user_winner_or_loser == "lose"
		puts "0(上を向く) 1(右を向く) 2(下を向く) 3(左を向く)"
		user_acchimuitehoi_direction = gets.chomp.to_i
	  enemy_acchimuitehoi_point = Random.rand(0..3).to_i

		if user_acchimuitehoi_direction == 0 || user_acchimuitehoi_direction == 1 || user_acchimuitehoi_direction == 2 || user_acchimuitehoi_direction == 3
			puts "ホイッッ!!"
			puts "----------------------"
			puts "自分は#{acchimuitehoi_direction_result[user_acchimuitehoi_direction]}"
			puts "相手は#{acchimuitehoi_point_result[enemy_acchimuitehoi_point]}"
			puts "----------------------"

			if user_acchimuitehoi_direction == enemy_acchimuitehoi_point
				puts "あなたはあっち向いてホイに負けた!!"
			end
		else
			puts "無効な入力です"
			puts "もう一度やり直してください"
		end
	end
end

if $user_janken_type == 0 || $user_janken_type == 1 || $user_janken_type == 2
	acchimuitehoi
end