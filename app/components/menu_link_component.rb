# frozen_string_literal: true

class MenuLinkComponent < ViewComponent::Base
  def initialize(href:, title:, icon:, class_custom: nil)
    @href = href
    @title = title
    @icon = icon
    @class_custom = class_custom
  end

  private

  attr_reader :href, :title, :icon, :class_custom
end
