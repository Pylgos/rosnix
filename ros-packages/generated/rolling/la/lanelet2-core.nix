{
  ament-cmake-core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrt-cmake-modules,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "lanelet2_core" = substituteSource {
      src = fetchgit {
        name = "lanelet2_core-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "47f8a7582fc3a5b5ef4050e1053a3ed6c0d03d20";
        hash = "sha256-Nz/Uglhw2hDL1gfYqEdDLJHWEOErA4wg5rDzu3S1wik=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "lanelet2-core";
  version = "1.2.1-6";
  src = sources."lanelet2_core";
  nativeBuildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ mrt-cmake-modules ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  meta = {
    description = "Lanelet2 core module";
  };
}