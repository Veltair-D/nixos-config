# Edit this configuration file to define what should be installed on 
# your system. Help is available in the configuration.nix(5) man page 
# and in the NixOS manual (accessible by running "nixos-help")

{ config, pkgs, ... }:

{

  imports =
    [


	#audio
	./audio/general.nix
##	./audio/bluetooth.nix
        
	#networking
##	./networking/networks.nix
	
	#wayland
	./wayland/general.nix
	./wayland/window-manager.nix
	./wayland/login-manager.nix
    ];

#Bootloader
boot.loader.grub.enable = true;
boot.loader.grub.device = "/dev/sda";
boot.loader.grub.useOSProber = true;

networking.hostName = "nixos"; # Define your hostName
# networking.wireless.enable = true # Enables wireless support via wpa_supplicant

# Enable networking
networking.networkmanager.enable = true;


  time.timeZone = "America/Lima";

# Locale properties
i18n.defaultLocale = "en_US.UTF-8";



  environment.sessionVariables = rec {
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XCURSOR_SIZE = "24";
  };
    
  users.users.veltair = {
     isNormalUser = true;
     extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [

     ];
   };

   nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    vim
    neovim
    wget
    tmux
    fastfetch
    vi
   ];
  
  # Some programs need SUID wrappers, can be configured further or 
  # are started in user sessions.
  #programs.mtr.enable = true;
  #programs.gnupg.agent = {
  #  enable = true;
  #  enableSSHSupport = true;
  #};

  # List services that you want to enable

  #services.openssh.enable = true;
  services.printing.enable = true;    
 
  system.stateVersion = "25.05";
}
