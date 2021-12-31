module Api
  module V1
    # Basic controller for api v1
    class BaseController < ApplicationController
      before_action :authenticate_user!
    end
  end
end
