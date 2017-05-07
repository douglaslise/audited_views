class Audit < ActiveRecord::Info
  belongs_to :user, polypmorphic: true

end
