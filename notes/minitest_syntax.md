#Minitest Assertions

`assert_true` the result must be true or `refute_true`

`assert_equal(s)` the result must equal exactly or `refute_equal(s)`

`assert_includes` the result must include or `refute_includes`

`assert_instance_of` the result must be an instance of

`assert_nil` the result must be nil or `refute_nil`

`assert_raises` the result must raise exactly that or `refute_raises`

#### For Example

this would be the code to test in `blog.rb`

```
class Blog
  def title
    "Treehouse Blog"
  end
end
```

and this would be the minitest code to test it in `blog_test.rb`

```
require 'minitest/autorun'
require './blog'

class TestBlog < Minitest::Test

  def setup
    @blog = Blog.new
  end

  def test_title_is_treehouse
    assert_equal "Treehouse Blog", @blog.title
  end
end
```

and would be run with the following command `ruby blog_test.rb` just like a normal ruby program. The result would look like this if there are no failures (which there should not be): 

```
$ ruby blog_test.rb
Run options: --seed 30102

# Running:

.

Finished in 0.000980s, 1020.4082 runs/s, 1020.4082 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```
