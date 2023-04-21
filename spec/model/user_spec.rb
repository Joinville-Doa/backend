require 'rails_helper'

RSpec.describe User, type: :model do
  it "usuário atributos inválidos" do
    user = User.new(email: "johndoe@example.com")
    expect(user).to be_invalid
  end

  it "usuário atributos válidos" do
    user = User.new(email: "kanamystewart@gmail.com", password: "123456")
    expect(user).to be_valid
  end
end
