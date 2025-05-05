{
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "image_geometry";
  version = "4.1.0-1";
  src = finalAttrs.passthru.sources."image_geometry";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedNativeBuildInputs = [ sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" "python3-deprecated" ]; };
  buildInputs = [ ament-cmake-python ament-cmake-ros ];
  propagatedBuildInputs = [ sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" "python3-deprecated" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ];
  passthru.sources = mkSourceSet (sources: {
    "image_geometry" = substituteSource {
      src = fetchgit {
        name = "image_geometry-source";
        url = "https://github.com/ros2-gbp/vision_opencv-release.git";
        rev = "f5ea0ce5972556558784659e5a6c45b27176d2a0";
        hash = "sha256-y4DJ9zOSPtaMJqyHbcxWEc8zhZkKGJwDlT8xyVy114A=";
      };
    };
  });
  meta = {
    description = "\n    `image_geometry` contains C++ and Python libraries for interpreting images\n    geometrically. It interfaces the calibration parameters in sensor_msgs/CameraInfo\n    messages with OpenCV functions such as image rectification, much as cv_bridge\n    interfaces ROS sensor_msgs/Image with OpenCV data types.\n  ";
  };
})
