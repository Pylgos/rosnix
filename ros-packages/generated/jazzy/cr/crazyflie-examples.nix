{
  ament-cmake,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentCmakePackage,
  crazyflie-py,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "crazyflie_examples";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."crazyflie_examples";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ crazyflie-py rclpy ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ crazyflie-py rclpy ];
  checkInputs = [ ament-cmake-pytest ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "crazyflie_examples" = substituteSource {
      src = fetchgit {
        name = "crazyflie_examples-source";
        url = "https://github.com/ros2-gbp/crazyswarm2-release.git";
        rev = "634c530e2263012014f8821d03ba808269dfa0cf";
        hash = "sha256-GShVsvR4bnTMCPq02SCHXPZ1Hy2CnJptKmkHMg4Kuf4=";
      };
    };
  });
  meta = {
    description = "Examples for the Crazyswarm2 ROS stack";
  };
})
