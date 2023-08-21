require "test_helper"

class LocationTest < ActiveSupport::TestCase
  test 'valid location' do
    location = Location.new(name: 'Manila', latitude: 10.2312, longitude: -120.3123)
    assert location.valid?
  end

  test 'invalid without latitude' do
    location = Location.new(name: 'Manila', longitude: -12.332)
    refute location.valid?
    assert_not_empty location.errors[:latitude], 'should validate latitude to be present'
  end

  test 'invalid without longitude' do
    location = Location.new(name: 'Manila', latitude: -56.8932)
    refute location.valid?
    assert_not_empty location.errors[:longitude], 'should validate longitude to be present'
  end
end
