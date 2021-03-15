require 'test_helper'

describe ApplicationRecord do
  describe '.lookup_table?' do
    it 'returns false' do
      _(described_class).wont_be :lookup_table?
    end
  end
end
