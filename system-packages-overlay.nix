{ lib, config }:
final: prev:
let
  prevPython3 =
    {
      # jazzy = prev.python312;
      jazzy = prev.python311; # python3.12 breaks sip4 and pyside2
      iron = prev.python310;
      humble = prev.python39;
      rolling = prev.python311;
    }
    .${config.distro};
in
{
  python3 = prevPython3 // {
    pkgs = prevPython3.pkgs.overrideScope (
      pyFinal: pyPrev:
      let
        pkgList =
          (prev.poetry2nix.mkPoetryPackages {
            projectDir = ./poetry;
            python = prevPython3;
            overrides = prev.poetry2nix.overrides.withDefaults (
              final: prev: {
                inherit (pyFinal) docutils flake8;
                flake8-builtins = prev.flake8-builtins.overridePythonAttrs (oldAttras: {
                  nativeBuildInputs = oldAttras.nativeBuildInputs ++ [ final.hatchling ];
                });
              }
            );
          }).poetryPackages;
        pkgsByNames = lib.listToAttrs (
          map (drv: {
            name = drv.pname;
            value = drv;
          }) pkgList
        );
      in
      {
        inherit (pkgsByNames)
          rosdistro
          catkin-pkg
          flake8-quotes
          flake8-comprehensions
          flake8-builtins
          colcon-common-extensions
          empy
          ;
      }
    );
  };
  python3Packages = final.python3.pkgs;
}
