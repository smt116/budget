module LayoutTests
  extend ActiveSupport::Testing::Declarative

  test 'when authenticated should contain login, incomes, new expense, budgets and members links' do
    sign_in users(:user_with_wallet_1)
    get :index
    assert_select 'a', 'user_with_wallet_1@budget.shellyapp.com'
    assert_select 'a', I18n.t('header.incomes')
    assert_select 'a', I18n.t('header.expenses')
    assert_select 'a', I18n.t('header.budgets')
    assert_select 'a', I18n.t('header.members')
  end

  test 'should be message with actual balance' do
    sign_in users(:user_with_wallet_2)
    get :index
    assert_select 'ul.pull-right' do
      assert_select 'a', "#{I18n.t('header.balance')}: #{number_to_currency(800)}"
    end
  end

end