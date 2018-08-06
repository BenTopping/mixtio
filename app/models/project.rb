class Project < ActiveRecord::Base
  include Activatable
  include Auditable

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :sub_batches

end
