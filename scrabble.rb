=begin

PSEUDOCODE---

DEFINE a method scrabble, which takes as input a string (current list of available letters), and returns a string (best point combination using the current letters).

=end

def scrabble(letters)

  #define our word database/dictionary to check for potential word combinations
  dictionary = ["achievement","acid","action",
    "adventure","allspark","ammo","arpg","assassin",
    "asteroid","autosave","avatar","avenger","beta",
    "blade","blast","block","blood","boss","buff",
    "bullet","buster","checkpoint","cheese","chrono",
    "claptrap","class","closed","console","controller",
    "cooldown","corruption","counter","cover","cpu",
    "crafting","creed","crouch","crpg","cutscene",
    "cutting","damage","difficulty","dig","dlc","dodge",
    "doublejump","drm","dungeon","dweller","early","edge","emergent","endings","episodic","escort","esports","event","exclusive","exploit","explosion","fall","farm","farming","fasttravel","field","fight","finished","fireball","fog","free","game",
    "ganon","gauntlet","gem","generation","ghost","god","gpu","grenade","griefer","grinding","gun","halo",
    "hardmode","healer","health","horror","ifrit",
    "indie","infinity","instance","invader","joystick",
    "jrpg","jump","keyblade","keyboard","kill","lag","lane","leroy","level","lightning","link","live","ludology","mage","magus","mana","mario","masamune","master","matchmaking","materia","megaman","microtransactions","middleware","midgar","mission","mmorpg","mob","moba","mode","monster","mouse",
    "mouselook","multiple","myst","nerf","nintendo","noob","npc","nvidia","openworld","optimus","overpowered","overshield","pacman","pass","pellet","permadeath","persistent","pickaxe","pierce","pixel","plasma","play","poison","port","potion","procedural","puzzle","pve","pvp","quest","quick","raid","realtime","replay","retrogaming","rig","rocket","roguelike","romance","rpg","season","shield","shoot","shovel","simulator","sli","sliding","smash","souls","spawn","speedrun","spread","sprint","stealth","strategy","streak","summon","super","survival","sword","system","tactics","tank","tesseract","theory","time","touchscreen","triforce","uppercut","vault","walljump","war",
    "warrior","wasd","wasteland","world","zelda","zombie"]

    def word_contains?(word, letters)
      x = 0
      sorted_jumbled_letters = {}
      sorted_word_letters = {}
      letters = letters.split("").uniq
      word_letters = word.split("")

      word_letters.each do |letter|
        if sorted_word_letters[letter].nil?
          sorted_word_letters[letter] = 1
        else
          sorted_word_letters[letter] += 1
        end
      end

      letters.each do |letter|
        if sorted_jumbled_letters[letter].nil?
          sorted_jumbled_letters[letter] = 1
        else
          sorted_jumbled_letters[letter] += 1
        end
      end

      letters.each do |letter|
        if (sorted_jumbled_letters[letter].nil? || sorted_word_letters[letter].nil?)
          x = x
        elsif sorted_jumbled_letters[letter] >= sorted_word_letters[letter]
          x += 1
        else
          x = x
        end
      end
      x >= word.length
    end

    points_by_letter = {
      "a"=>1, "b"=>3, "c"=>3, "d"=>2, "e"=>1, "f"=>4, "g"=>2, "h"=>4, "i"=>1, "j"=>8, "k"=>5, "l"=>1, "m"=>3, "n"=>1, "o"=>1, "p"=>3, "q"=>10, "r"=>1, "s"=>1, "t"=>1, "u"=>1, "v"=>4, "w"=>4, "x"=>8, "y"=>4, "z"=>10, "B"=>0
    }

    word_options = []
    word_option_points = {}

    if letters.is_a?(String) == false
      puts "This is not a valid input. Please give a string as input"
    else
      dictionary.each do |word|
        if (letters.split("").sort!.join("") == word.split("").sort!.join(""))

          word_options << word
          word_option_points[word] = 0

        elsif letters.include? word

          word_options << word
          word_option_points[word] = 0

        elsif word_contains?(word, letters)

          word_options << word
          word_option_points[word] = 0
        end
      end

      word_options.each do |word|
        fullword = word
        word = word.split("")

        word.each_index do |index|
          word_option_points[fullword] += points_by_letter[word[index]]
        end
      end
    end

    if word_options.empty? == false
      puts "Your word options are #{word_options} and the best choice is #{word_option_points.max_by{|k,v| v}[0]} which is worth #{word_option_points.max_by{|k,v| v}[1]} points"
    else
      puts "I couldn't find a word that worked for you. Sorry"
    end

  end

  scrabble("zaedl")