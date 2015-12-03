RSpec.configure do |config|
  
  config.before(:each) do
    allow_any_instance_of(MoodstockApi).to receive(:save_reference).and_return(true)
  end

end
