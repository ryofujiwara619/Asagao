class TopController < ApplicationController
  def index
    @message = "おはよう"
  end

  def about
    @page_title = "このサイトについて"
  end
end
