{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mrt_cmake_modules,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    lanelet2_core-5630708c5df854376fa1a16947d6172dc6468b1f = substituteSource {
      src = fetchgit {
        name = "lanelet2_core-5630708c5df854376fa1a16947d6172dc6468b1f-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "5630708c5df854376fa1a16947d6172dc6468b1f";
        hash = "sha256-Nz/Uglhw2hDL1gfYqEdDLJHWEOErA4wg5rDzu3S1wik=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_core";
  version = "1.2.1-1";
  src = sources.lanelet2_core-5630708c5df854376fa1a16947d6172dc6468b1f;
  nativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ mrt_cmake_modules ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  meta = {
    description = "Lanelet2 core module";
  };
}
