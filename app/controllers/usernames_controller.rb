class UsernamesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :redirect_to_username_form

  def new; end

  def update
    if username_params[:username].present? && current_user.update!(username_params)
      redirect_to dashboard_path, notice: 'Учётная запись обновлена'
    else
      flash.now[:alert] = if username_params[:username].blank?
                            'Укажите ваш никнейм'
                          else
                            current_user.errors.full_messages.join(', ')
                          end
      render :new, status: :unprocessable_entity
    end
  end

  private

  def username_params
    params.require(:user).permit(:username, :display_name, :avatar)
  end
end
