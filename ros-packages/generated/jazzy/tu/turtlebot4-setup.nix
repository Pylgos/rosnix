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
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_setup";
  version = "2.0.3-1";
  src = finalAttrs.passthru.sources."turtlebot4_setup";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rmw-cyclonedds-cpp rmw-fastrtps-cpp robot-upstart simple-term-menu-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "chrony" "curl" "network-manager" "socat" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rmw-cyclonedds-cpp rmw-fastrtps-cpp robot-upstart simple-term-menu-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "chrony" "curl" "network-manager" "socat" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_setup" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_setup-source";
        url = "https://github.com/ros2-gbp/turtlebot4_setup-release.git";
        rev = "d22ba9826a6f95d7b57c57f3a84a823d8c236ec9";
        hash = "sha256-qqrX3hMU7D5F7DmiJofuKZWTMIsk01TtzFdWW8mHqtQ=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 setup scripts";
  };
})
