class MembersController < ApplicationController
  def index
    @members = Member.order("number")
  end

  def search
    # member.rbのsearchアクションを利用
    @members = Member.search(params[:q])
    render "index"
  end
end
