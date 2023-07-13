#!/usr/bin/env ruby
# Created By Pirata
#
#

require 'find'
require 'etc'

path= ARGV[0]

search=Find.find(path)

class String
  def red; colorize(self, "\e[1m\e[31m"); end
  def green; colorize(self, "\e[1m\e[32m"); end
  def dark_green; colorize(self, "\e[32m"); end
  def yellow; colorize(self, "\e[1m\e[33m"); end
  def blue; colorize(self, "\e[1m\e[34m"); end
  def dark_blue; colorize(self, "\e[34m"); end
  def purple; colorize(self, "\e[35m"); end
  def dark_purple; colorize(self, "\e[1;35m"); end
  def cyan; colorize(self, "\e[1;36m"); end
  def dark_cyan; colorize(self, "\e[36m"); end
  def pure; colorize(self, "\e[0m\e[28m"); end
  def bold; colorize(self, "\e[1m"); end
  def colorize(text, color_code) "#{color_code}#{text}\e[0m" end
end

def search_777(search)
  search.select do |file|
    File.file?(file) && File.executable?(file) && File.writable?(file)
  end
end

def search_suid(search)
  search.select do |file|
    propietario=""
    if File.file?(file) && File.stat(file).setuid?
      propietario=Etc.getpwuid(File.stat(file).uid).name 
      puts "\nArchivo con permisos ".red+"SUID".blue+" encontrados \n".red+"file:".blue+" #{file}".dark_purple+" owner: ".blue+"#{propietario}".dark_purple      
    end 
  end 
end 

def search_root_own(search)
  search.select do |file|
    if File.executable?(file) && File.stat(file).uid==0
      puts "\nArchivo de ".red+"propietario root".blue+" con capacidad de ejecucion\n".red+"#{file}"
    end
  end
end 

if ARGV.size==1
  puts "\nFiles with".red+" 777".blue+" permisions:".red
  puts search_777 search
  search_suid search
  search_root_own search
else 
  puts "[!] Use".yellow+" #{File.basename(__FILE__)}".purple+" <PATH>".blue
end

