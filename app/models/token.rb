class Token < ApplicationRecord

  def expired?
    self.expiration > DateTime.now
  end
end
