require 'singleton'

require 'zmby/character'
# require 'zmby/game'
require 'zmby/map'

class GameInterface
	include Singleton

	def initialize
	end

	def handleCommand(input)
		case input
		# Game-state commands
		when /new/
			@m = Map.new
			@m.load('maps/1.txt')
		when /save/
		when /load/
		# In-game commands
		when /map/
			@m.to_s
		when /health/,/hp/
			@player.health
		when /(drive|move) (.*)/
			movementType = $1.to_sym
			direction = $2
			speed = 1
		when /search/
			"search the area"
		when /heal/
			@player.heal(10)
			@player.health
		when /fortify/
			"fortify"
		when /give/
			"give resources"
		when /dropoff/
			"dropoff resources"
		when /pickup/
			"pickup resources"
		when /help(.*)/
			command = $1.gsub(/\s+/, "")
			#TODO: create help text
			'Sorry, no help text yet.'
		when 'exit'
			exit 0
		else
			'Invalid command'
		end
	end
end