function zathura --description "Start zathura in fullscreen automatically"
    # Run under XWayland so xdotool can send F11.
    # GNOME's Mutter lacks the virtual-keyboard Wayland protocol needed by wtype.
    GDK_BACKEND=x11 command zathura $argv &
    # Wait a moment for the window to appear, then toggle fullscreen.
    sleep 0.4
    xdotool search --class zathura key F11
end
