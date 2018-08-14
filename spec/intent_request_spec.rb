require 'rspec'
require 'alexa_rubykit'

describe AlexaRubykit::IntentRequest do

  let :json_request do
    JSON.parse(File.read('fixtures/sample-IntentRequest.json'))
  end

  let :request do
    AlexaRubykit.build_request(json_request)
  end

  it do
    expect(request).to be_a(described_class)
  end

  context '#slots' do
    let :slots do
      request.slots
    end

    it do
      expect(slots).to be_a(Hash)

      expect(slots.size).to eq(1)

      expect(slots).to have_key(:ZodiacSign)

      expect(slots[:ZodiacSign]).to be_a(AlexaRubykit::Slot)

      expect(slots[:ZodiacSign].name).to eq('ZodiacSign')

      expect(slots[:ZodiacSign].value).to eq('virgo')
    end
  end
end
