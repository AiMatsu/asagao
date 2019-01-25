class SessionsController < ApplicationController
  def create
    member = Member.find_by(name: params[:name])
    if member&.authenticate(params[:password])
      # ぼっち演算子(&.)で、変数memberがnilの時のエラー発生を回避
      session[:member_id] = member.id
    else
      flash.alert = "名前とパスが一致しません"
    end
    redirect_to :root
  end

  def destroy
    session.delete(:member_id)
    redirect_to :root
  end
end
