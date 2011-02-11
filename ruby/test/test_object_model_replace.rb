require 'test/unit'
require 'object_model/replace'

class ArrayExtensionsTest < Test::Unit::TestCase
    def test_replace
        book_topics = ['html', 'java', 'css']
        replace(book_topics, 'java', 'ruby')
        expected = ['html', 'ruby', 'css']
        assert_equal expected, book_topics
    end
end
