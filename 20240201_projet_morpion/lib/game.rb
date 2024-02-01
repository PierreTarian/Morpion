require_relative 'application'
require_relative 'board'
require_relative 'boardcase'
require_relative 'player'


require 'pry'

class Game

    attr_accessor :player1, :player2
  
  #initialisation de la class Game
    def initialize 
      @player1 = player1_init()
      @player2 = player2_init(player1)
      jeu = lets_go()
      game_round(jeu, player1, player2)
    end
  
  #methode pour créer le player 1
    def player1_init 
      puts "Quelle est ton nom ?"
      print "> "
      name = gets.chomp
     
      puts "Quelle signe souhaites-tu avoir ?"
      puts "1 - X"
      puts "2 - O"
      
      print "> "
      sign = gets.chomp.to_i
  
      while sign < 0 || sign > 2
        puts "Merci de choisir un chiffre entre 1 et 2"
        print "> "
        sign = gets.chomp.to_i
      end
  
      case sign
        when 1
          sign = "X"
        when 2
          sign = "O"
        end
      
      player1 = Player.new(name,sign)
  
      puts "Bienvenue #{player1.name} tu auras donc pour signe : #{player1.sign}"
      puts "-"*30
      
      return player1
    end
  
  #methode pour créer le player 2 

    def player2_init (player1)
      
      puts "Quelle est ton nom?"
      print '> '
      name = gets.chomp
  
      puts "Quelle signe souhaites-tu avoir ?"
      puts "1 - X"
      puts "2 - O"
      print "> "
      sign = gets.chomp.to_i
  
      while sign < 0 || sign > 2
        puts "Merci de choisir un chiffre entre 1 et 2"
        print "> "
        sign = gets.chomp.to_i
    
      end
  
      case sign
        when 1
          sign = "X"
        when 2
          sign = "O"
      end
  
      while player1.sign == sign
        puts "Vous ne pouvez pas avoir le même signe que #{player1.name} merci d'en selectionner un nouveau"
        print "> "
        sign = gets.chomp.to_i
  
        while sign < 0 || sign > 2
        puts "Merci de choisir un chiffre entre 1 et 2"
        print "> "
        sign = gets.chomp.to_i
        end
  
        case sign
          when 1
            sign = "X"
          when 2
            sign = "O"
        
        end
  
      end
      player2 = Player.new(name,sign)    
      puts "Bienvenue #{player2.name} tu auras donc pour signe : #{player2.sign}"
  
      puts "-"*30
      return player2
    end
  
    
    def lets_go
        puts "\n\nLes deux adversaires seront donc: #{player1.name} et #{player2.name}!"
        puts "Que le jeu commence !"
    
      

       
          jeu = Board.new
          return jeu
        
        puts "-"*30
      end

  #méthode pour commencer les tours de jeu
    def game_round(jeu, player1, player2)
      while jeu.array_count > 0 
        player_play(jeu,player1)
          if jeu.win(player1.sign*3) == true
            puts "Voici le tableau final"
            jeu.current_game
            puts "Félicitations mon cher #{player1.name}, quelle belle victoire!!"
            break #break si joueur 1 à win
          end
      
        if jeu.array_count == 0 
          jeu.current_game
          puts "Oh! Une égalité, tant d'effort pour rien!"
            break #break si égalité 
        else
          player_play(jeu,player2)
  
          if jeu.win(player2.sign*3) == true
            puts "Voici le tableau final"
            jeu.current_game
            puts "Félicitations mon cher #{player2.name}, quelle belle victoire!!"
            break #break si joueur 2 à win
          end
        end
      end
    end
  
  #méthode pour faire jouer un joueur
    def player_play(jeu, player)
      puts "Vas y #{player.name} choisis une case pour mettre ton signe : #{player.sign}"
      
     jeu.rules
      
      puts"Voici le plateau actuel:"
      
      jeu.current_game
      
      puts "Choississez votre case :"
      print "> "
      choice_player = gets.chomp.to_i
  
        until (1..9).cover?(choice_player) && jeu.array_fetch(choice_player-1) == " "
          puts "Choisisses une case valide"
          choice_player = gets.chomp.to_i
        end
      
      jeu.case[choice_player-1].replace(player.sign)
    
      puts "-"*30
    end
    
  end

