class Current < ActiveSupport::CurrentAttributes
  attribute :identity_token
  attribute :request_id, :user_agent, :ip_address

  def ip_address=(value)
    super
    self.identity_token ||= value
  end

  resets { Time.zone = nil }
end

