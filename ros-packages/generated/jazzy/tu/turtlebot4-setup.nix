{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmw-cyclonedds-cpp,
  rmw-fastrtps-cpp,
  robot-upstart,
  rosSystemPackages,
  simple-term-menu-vendor,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "turtlebot4_setup" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_setup-source";
        url = "https://github.com/ros2-gbp/turtlebot4_setup-release.git";
        rev = "f3525cd611c3d3e9595265fa9fc5e0f375f31368";
        hash = "sha256-zY/n2klyXJ5SgQPHt5FwyQA5r7gPvQRXswtN646+2s4=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "turtlebot4_setup";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."turtlebot4_setup";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "curl" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rmw-cyclonedds-cpp rmw-fastrtps-cpp robot-upstart simple-term-menu-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "chrony" "network-manager" "socat" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Turtlebot4 setup scripts";
  };
})
