{
  ament-cmake-core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2-io,
  mkSourceSet,
  mrt-cmake-modules,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "lanelet2_projection" = substituteSource {
      src = fetchgit {
        name = "lanelet2_projection-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "fff72d3814a62cd10db6c93defe2dc00cadac50b";
        hash = "sha256-o4Gx/d7ijKvebHUq8BO78HeTfCKTIkE1raVOjESdhR4=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "lanelet2_projection";
  version = "1.2.1-6";
  src = sources."lanelet2_projection";
  nativeBuildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ mrt-cmake-modules ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ lanelet2-io ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "geographiclib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  meta = {
    description = "Lanelet2 projection library for lat/lon to local x/y conversion";
  };
}
