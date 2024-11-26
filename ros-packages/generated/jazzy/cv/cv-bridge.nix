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
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  propagatedBuildInputs = [ ament-index-python rclcpp rcpputils sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" "libboost-python" "libboost-python-dev" "libopencv-dev" "python3-opencv" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cv_bridge" = substituteSource {
      src = fetchgit {
        name = "cv_bridge-source";
        url = "https://github.com/ros2-gbp/vision_opencv-release.git";
        rev = "d30ec40f8ebf943aaa16b860166e53a49a6f6174";
        hash = "sha256-2p4HVqVl4NRdIrRsJnGkfOapNAmOhKZN1R2KMmpxG/w=";
      };
    };
  });
  meta = {
    description = "This contains CvBridge, which converts between ROS2 Image messages and OpenCV images.";
  };
})
