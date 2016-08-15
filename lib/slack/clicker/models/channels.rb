class Channel < ActiveRecord::Base
  def to_field
    {
      title: name,
      value: count,
      short: true
    }
  end
end
