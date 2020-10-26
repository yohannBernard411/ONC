class TraductionService
  def self.trad(clothe, name, description, category, delivery, option, language)
    I18n.locale = language.to_sym

    url = URI("https://microsoft-translator-text.p.rapidapi.com/translate?profanityAction=NoAction&textType=plain&to=#{language}&api-version=3.0")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["x-rapidapi-host"] = ENV['X_RAPIDAPI_HOST']
    request["x-rapidapi-key"] = ENV['X_RAPIDAPI_KEY']
    request["content-type"] = ENV['CONTENT_TYPE']
    request["accept"] = ENV['ACCEPT']
    request.body = "[ {  \"Text\": \"#{name}\" }]"
    response = http.request(request)
    clothe.name = response.read_body.split(":")[5].split(",")[0][1..-2]
    request.body = "[ {  \"Text\": \"#{description}\" }]"
    response = http.request(request)
    clothe.description = response.read_body.split(":")[5].split(",")[0][1..-2]
    request.body = "[ {  \"Text\": \"#{category}\" }]"
    response = http.request(request)
    clothe.category = response.read_body.split(":")[5].split(",")[0][1..-2]
    request.body = "[ {  \"Text\": \"#{delivery}\" }]"
    response = http.request(request)
    clothe.delivery = response.read_body.split(":")[5].split(",")[0][1..-2]
    request.body = "[ {  \"Text\": \"#{option}\" }]"
    response = http.request(request)
    clothe.option = response.read_body.split(":")[5].split(",")[0][1..-2] if clothe.option
    clothe.save!
    I18n.locale = :fr
  end
end
