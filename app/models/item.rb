class Item < ApplicationRecord

  has_one_attached :image

  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  # enum is_active: {true: 0, false: 1}


  def get_image(width,height)
      unless image.attached?
        file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
        profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
      image.variant(resize_to_limit: [width,height]).processed
  end
end
