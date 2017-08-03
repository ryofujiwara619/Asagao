class MembersController < ApplicationController
  def index
    @members = Member.order("number")
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new(birthday: date.new(1980, ,1, 1))
  end

  def edit
    @member = Member.find(params[:id])
  end

  def search
    # member.rbのsearchアクションを利用
    @members = Member.search(params[:q])
    render "index"
  end
end
