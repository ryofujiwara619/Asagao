class MembersController < ApplicationController
  def index
    @members = Member.order("number")
  end
end
