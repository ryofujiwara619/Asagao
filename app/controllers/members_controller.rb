class MembersController < ApplicationController
  def index
    @members = Member.order("number")
  end

  def show
    @member = Member.find(params[:id])
  end

  def search
    # member.rbのsearchアクションを利用
    @members = Member.search(params[:q])
    render "index"
  end
end
