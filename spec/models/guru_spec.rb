require 'rails_helper'

RSpec.describe Guru, type: :model do
  it { expect(create(:guru)).to be_valid}
end
