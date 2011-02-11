require 'test/unit'
require 'object_model/replace'

class ArrayExtensionsTest < Test::Unit::TestCase
    def test_substitute
        book_topics = ['html', 'java', 'css']
        book_topics.substitute('java', 'ruby')
        expected = ['html', 'ruby', 'css']
        assert_equal expected, book_topics
    end

    def test_replace_org
        book_topics = ['html', 'java', 'css']
        book_topics.replace([1,2,3])
        expected = [1, 2, 3]
        assert_equal expected, book_topics
    end
end
