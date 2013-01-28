require 'test_helper'

class FacturacionControllerTest < ActionController::TestCase
  test "should get facturar" do
    get :facturar
    assert_response :success
  end

end
