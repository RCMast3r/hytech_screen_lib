{
  description = "Hytech dash screen library";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    utils.url = "github:numtide/flake-utils";
    hytech_hal.url = "github:RCMast3r/hytech_hal/hal_impl";
  };
  outputs = { self, nixpkgs, utils, hytech_hal }:
    let
      screen_lib_overlay = final: prev: {
        screen_lib = final.callPackage ./default.nix { };
      };
      my_overlays = [screen_lib_overlay hytech_hal.overlays.default ]; 
      pkgs = import nixpkgs {
            system = "x86_64-linux";
            overlays = [ self.overlays.default ];
      };
    in
    {
      overlays.default = nixpkgs.lib.composeManyExtensions my_overlays;
      
      packages.x86_64-linux =
        rec {
          screen_lib = pkgs.screen_lib;
          default = screen_lib;
        };

       

        devShells.x86_64-linux.default = 
        pkgs.mkShell rec {
            # Update the name to something that suites your project.
            name = "nix-devshell";
            packages = with pkgs; [
              # Development Tools
              gcc-arm-embedded
              cmake
            ];

            # Setting up the environment variables you need during
            # development.
            shellHook = let
              icon = "f121";
            in ''
              export PS1="$(echo -e '\u${icon}') {\[$(tput sgr0)\]\[\033[38;5;228m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]} (${name}) \\$ \[$(tput sgr0)\]"
            '';
          };
      
    };
}
