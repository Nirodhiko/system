# prompt
function fish_prompt
  if fish_is_root_user
    echo (set_color red) \n'# ' (set_color normal)
  else
    echo (set_color blue) \n'> ' (set_color normal)
  end
end

# greeting
function fish_greeting
  # echo Hello friend!
  # echo The time is (set_color yellow; date +%T; set_color normal) and this machine is called $hostname
end

# vi mode
function fish_mode_prompt
end