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
  mrpt_libopengl,
  mrpt_libposes,
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
    mrpt_libobs = substituteSource {
      src = fetchgit {
        name = "mrpt_libobs-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "e573d484e10e5a56f3467d970ef582dbfb668501";
        hash = "sha256-sZuSTYyw1WQgY2VRJNpoYVcms8vw8v0gvg4X5XA3ysA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_libobs";
  version = "2.13.8-1";
  src = sources.mrpt_libobs;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ament_cmake pkg-config ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ assimp cv_bridge ffmpeg freeglut freenect glfw3 libGL libGLU libjpeg libpcap libusb1 mrpt_libopengl mrpt_libposes opencv python3Packages.pip python3Packages.pybind11 rclcpp rosbag2_storage tinyxml-2 udev wxGTK32 xorg.libXrandr zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "liboctomap-dev" "libopenni2-dev" "libxxf86vm" ];
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (obs C++ libraries). This package contains: mrpt-obs, mrpt-topography";
  };
}
