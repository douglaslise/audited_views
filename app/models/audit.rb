class Audit < ActiveRecord::Base
  belongs_to :user, polymorphic: true

end
