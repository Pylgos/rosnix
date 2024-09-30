{
  nixConfig = {
    extra-substituters = [ "https://rosnix.cachix.org" ];
    extra-trusted-public-keys = [ "rosnix.cachix.org-1:FiqDDVzOzRB9i2Ai/sHxXkhRr71LRF/3i8QEjju70o8=" ];
  };

  inputs = {
    rosnix.url = "github:Pylgos/rosnix/release";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      rosnix,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = rosnix.legacyPackages.${system}.default;
        inherit (pkgs) rosPackages;
      in
      {
        devShells.default = rosPackages.mkRosWorkspaceShell {
          buildInputs = [
            rosPackages.desktop
            rosPackages.ros-gz
          ];
        };
      }
    );
}
