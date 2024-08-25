{
  ament_cmake,
  buildRosPackage,
  ecl_build,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_tools = substituteSource {
      src = fetchgit {
        name = "ecl_tools-source";
        url = "https://github.com/ros2-gbp/ecl_tools-release.git";
        rev = "becfda330d937361223823b68049732e9e01d293";
        hash = "sha256-z/lKRKqVLxiSJ9nSnQyQh/Dsk/+USiDw68+Nfg9Fc0U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_tools";
  version = "1.0.3-4";
  src = sources.ecl_tools;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Tools and utilities for ecl development.";
  };
}
