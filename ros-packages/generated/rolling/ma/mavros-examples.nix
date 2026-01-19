{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mavros,
  mavros-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  trajectory-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mavros_examples";
  version = "2.14.0-1";
  src = finalAttrs.passthru.sources."mavros_examples";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module geometry-msgs mavros mavros-msgs rclpy sensor-msgs std-msgs std-srvs trajectory-msgs ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ eigen3-cmake-module geometry-msgs mavros mavros-msgs rclpy sensor-msgs std-msgs std-srvs trajectory-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mavros_examples" = substituteSource {
      src = fetchgit {
        name = "mavros_examples-source";
        url = "https://github.com/ros2-gbp/mavros-release.git";
        rev = "bca25cd221c15a3ecf314c206daa8d632871be22";
        hash = "sha256-jPPIsV4z2V1Eu40y7VhKSQ8nOuKUQ34g/omCqxdD8K0=";
      };
    };
  });
  meta = {
    description = "\n    Example scripts demonstrating MAVROS usage\n  ";
  };
})
