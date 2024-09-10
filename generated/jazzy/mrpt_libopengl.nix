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
  mrpt_libbase,
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
    mrpt_libopengl = substituteSource {
      src = fetchgit {
        name = "mrpt_libopengl-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "5ba265f8d041cf845cd2f99729ec51ba425b70e6";
        hash = "sha256-zLf/FKtOd88qKG1CEQqgBGMhRhctxEDufmv6xHq1Kss=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_libopengl";
  version = "2.13.8-1";
  src = sources.mrpt_libopengl;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ament_cmake pkg-config ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ assimp cv_bridge ffmpeg freeglut freenect glfw3 libGL libGLU libjpeg libpcap libusb1 mrpt_libbase mrpt_libposes opencv python3Packages.pip python3Packages.pybind11 rclcpp rosbag2_storage tinyxml-2 udev wxGTK32 xorg.libXrandr zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "liboctomap-dev" "libopenni2-dev" "libxxf86vm" ];
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (opengl/img C++ libraries). This package contains: mrpt-opengl, mrpt-img";
  };
}
