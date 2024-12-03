# frozen_string_literal: true

require 'simplecov'

Dir[File.join(__dir__, '../lib/**/*.rb')].reject { |file| file.include?('main.rb') }.sort.each { |file| require file }
SimpleCov.start
