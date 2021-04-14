# frozen_string_literal: true

require_relative "pitle/version"

require 'pitle'
require 'thor'

module Pitle
  class Error < StandardError; end
  # Your code goes here...

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
    desc "hoge", "fuga"
    def do(priority="epub,pdf,mobi")
      books_sample = [
        "CleanAgile-1.0.0.epub",
        "CleanAgile-1.0.0.mobi",
        "CleanArchitecture-1.0.0.epub",
        "CleanArchitecture-1.0.0.mobi",
        "CleanCode-1.0.0.epub",
        "CleanCode-1.0.0.mobi",
        "CleanCoder-1.0.0.epub",
        "CleanCoder-1.0.0.mobi",
        "GallupReport-1.pdf",
        "GallupReport-2.pdf",
        "LINUX ハンドブック.pdf",
        "Land of Lisp.pdf",
        "Real World HTTP 第2版.epub",
        "Real World HTTP 第2版.mobi",
        "SRE サイトリライアビリティエンジニアリング.epub",
        "SRE サイトリライアビリティエンジニアリング.mobi",
        "SRE サイトリライアビリティエンジニアリング.pdf",
      ]

      priorities = priority.split(',')

      formatted_books = books_sample.each.map { |x| Util.divide_extension(x, priorities) }

      duplicate_books = {}
      formatted_books.each do |book|
        name, ext = book
        if duplicate_books.key?(name) then
          duplicate_books[name].append(ext)
        else
          duplicate_books[name] = [ext]
        end
      end

      origin_books = []
      duplicate_books.each do |k, v|
        priorities.each do |e|
          unless v.index(e).nil?
            origin_books.append("#{k}.#{v[v.index(e)]}")
            break
          end
        end
      end

      p origin_books

      # Dir.open(Dir.pwd){ |d|
      #   p d.children
      # }
    end

    default_task :do
  end
end
