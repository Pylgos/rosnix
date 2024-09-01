{
  ament_cmake,
  assimp,
  buildRosPackage,
  cmake,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg,
  freeglut,
  freenect,
  glfw3,
  libGL,
  libGLU,
  libjpeg,
  libpcap,
  libusb1,
  mrpt_libgui,
  mrpt_libhwdrivers,
  mrpt_libmaps,
  mrpt_libslam,
  mrpt_libtclap,
  opencv,
  pkg-config,
  python3Packages,
  rclcpp,
  ros_environment,
  rosbag2_storage,
  substituteSource,
  tinyxml-2,
  udev,
  wxGTK32,
  xorg,
  zlib,
}:
let
  sources = rec {
    mrpt_libapps = substituteSource {
      src = fetchgit {
        name = "mrpt_libapps-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "660d6774e5f20849957066b9e3875ed2b0d9e07e";
        hash = "sha256-ARXYU5ncfQ4p1JGOcEMwzZUTHwx3S4u6Thv5FBXdBHU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_libapps";
  version = "2.13.7-3";
  src = sources.mrpt_libapps;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ament_cmake pkg-config ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ assimp cv_bridge ffmpeg freeglut freenect glfw3 libGL libGLU libjpeg libpcap libusb1 mrpt_libgui mrpt_libhwdrivers mrpt_libmaps mrpt_libslam mrpt_libtclap opencv python3Packages.pip python3Packages.pybind11 rclcpp rosbag2_storage tinyxml-2 udev wxGTK32 xorg.libXrandr zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "liboctomap-dev" "libopenni2-dev" "libxxf86vm" ];
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (apps C++ libraries). This package contains: mrpt-apps lib, mrpt-graphslam";
  };
}
