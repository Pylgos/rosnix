{
  ament_cmake,
  assimp,
  buildRosPackage,
  cmake,
  cv_bridge,
  eigen,
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
  opencv,
  pkg-config,
  python3Packages,
  rclcpp,
  ros_environment,
  rosbag2_storage,
  substituteSource,
  suitesparse,
  tinyxml-2,
  udev,
  wxGTK32,
  xorg,
  zlib,
}:
let
  sources = rec {
    mrpt_libmath = substituteSource {
      src = fetchgit {
        name = "mrpt_libmath-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "33650070537bcd07afd7eec5dfc420003eaded0d";
        hash = "sha256-OL2D7J5+nms4XhVS0dnlpKbfJwSe91I8qO4nV2SyhWg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_libmath";
  version = "2.13.8-1";
  src = sources.mrpt_libmath;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ament_cmake pkg-config ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ assimp cv_bridge eigen ffmpeg freeglut freenect glfw3 libGL libGLU libjpeg libpcap libusb1 mrpt_libbase opencv python3Packages.pip python3Packages.pybind11 rclcpp rosbag2_storage suitesparse tinyxml-2 udev wxGTK32 xorg.libXrandr zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "liboctomap-dev" "libopenni2-dev" "libxxf86vm" ];
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (math C++ libraries). This package contains: mrpt-math";
  };
}
