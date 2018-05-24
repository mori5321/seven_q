class UniqueIdSetter
  def initialize(model_instance, column_name, digits)
    @model_instance = model_instance
    @column_name = column_name
    @digits = digits
  end
  attr_reader :model_instance, :digits, :column_name

  def exec!
    generate
  end

  def generate
    begin
      token = RandomNumberGenerator.new(digits).execute
    end while model_instance.class.exists?(column_name => token)
    return token
  end
end
