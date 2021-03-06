require 'spec_helper'

RSpec.describe Protobuf::Field::Sint64Field do

  it_behaves_like :packable_field, described_class do
    let(:value) { [-1, 0, 1] }
  end

  let(:message) do
    Class.new(::Protobuf::Message) do
      optional :sint64, :some_field, 1
    end
  end

  # https://developers.google.com/protocol-buffers/docs/proto3#json
  describe '.{to_json, from_json}' do
    it 'serialises 0' do
      instance = message.new(some_field: 0)
      expect(instance.to_json(proto3: true)).to eq('{}')
      expect(instance.to_json).to eq('{"some_field":0}')
    end

    it 'serialises max value as string' do
      instance = message.new(some_field: described_class.max)
      expect(instance.to_json(proto3: true)).to eq('{"someField":"9223372036854775807"}')
      expect(instance.to_json).to eq('{"some_field":9223372036854775807}')
    end

    it 'serialises min value as string' do
      instance = message.new(some_field: described_class.min)
      expect(instance.to_json(proto3: true)).to eq('{"someField":"-9223372036854775808"}')
      expect(instance.to_json).to eq('{"some_field":-9223372036854775808}')
    end
  end
end
