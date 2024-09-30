{
  ament-cmake-core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2-core,
  lanelet2-io,
  lanelet2-maps,
  lanelet2-projection,
  lanelet2-routing,
  lanelet2-traffic-rules,
  mkSourceSet,
  mrt-cmake-modules,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "lanelet2_validation" = substituteSource {
      src = fetchgit {
        name = "lanelet2_validation-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "87bf0325bf0bae457a4dd104d10554118276f260";
        hash = "sha256-tAvB7lkQDSwBBpXUvHkuAzwo2zlSEbMsZr1Gy8AElXI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "lanelet2_validation";
  version = "1.2.1-1";
  src = sources."lanelet2_validation";
  nativeBuildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ mrt-cmake-modules ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ lanelet2-core lanelet2-io lanelet2-projection lanelet2-routing lanelet2-traffic-rules ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ lanelet2-maps ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  meta = {
    description = "Package for sanitizing lanelet maps";
  };
}
