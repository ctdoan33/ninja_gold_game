class RpgController < ApplicationController
  def index
    unless session[:gold]
      session[:gold] = 0
    end
    unless session[:log]
      session[:log] = []
    end
  end

  def farm
    timestring = Time.now.strftime("(%Y/%m/%d %I:%M %P)")
    delta = rand(10..20)
    session[:gold] += delta
    session[:log].insert(0, ["Earned #{delta} gold from the farm! #{timestring}", "green"])
    redirect_to "/"
  end

  def cave
    timestring = Time.now.strftime("(%Y/%m/%d %I:%M %P)")
    delta = rand(5..10)
    session[:gold] += delta
    session[:log].insert(0, ["Earned #{delta} gold from the cave! #{timestring}", "green"])
    redirect_to "/"
  end

  def casino
    timestring = Time.now.strftime("(%Y/%m/%d %I:%M %P)")
    delta = rand(-50..50)
    session[:gold] += delta
    if session[:gold] <= 0
      session[:gold] = 0
      session["log"].insert(0, ["Entered a casino and lost all your gold... Ouch... #{timestring}", "red"])
    elsif  delta >= 0
      session["log"].insert(0, ["Entered a casino and won #{delta} gold! #{timestring}", "green"])
    else
      session["log"].insert(0, ["Entered a casino and lost #{-delta} gold... Ouch... #{timestring}", "red"])
    end
    redirect_to "/"
  end

  def house
    timestring = Time.now.strftime("(%Y/%m/%d %I:%M %P)")
    delta = rand(2..5)
    session[:gold] += delta
    session[:log].insert(0, ["Earned #{delta} gold from the house! #{timestring}", "green"])
    redirect_to "/"
  end
end
