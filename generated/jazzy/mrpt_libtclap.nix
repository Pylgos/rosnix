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
    mrpt_libtclap = substituteSource {
      src = fetchgit {
        name = "mrpt_libtclap-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "04895529dc41a4db297a9f74449c5753bb1d51e9";
        hash = "sha256-hGB6SoGXVzncZEH2Bur9xYqI13Razcu+SfsVdHCkvfQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_libtclap";
  version = "2.13.8-1";
  src = sources.mrpt_libtclap;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ament_cmake pkg-config ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ assimp cv_bridge eigen ffmpeg freeglut freenect glfw3 libGL libGLU libjpeg libpcap libusb1 mrpt_libbase opencv python3Packages.pip python3Packages.pybind11 rclcpp rosbag2_storage suitesparse tinyxml-2 udev wxGTK32 xorg.libXrandr zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "liboctomap-dev" "libopenni2-dev" "libxxf86vm" ];
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (tclap C++ library). This package contains: mrpt-tclap";
  };
}
