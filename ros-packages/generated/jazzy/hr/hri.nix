{
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  hri-msgs,
  magic-enum,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "hri";
  version = "2.9.0-1";
  src = finalAttrs.passthru.sources."hri";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ cv-bridge geometry-msgs hri-msgs magic-enum rclcpp rclcpp-lifecycle sensor-msgs std-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs hri-msgs magic-enum rclcpp rclcpp-lifecycle sensor-msgs std-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "hri" = substituteSource {
      src = fetchgit {
        name = "hri-source";
        url = "https://github.com/ros4hri/libhri-release.git";
        rev = "b2a5ba192a0b5c5289117428062f717d950a6170";
        hash = "sha256-bISh81fSRx9E1bff6J41n2ccueqC/L42aJ90NOmPKF0=";
      };
    };
  });
  meta = {
    description = "A wrapper library around the ROS4HRI ROS topics";
  };
})
