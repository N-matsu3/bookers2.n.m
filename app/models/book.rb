class Book < ApplicationRecord

  validates :title,
    presence:true

  validates :body,
    length:{maximum:200},
    presence:true

  has_one_attached :image
  belongs_to :user

  # 画像なしなので「画像が存在しない場合に表示する画像をActiveStorageに格納する」は不要？

end
