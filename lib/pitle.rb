# frozen_string_literal: true

require_relative "pitle/version"
require 'thor'

module Pitle
  class Error < StandardError; end
  # Your code goes here...

  class FileNameOperator
    def initialize(filenames, extensions)
      @filenames = filenames
      @extensions = extensions
    end

    def collect_duplicate_files()
      formatted_files = @filenames.each.map { |x| Util.divide_extension(x, @extensions) }

      res = {}
      formatted_files.each do |book|
        name, ext = book
        if res.key?(name) then
          res[name].append(ext)
        else
          res[name] = [ext]
        end
      end

      return res
    end

    def pick_files()
      collected_files = collect_duplicate_files()

      res = []
      collected_files.each do |k, v|
        @extensions.each do |e|
          unless v.index(e).nil?
            res.append("#{k}.#{v[v.index(e)]}")
            break
          end
        end
      end

      return res
    end
  end

  class Util
    def self.divide_extension(filename, extensions)
      ret = nil
      extensions.each do |e|
        unless filename.rindex(e).nil?
          ret = [filename.split(".#{e}")[0], e]
          break
        end
      end
      return ret
    end
  end

  class CLI < Thor
    default_command :do
    default_task :do

    desc "epub,pdf", "Pick the one filename from duplicate filenames that have different extensions."
    method_option :extension, type: :string, default: "", aliases: "-e"
    method_option :print0, type: :boolean, aliases: "-0"
    def do()
      extensions = options[:extension].split(",")

      Dir.open(Dir.pwd){ |d|
        fileNameOperator = FileNameOperator.new(d.children, extensions)
        origin_filenames = fileNameOperator.pick_files()

        if options[:print0]
          print "./#{origin_filenames.join("\0./")}"
        else
          origin_filenames.each { |f| puts f }
        end
      }
    end
  end
end
