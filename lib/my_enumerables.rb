module Enumerable
  # Your code goes here
  def my_each_with_index
    return self unless block_given?

    for index in 0...self.length do
      yield self[index], index
    end
    self
  end

  def my_select(&block)
    return self unless block_given?

    return_array = []
    self.my_each { |i| return_array << i if block.call(i) }
    return_array
  end

  def my_all?(&block)
    return self unless block_given?

    test_array = []
    self.my_each { |i| test_array << i if block.call(i) }

    self == test_array
  end

  def my_any?(&block)
    return self unless block_given?

    test_array = []
    self.my_each { |i| test_array << i if block.call(i) }

    test_array != []
  end

  def my_none?(&block)
    return self unless block_given?

    test_array = []
    self.my_each { |i| test_array << i if block.call(i) }

    test_array == []
  end

  def my_count(&block)
    return self.length unless block_given?

    count = 0
    self.my_each { |i| count += 1 if block.call(i) }

    count
  end

  def my_map(method = nil, &block)
    return self unless method || block_given?

    map = []

    if block_given?
      self.my_each { |i| map << block.call(i) }
    else
      self.my_each { |i| map << method.call(i) }
    end

    map
  end

  def my_inject(start_value = nil, &block)
    return self[0] if self.length == 1

    if start_value
      result = start_value
      start_index = 0
    else
      result = self[0]
      start_index = 1
    end

    self[start_index..].my_each { |i| result = block.call(result, i) }

    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return self unless block_given?

    for i in self do
      yield i
    end
  end
end
