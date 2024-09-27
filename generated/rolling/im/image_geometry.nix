{
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    image_geometry = substituteSource {
      src = fetchgit {
        name = "image_geometry-source";
        url = "https://github.com/ros2-gbp/vision_opencv-release.git";
        rev = "703aa0fc8d80c67f488253b2a4e574bbd93757a2";
        hash = "sha256-y4DJ9zOSPtaMJqyHbcxWEc8zhZkKGJwDlT8xyVy114A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "image_geometry";
  version = "4.1.0-1";
  src = sources.image_geometry;
  nativeBuildInputs = [ ament_cmake_python ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" "python3-deprecated" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "`image_geometry` contains C++ and Python libraries for interpreting images geometrically. It interfaces the calibration parameters in sensor_msgs/CameraInfo messages with OpenCV functions such as image rectification, much as cv_bridge interfaces ROS sensor_msgs/Image with OpenCV data types.";
  };
}
