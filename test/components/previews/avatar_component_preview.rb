# frozen_string_literal: true

class AvatarComponentPreview < ViewComponent::Preview
  def default
    render(AvatarComponent.new(image: 'image', size: 'size', custom_class: 'custom_class'))
  end
end
