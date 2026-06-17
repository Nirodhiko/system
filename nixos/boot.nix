{
  config,
  pkgs,
  lib,
  ...
}:

{
  # -----------------------------------------------------------------------
  # Bootloader
  # -----------------------------------------------------------------------
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hide the systemd-boot menu entirely (hold Space / a key during POST to show it).
  boot.loader.timeout = 0;

  # -----------------------------------------------------------------------
  # Kernel
  # -----------------------------------------------------------------------
  boot.kernelPackages = pkgs.linuxPackages_lts;

  # -----------------------------------------------------------------------
  # initrd (early userspace)
  # -----------------------------------------------------------------------
  # systemd-based initrd boots faster than the legacy shell-based one.
  boot.initrd.systemd.enable = true;

  # -----------------------------------------------------------------------
  # Kernel parameters
  # -----------------------------------------------------------------------
  boot.kernelParams = [
    # --- disable watchdog timers (reduces kernel overhead) ---
    "nowatchdog"
    "modprobe.blacklist=iTCO_wdt"

    # --- disable CPU vulnerability mitigations ---
    # On a low-spec CPU these can cost 10–30 % performance.
    # Only safe if this server runs trusted workloads in an isolated network.
    "mitigations=off"
  ];

  # -----------------------------------------------------------------------
  # Memory management
  # -----------------------------------------------------------------------
  # Compress swap in RAM — extends effective memory without hitting slow disk.
  # Far better than disk swap on a low-spec machine.
  zramSwap = {
    enable = true;
    # Portion of RAM to use as compressed swap. 50 % is a safe default.
    # Increase to 100 % if you have very little RAM (< 2 GB).
    memoryPercent = 50;
  };

  # --- sysctl tweaks for low-memory machines ---
  boot.kernel.sysctl = {
    # Avoid swapping until absolutely necessary. Default is 60.
    "vm.swappiness" = 10;

    # Retain directory and inode caches more aggressively.
    # Lower = cache stays longer, reducing disk I/O. Default is 100.
    "vm.vfs_cache_pressure" = 50;
  };

  # -----------------------------------------------------------------------
  # Misc housekeeping
  # -----------------------------------------------------------------------
  boot.tmp.cleanOnBoot = true;
}
