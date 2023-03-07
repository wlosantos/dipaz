# frozen_string_literal: true

class MenuLinkComponent < ViewComponent::Base
  def initialize(href:, title:, icon:, class_custom: nil, action: nil)
    @href = href
    @title = title
    @icon = icon
    @class_custom = class_custom
    @action = action
  end

  private

  attr_reader :href, :title, :icon, :class_custom, :action

  def current_action
    return unless @action

    current_page?(action: @action) ? 'bg-sky-100 text-sky-500 pointer-event-none' : ''
  end
end
