class SubscribeToNewsletter
  def initialize(user_or_email)
    @email = user_or_email.is_a?(User) ? user.email : user_or_email
    @gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    @list_id = ENV['MAILCHIMP_LIST_ID']
  end

  def run
    @gibbon.lists(@list_id).members.create(
      body: {
        email_address: @email,
        status: "subscribed"
      }
    )
  end
end
