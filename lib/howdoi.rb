#!/usr/bin/env ruby
# coding: utf-8
#Author: Roy L Zuo (roylzuo at gmail dot com)
#Description: 

require 'uri'
require 'net/http'
require 'rubygems'
require 'nokogiri'

GOOGLE_SEARCH_URL = "http://www.google.com/search?q=site:stackoverflow.com+"
USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17"

def get_url(url) 
  uri = URI.parse url
  http = Net::HTTP.new(uri.host, uri.port)
  http.get(uri.request_uri, 'User-Agent' => USER_AGENT).body
end

def is_question?(stackoverflow_url)
  stackoverflow_url =~ %r(/questions/\d+/)
end

def get_google_links(args)
  page = get_url(URI.escape(GOOGLE_SEARCH_URL + args.join("+")))
  html = Nokogiri.HTML(page)
  posts = []
  html.css('a.l').each{|l| posts << l[:href] if is_question?(l[:href]) }
  posts
end

def get_link_at_pos(links, pos)
  link = nil
  pos.times do |i|
    break if i > links.size
    link = links[i]
  end
  link
end

def how_do_i(args, opts = {})
  links = get_google_links(args)
  link = get_link_at_pos(links, opts[:pos])
  if link
    puts "\e[32m" + link + "\e[m"
    puts 
    page = get_url link
    html = Nokogiri.HTML page
    ans = html.at_css(".answer")
    if ans
      instruction = ans.css("pre").children.
        collect(&:content).
        join(" " * 5 + '-' * 50 + "\n") || 
        ans.at_css("code").content
      unless opts[:all] or instruction.empty?
        puts instruction
      else
        puts ans.at('.post-text').content
      end
    end
    exit
  end
  puts "Sorry, couldn't find any help with that topic"
end

if __FILE__ == $0
  require 'optparse'
  options = {}

  OptionParser.new do |opts|
      opts.banner = "Usage: #{$0} [options] QUERY ..."
      opts.separator " "
      options[:pos] = 1
      opts.on("-p", "--pos N", Integer, "select answer in specified position (default: 1)") do |pos|
        options[:pos] = pos
      end
      opts.on("-a", "--all", 'display the full text of the answer') do
        option[:all] = true 
      end
  end.parse!

  how_do_i(ARGV, options)
end
