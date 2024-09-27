{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt_libmaps,
  rclcpp,
  rosSystemPackages,
  ros_environment,
  rosbag2_storage,
  substituteSource,
}:
let
  sources = rec {
    mrpt_libnav-8a039d1f25a3b5f470d7f8a1221e96e0f61b80ef = substituteSource {
      src = fetchgit {
        name = "mrpt_libnav-8a039d1f25a3b5f470d7f8a1221e96e0f61b80ef-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "8a039d1f25a3b5f470d7f8a1221e96e0f61b80ef";
        hash = "sha256-oN+iSunetggn3zAj2No4huwgQ9NhMWP7SO53xPCojis=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_libnav";
  version = "2.14.1-1";
  src = sources.mrpt_libnav-8a039d1f25a3b5f470d7f8a1221e96e0f61b80ef;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament_cmake ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge mrpt_libmaps rclcpp rosbag2_storage ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (nav C++ libraries). This package contains: mrpt-nav, mrpt-kinematics";
  };
}
