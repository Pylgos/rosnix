{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt_libopengl,
  rclcpp,
  rosSystemPackages,
  ros_environment,
  rosbag2_storage,
  substituteSource,
}:
let
  sources = rec {
    mrpt_libgui-59de98766e83886a0e65b6383b14f0cc9a50ad92 = substituteSource {
      src = fetchgit {
        name = "mrpt_libgui-59de98766e83886a0e65b6383b14f0cc9a50ad92-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "59de98766e83886a0e65b6383b14f0cc9a50ad92";
        hash = "sha256-sS3q5QtQF1+gFm2p2IQviML72NMyKsH27+KffVECGII=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_libgui";
  version = "2.14.1-1";
  src = sources.mrpt_libgui-59de98766e83886a0e65b6383b14f0cc9a50ad92;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament_cmake ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge mrpt_libopengl rclcpp rosbag2_storage ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (GUI C++ libraries). This package contains: mrpt-gui, nanogui";
  };
}
