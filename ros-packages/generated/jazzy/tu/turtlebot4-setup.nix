{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
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
        rev = "ed4b0c6500a05dcfb6637303e16ecc9b06934e2c";
        hash = "sha256-Pko5/FnJRtrAsVXfE60I6fWrq3ZHJL1CRvna+/5THZo=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_setup";
  version = "2.0.2-1";
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
