require "opentok"

class Room < ApplicationRecord
    before_create :set_opentok_id

    private

    def set_opentok_id
        opentok = OpenTok::OpenTok.new(Rails.application.credentials.vanage_api_key, Rails.application.credentials.vanage_api_secret)
        session = opentok.create_session
        self.vanage_session_id = session.session_id
    end
end
