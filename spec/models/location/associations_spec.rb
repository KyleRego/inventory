# frozen_string_literal: true

RSpec.describe Location do
  subject { Location.new }

  it { should have_many(:items).dependent(:nullify) }
end
