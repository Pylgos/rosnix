{
  ament_cmake_core,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2_core,
  lanelet2_io,
  lanelet2_maps,
  lanelet2_projection,
  lanelet2_traffic_rules,
  mrt_cmake_modules,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    lanelet2_matching = substituteSource {
      src = fetchFromGitHub {
        name = "lanelet2_matching-source";
        owner = "ros2-gbp";
        repo = "lanelet2-release";
        rev = "e120080f9db30d7662445e1114d585757305a81f";
        hash = "sha256-umrqsdgMBtb04ryHzY6h/Yb+wrZUXVnyvb+0AeF2ebI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_matching";
  version = "1.2.1-1";
  src = sources.lanelet2_matching;
  nativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ mrt_cmake_modules ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ lanelet2_core lanelet2_traffic_rules ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ lanelet2_io lanelet2_maps lanelet2_projection ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  meta = {
    description = "Library to match objects to lanelets";
  };
}
