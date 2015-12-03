require 'open-uri'

class MoodstockApi
  include HTTMultiParty
  base_uri 'api.moodstocks.com/v2'
  digest_auth 'ss2cffsonl88hv3zlrav', 'o184xlH69RU1V1ZK'

  def echo(query)
    self.class.get '/echo', query: query
  end

  def save_reference(reference_image)
    file = open reference_image.image.url
    response = self.class.put "/ref/#{reference_image.friendly_id}", query: {image_file: file}
    
    if response['id'] != reference_image.friendly_id || ![false, true].include?(response['is_update'])
      raise "unexpected response from add ref: #{response}"
    end

  end

  def delete_reference(reference_image)
    self.class.delete "/ref/#{reference_image.friendly_id}"
  end

  def list_references
    self.class.get('/stats/refs')['ids']
  end

  def search(file)
    self.class.post("/search", query: {image_file: file})
  end

end