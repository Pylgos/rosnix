{
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-ros,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-cmake-module,
  rclcpp,
  rcpputils,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cv_bridge";
  version = "4.1.0-1";
  src = finalAttrs.passthru.sources."cv_bridge";
  nativeBuildInputs = [ ament-cmake-ros python-cmake-module ];
  propagatedNativeBuildInputs = [ ament-index-python rclcpp rcpputils sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" "libboost-python" "libboost-python-dev" "libopencv-dev" "python3-numpy" "python3-opencv" ]; };
  buildInputs = [ ament-cmake-ros python-cmake-module ];
  propagatedBuildInputs = [ ament-index-python rclcpp rcpputils sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libboost-python" "libboost-python-dev" "libopencv-dev" "python3-numpy" "python3-opencv" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cv_bridge" = substituteSource {
      src = fetchgit {
        name = "cv_bridge-source";
        url = "https://github.com/ros2-gbp/vision_opencv-release.git";
        rev = "0fa77b760b54eb36e8cf648b442d3a5636aeb0fc";
        hash = "sha256-2p4HVqVl4NRdIrRsJnGkfOapNAmOhKZN1R2KMmpxG/w=";
      };
    };
  });
  meta = {
    description = "\n    This contains CvBridge, which converts between ROS2\n    Image messages and OpenCV images.\n  ";
  };
})
