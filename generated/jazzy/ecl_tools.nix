{
  ament_cmake,
  buildRosPackage,
  ecl_build,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ecl_tools = substituteSource {
      src = fetchgit {
        name = "ecl_tools-source";
        url = "https://github.com/ros2-gbp/ecl_tools-release.git";
        rev = "edfc0a38f86fa95d0d26a7c5f051a2bc7642399d";
        hash = "sha256-z/lKRKqVLxiSJ9nSnQyQh/Dsk/+USiDw68+Nfg9Fc0U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_tools";
  version = "1.0.3-5";
  src = sources.ecl_tools;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_build ecl_license ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Tools and utilities for ecl development.";
  };
}
