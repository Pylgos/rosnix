{
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
            rosPackages.gz_sim_vendor
          ];
        };
      }
    );
}
