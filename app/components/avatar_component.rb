# frozen_string_literal: true

class AvatarComponent < ViewComponent::Base
  def initialize(image: nil, size: 'w-10 h-10', custom_class: 'rounded-full')
    @image = image.nil? ? default_image : image
    @size = size
    @custom_class = custom_class
  end

  private

  attr_reader :image, :size, :custom_class

  def default_image
    'https://i.pravatar.cc/150?img=1'
  end
end
