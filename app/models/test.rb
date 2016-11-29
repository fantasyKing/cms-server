class Test
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :body, type: String
  field :picture, type: String
  field :age, type: Integer
end