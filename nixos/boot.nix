{ config, pkgs, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Hide the systemd-boot menu entirely (hold a key during boot to show it).
  boot.loader.timeout = 0;

  # Silent boot & shutdown — no kernel messages, no systemd status, no cursor.
  boot.kernelParams = [
    "quiet"
    "splash"
    "loglevel=3"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
    "systemd.show_status=false"
    "vt.global_cursor_default=0"
  ];
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;

  # Use systemd in the initrd so Plymouth can show a splash from the very start.
  boot.initrd.systemd.enable = true;

  # Plymouth covers the screen during boot and shutdown so no text is ever shown.
  boot.plymouth = {
    enable = true;
    theme = "bgrt";
  };
}
