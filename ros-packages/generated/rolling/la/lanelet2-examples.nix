{
  ament-cmake-core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2-core,
  lanelet2-io,
  lanelet2-matching,
  lanelet2-projection,
  lanelet2-python,
  lanelet2-routing,
  lanelet2-traffic-rules,
  mkSourceSet,
  mrt-cmake-modules,
  ros2cli,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "lanelet2_examples" = substituteSource {
      src = fetchgit {
        name = "lanelet2_examples-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "3046775d4ef1580e110ffe268ac51e8ccf6b358b";
        hash = "sha256-jbMdHabSoOnjj7zKI54sz2P3Nrq8NRpYCHYb7pekzX0=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "lanelet2_examples";
  version = "1.2.1-6";
  src = sources."lanelet2_examples";
  nativeBuildInputs = [ ament-cmake-core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ mrt-cmake-modules ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ lanelet2-core lanelet2-io lanelet2-matching lanelet2-projection lanelet2-python lanelet2-routing lanelet2-traffic-rules ros2cli ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  meta = {
    description = "Examples for working with Lanelet2";
  };
}
