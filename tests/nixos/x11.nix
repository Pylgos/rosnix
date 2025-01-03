{ lib, ... }:
{
  config = {
    services.xserver.displayManager.lightdm.enable = true;
    services.displayManager.autoLogin = {
      enable = true;
      user = "root";
    };

    # lightdm by default doesn't allow auto login for root, which is
    # required by some nixos tests. Override it here.
    security.pam.services.lightdm-autologin.text = lib.mkForce ''
      auth     requisite pam_nologin.so
      auth     required  pam_succeed_if.so quiet
      auth     required  pam_permit.so

      account  include   lightdm

      password include   lightdm

      session  include   lightdm
    '';

    services.xserver.enable = true;

    # Use IceWM as the window manager.
    # Don't use a desktop manager.
    services.displayManager.defaultSession = lib.mkDefault "none+icewm";
    services.xserver.windowManager.icewm.enable = true;
  };
}
