require 'spec_helper'
require 'puppet/type/pmp_data'

RSpec.describe 'the pmp_data type' do
  it 'loads' do
    expect(Puppet::Type.type(:pmp_data)).not_to be_nil
  end
end
