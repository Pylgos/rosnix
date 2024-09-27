{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt_libgui,
  mrpt_libhwdrivers,
  mrpt_libmaps,
  mrpt_libslam,
  mrpt_libtclap,
  rclcpp,
  rosSystemPackages,
  ros_environment,
  rosbag2_storage,
  substituteSource,
}:
let
  sources = rec {
    mrpt_libapps-6ebab7be7fa48289ed00fbcb19b6974bea380f26 = substituteSource {
      src = fetchgit {
        name = "mrpt_libapps-6ebab7be7fa48289ed00fbcb19b6974bea380f26-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "6ebab7be7fa48289ed00fbcb19b6974bea380f26";
        hash = "sha256-3sD+D+WZiUw0817z9HPv8QuxCQeD+1ELa4nXjtOZf7A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_libapps";
  version = "2.14.1-1";
  src = sources.mrpt_libapps-6ebab7be7fa48289ed00fbcb19b6974bea380f26;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament_cmake ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge mrpt_libgui mrpt_libhwdrivers mrpt_libmaps mrpt_libslam mrpt_libtclap rclcpp rosbag2_storage ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (apps C++ libraries). This package contains: mrpt-apps lib, mrpt-graphslam";
  };
}
