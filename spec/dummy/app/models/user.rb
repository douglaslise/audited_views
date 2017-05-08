class User < ApplicationRecord

  def to_s
    self.email
  end
end
