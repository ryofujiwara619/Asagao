class MembersController < ApplicationController
  def index
    @members = Member.order("number")
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new(birthday: Date.new(1980, 1, 1))
  end

  def create
    @member = Member.new(params[:member])
    if @member.save
      redirect_to member_path(@member.id), notine: "会員を登録しました"
    else
      render "new"
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
