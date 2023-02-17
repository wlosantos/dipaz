# frozen_string_literal: true

class MenuLinkComponentPreview < ViewComponent::Preview
  def default
    render(MenuLinkComponent.new(href: 'href', title: 'title', icon: 'icon', class_custom: 'class_custom', action: 'action'))
  end
end
