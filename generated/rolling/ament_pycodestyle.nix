{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    ament_pycodestyle = substituteSource {
      src = fetchgit {
        name = "ament_pycodestyle-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "4a6fe66afc81455e7c1d234d8d149e226af72fc6";
        hash = "sha256-PRAH4qMWsZfuV6QVDxo472LXI8bGtUnTv71iVfxv528=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_pycodestyle";
  version = "0.18.1-1";
  src = sources.ament_pycodestyle;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pycodestyle ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.pycodestyle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to check code against the style conventions in PEP 8 and generate xUnit test result files.";
  };
}
