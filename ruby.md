### RVM config
To start using RVM you need to run `source /home/ahsu/.rvm/scripts/rvm`

### Symbols vs. Strings
See http://www.reactive.io/tips/2009/01/11/the-difference-between-ruby-symbols-and-strings/.

* String: `"hello"`
* Symbol: `:"hello"`
* Strings are mutable
* Symbols are not
* Each string is stored in a separate memory location:
```
puts "hello world".object_id
puts "hello world".object_id
puts "hello world".object_id
puts "hello world".object_id
puts "hello world".object_id

# => 3102960
# => 3098410
# => 3093860
# => 3089330
# => 3084800
```

### List Rake tasks
```
rake -T
```

### Gemfile configuration
```
gem "azkaban-rb", :git => "git://github.com/erwa/azkaban-rb.git", :branch => 'pigLi'
```

### `attr_accessor`
Adds getter and setter on field. See http://stackoverflow.com/questions/4370960/what-is-attr-accessor-in-ruby for details.
```
class Person
  attr_accessor :name
end

person = Person.new
person.name = "Dennis"
person.name # => "Dennis"
```