require 'test/unit'
require 'object_model/alphanumeric'

class StringExtensionsTest < Test::Unit::TestCase
    def test_strips_non_alphanumeric_characters
        assert_equal '3 the Magic Number', '#3, the *Magic, Number*?'.to_alphanumeric
    end
end
