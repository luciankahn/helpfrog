class Comment < ActiveRecord::Base
  belongs_to :place
  before_create :set_password

  validates :content, presence: true

  def set_password
    chars = ('a'..'zz').to_a.concat((0..1000000).to_a).concat(('A'..'ZZ').to_a)
    giant_string = chars.to_a.shuffle.join
    start = rand(500)
    self.password = giant_string[start..start+30]
  end
end
