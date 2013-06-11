# encoding: UTF-8 
# без наследования
class Musicbox
def initialize song_cost
  @songs = ["Californication", "Dreams", "Not affraid"]
  @song_cost = 10
  @song_name = ''
  @current_song = ''
  @turned_on = false
  @song_founded = false
  @songammount = ''
end

def turn_on
unless @turned_on
  @turned_on = true
  puts "Box was turned on"
else
  p 'already turned on'
 
end
end

def search 
while 
  @song_founded == false  
  puts "Please chose the song from list below or try our search system"
  puts @songs
  @song_name = gets.chomp
if @songs.include?@song_name
  print "'#{@song_name}' will be loaded after paying money\n Insert money in cashbox\n"
  # load_song '#{@song_name}' # так делается? вызывается ли так метод в другом методе?
  @song_founded == true
break
else puts "Such track can't be find, try another one"
end 

end
end

# def pay  # больше 100 не верно обрабатывает, 
# что кострукцией if-elsif-else, что case -when-when-else

def pay 
   puts 'One song cost 10$'
   income_money = gets.to_i
   puts "Your withdraw #{income_money}$"
   case income_money
   when 10..100
   @songammount = income_money/@song_cost
   @raznica = income_money-@song_cost*@songammount
   puts "You can chose #{@songammount} songs and\n still will have #{@raznica} $"
   when income_money >100 #почему не работает?
   puts 'Maximum deposit is 100$'
   else
   @nehvatka = (income_money-@song_cost).abs #значение по модулю
   puts "Insert more money. You need for at least #{@nehvatka} $" 
end
end

def load_song 
  @playlist = [] 
  if @songammount.to_i < 1   # решить беду с суммой больше 100 бачей
  pay # как зациклить пока не закинет минимальную сумму в 10бачей?
else @songammount.to_i > 1 # 63 и 65 строки как заменить to_i в самой переменной в методе pay?
  puts "#{@song_name} is in playlist"
  @playlist << "#{@song_name}"
  puts 'Would you like to add more tracks to playlist? Y/n?'
  response = gets
case response
     when /^[nN]/#. /^$/ 
     play_music 
     when /^[yY]/ # как зациклить пока не выработаются все деньги? 
     puts @songs
     @song_name = gets.chomp
if @songs.include?@song_name
  print "'#{@song_name}' will be added to playlist"
  @playlist << "#{@song_name}"
  play_music
  print ''
else  puts 'Incorrect input, try again'
end
  
end
end
end

def turn_off # скатал у кого-то, ниче не понял :)
  if @turned_on == true
  @turned_on = false
  puts 'The Musicbox is turned off'
else puts 'already viryblen'
end
end

private # прочекать!!!

def play_music  
  puts "\n igraem #{@playlist}"
  status
end

def status
  if @turned_on == true
  p Time.new
  p "Turned on"
else @turned_on == false
  p "Press button to turn on"
end
end

end

 
box = Musicbox.new 10
box.turn_on
box.search 
box.pay 
box.load_song
box.turn_off # как его выключить? чтобы он вырубался только по нашему желанию?
