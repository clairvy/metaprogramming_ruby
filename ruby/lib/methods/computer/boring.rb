class Computer
  instance_methods.each do |m|
    undef_method m unless m.to_s =~ /^__|object_id|method_missing|respond_to?/
  end

  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def method_missing(name, *args)
    super if !respond_to?(name)
    info = @data_source.send("get_#{name}_info", @id)
    price = @data_source.send("get_#{name}_price", @id)
    result = "#{name.to_s.capitalize}: #{info} (#{price})"
    return "* #{result}" if price > 100
    result
  end

  def respond_to?(method)
    @data_source.respond_to?("get_#{method}_info") || super
  end
end
