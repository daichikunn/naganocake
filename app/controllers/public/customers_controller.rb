class Public::CustomersController < ApplicationController


  def show

  end

  def edit
    @customer = Customer.find(current_customer.id)

  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
     redirect_to customers_mypage_path
  end



  def check
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session#強制的ログアウト、退会したのにできてないことを防ぐ
    # flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end


end