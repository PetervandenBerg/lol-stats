class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_summoner_id

  def set_summoner_id
    summoner_info = HTTParty.get("http://prod.api.pvp.net/api/lol/euw/v1.1/summoner/by-name/#{self.player_name.gsub(" ", "%20")}?api_key=71fe3349-ebec-432a-b43c-60910b46a6f5")
    self.summoner_id = summoner_info["id"]
  end
end
