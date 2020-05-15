extends RichTextLabel

var check=false

func _ready():
	var textToAdd
	textToAdd = "Doctor, wake up!\nYou have a visitor!"
	printText(textToAdd)

func printText(text):
	self.text=''
	#create a timer to print text like a typewriter
	var t = Timer.new()
	t.set_wait_time(.1)
	t.set_one_shot(true)
	self.add_child(t)

	for letter in text:
		t.start()
		self.add_text(letter)
		yield(t, "timeout")

func _on_main_printText(monolog):
	printText(monolog)



func _on_main_printTutText(text):
	printText(text)
	

