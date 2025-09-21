extends Node2D

var num1 = 7
var num2 = 7
var num3 = 7
var wins = 0
var loses = 0
var turns = 0
var bet = 0
var mulah = 100

func _ready():
	$mulah.text = "Mulah: " + str(mulah)
	$status.visible = false
	UpdateLabel()

func _on_bet_text_submitted(Pbet):
	if int(Pbet) == 0:
		$status.text = "You didnt bet D:"
		$status.visible = true
	elif int(Pbet) > mulah or int(Pbet) < 0:
		$status.text = "You dont have that mulah >:l"
		$status.visible = true
	else:
		bet = int(Pbet)
		$Lbet.text = "bet: " + str(bet)
		$bet.editable = false
		$status.visible = true
		$status.text = "Press 'Space' to GAMBAA!!1!! XD"
	
func _input(event):
	if mulah != 0 and bet != 0:
		if event.is_action_pressed("lezgogambling"):
			var roll = randf()
			turns += 1
			if roll <= 0.8:
				num1 = (randi() % 10) + 1
				num2 = (randi() % 10) + 1
				num3 = (randi() % 10) + 1
				# to not make loses have same nums
				if num1 == num2 and num2 == num3:
					num1 = (randi() % 10) + 1
					num2 = (randi() % 10) + 1
					num3 = (randi() % 10) + 1
				mulah -= bet
				loses += 1
				bet = 0
				$status.text = "AWW DANG IT! D:"
			else:
				var sameNum = randi() % 10 + 1
				num1 = sameNum
				num2 = sameNum
				num3 = sameNum
				mulah += bet
				wins += 1
				bet = 0
				$status.text = "YOU WON! :D"
			UpdateLabel()
			CheckMulah()

func UpdateLabel():
	$Lnum1.text = str(num1)
	$Lnum2.text = str(num2)
	$Lnum3.text = str(num3)
	$Lbet.text = "bet: " + str(bet)
	$bet.placeholder_text = "Place your bets here! :D"
	$turns.text = "turns: " + str(turns)
	$loses.text = "loses: " + str(loses)
	$wins.text = "wins: " + str(wins)
	$mulah.text = "Mulah: " + str(mulah)
	
func CheckMulah():
	if mulah <= 0:
		$status.text = "You have no mulah"
		$bet.text = "Get yo broke ahh out of here! >:l"
		$bet.editable = false
	else:
		$bet.editable = true
