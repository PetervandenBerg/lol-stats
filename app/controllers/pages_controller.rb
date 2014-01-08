class PagesController < ApplicationController
  def home
    f1name = params[:firstfriend]
    f2name = params[:secondfriend]
    @chosen_type = params["type"].to_i
    if user_signed_in?
      @playerstats = HTTParty.get("http://prod.api.pvp.net/api/lol/euw/v1.1/summoner/by-name/#{current_user.player_name.gsub(" ", "%20")}?api_key=71fe3349-ebec-432a-b43c-60910b46a6f5")
      @playersummery = HTTParty.get("http://prod.api.pvp.net/api/lol/euw/v1.2/stats/by-summoner/#{current_user.summoner_id}/summary?api_key=71fe3349-ebec-432a-b43c-60910b46a6f5")
      @playerrecentgames = HTTParty.get("http://prod.api.pvp.net/api/lol/euw/v1.2/game/by-summoner/#{current_user.summoner_id}/recent?api_key=71fe3349-ebec-432a-b43c-60910b46a6f5")
      @playerrankedstats = HTTParty.get("http://prod.api.pvp.net/api/lol/euw/v2.2/league/by-summoner/#{current_user.summoner_id}?api_key=71fe3349-ebec-432a-b43c-60910b46a6f5")
      if f1name.present? 
        @friend1stats = HTTParty.get("http://prod.api.pvp.net/api/lol/euw/v1.1/summoner/by-name/#{f1name.gsub(" ", "%20")}?api_key=71fe3349-ebec-432a-b43c-60910b46a6f5")
      end 
      if f2name.present? 
        @friend2stats = HTTParty.get("http://prod.api.pvp.net/api/lol/euw/v1.1/summoner/by-name/#{f2name.gsub(" ", "%20")}?api_key=71fe3349-ebec-432a-b43c-60910b46a6f5")
      end
    end
  end

  def about
  end
end
