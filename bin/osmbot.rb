#!/usr/bin/env ruby

require "bundler/setup"
require "osmbot"


bot = Osmbot::Bot.new
bot.start
