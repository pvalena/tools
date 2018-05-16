require "minitest/autorun"
require "fileutils"

require_relative "../get_authors.rb"

class TestGetAuthors < Minitest::Test
  def setup
    @original_dir = Dir.pwd
    @dir = Dir.mktmpdir 'developer-portal'

    @subdir = File.join(@dir, 'subdir')

    Dir.mkdir @subdir

    Dir.chdir @dir
  end

  def teardown
    Dir.chdir @original_dir
    FileUtils.rm_rf @dir
  end

  def test_git_git
    assert_match /^git version /, Git.git('--version')
  end
end
