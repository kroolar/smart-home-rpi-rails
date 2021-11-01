class Device < ApplicationRecord
  belongs_to :room

  validates(
    :gpio,
    :icon,
    :name,
    :room_id,
    presence: true
  )

  def outputs
    [
      { bcm: 4,  board: 7  },
      { bcm: 17, board: 11 },
      { bcm: 18, board: 12 },
      { bcm: 27, board: 13 },
      { bcm: 22, board: 15 },
      { bcm: 23, board: 16 },
      { bcm: 24, board: 18 },
      { bcm: 25, board: 22 },
      { bcm: 5,  board: 29 },
      { bcm: 6,  board: 31 },
      { bcm: 12, board: 32 },
      { bcm: 13, board: 33 },
      { bcm: 16, board: 36 },
      { bcm: 26, board: 36 },
    ]
  end
end
