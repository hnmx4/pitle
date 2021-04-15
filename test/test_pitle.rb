require "test_helper"

class PitleTest < Minitest::Test
  def test_should_has_a_version_number
    refute_nil ::Pitle::VERSION
  end

  def test_util_divide_extension
    assert_equal ["Real World HTTP 第2版", "epub"],
      Pitle::Util.divide_extension("Real World HTTP 第2版.epub", %w(epub pdf mobi))
  end

  def test_file_name_operator_pick_files
    filenames_sample = [
      "CleanAgile-1.0.0.epub",
      "CleanAgile-1.0.0.mobi",
      "Land of Lisp.pdf",
      "SRE サイトリライアビリティエンジニアリング.pdf",
      "SRE サイトリライアビリティエンジニアリング.epub",
      "SRE サイトリライアビリティエンジニアリング.mobi",
    ]
    fo = Pitle::FileNameOperator.new(filenames_sample, %w(epub pdf mobi))

    assert_equal ["CleanAgile-1.0.0.epub", "Land of Lisp.pdf", "SRE サイトリライアビリティエンジニアリング.epub"],
      fo.pick_files()
  end
end
