class PasswordsController < ApplicationController

  # localhost:3000/passwordのURLをアドレスバーに貼り付けた時などに、マイページへ誘導させるためのshowアクション
  def show
    redirect_to :account
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    current_password = account_params[:current_password]

    if current_password.present?
      if@member.authenticate(current_password)# 送られてきたパスが正しいか確認
        @member.assign_attributes(account_params)
        if @member.save
          redirect_to :account, notice: "パスワードを変更しました"
        else
          render :edit
        end
      else
        @member.errors.add(:current_password, :wrong)#　:wrongのエラーメッセージ
        render :edit
      end
    else
      @member.errors.add(:current_password, :empty)#　:emptyのエラーメッセージ
      render :edit
    end
  end

  private def account_params
    params.require(:account).permit(
      :current_password,
      :password,
      :password_comfirmation
    )
  end
end
