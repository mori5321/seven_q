class QuestionRoom < ActiveRecord::Base
  before_create :set_unique_id

  belongs_to :question_group

  URL = {
    production: "https://nanakuro.herokuapp.com",
    development: "http://localhost:3000"
  }

  PATH = "/question_rooms/"

  def generate_url
    return URL[ ENV['RACK_ENV'].to_sym ] + PATH + self.unique_id if self.unique_id
    raise StandardError.new("doesn't have unique_id yet")
  end

  private
    def set_unique_id
      self.unique_id = UniqueIdSetter.new(self, "unique_id", 20).exec!
    end
end