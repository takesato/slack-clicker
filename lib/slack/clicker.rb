require 'dotenv'
require 'slack'
require 'singleton'
require 'active_record'

Dotenv.load

require 'slack/clicker/version'
require 'slack/clicker/config'
Dir["#{File.dirname(__FILE__)}/clicker/models/**/*.rb"].each {|file| load file }
require 'slack/clicker/client'
require 'slack/clicker/notifier'
