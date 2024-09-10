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
    mrpt_libgui = substituteSource {
      src = fetchgit {
        name = "mrpt_libgui-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "d0c06b5d24a16f00447fb00a5db1620469b7a1db";
        hash = "sha256-xy62H6lCqt5KLnMgF7XjH6r34vXg44F8gTlY87T9/8c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_libgui";
  version = "2.13.8-1";
  src = sources.mrpt_libgui;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ament_cmake pkg-config ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ assimp cv_bridge ffmpeg freeglut freenect glfw3 libGL libGLU libjpeg libpcap libusb1 mrpt_libopengl opencv python3Packages.pip python3Packages.pybind11 rclcpp rosbag2_storage tinyxml-2 udev wxGTK32 xorg.libXrandr zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "liboctomap-dev" "libopenni2-dev" "libxxf86vm" ];
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (GUI C++ libraries). This package contains: mrpt-gui, nanogui";
  };
}
