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
  geometry_msgs,
  glfw3,
  libGL,
  libGLU,
  libjpeg,
  libpcap,
  libusb1,
  mrpt_libmaps,
  nav_msgs,
  opencv,
  pkg-config,
  python3Packages,
  rclcpp,
  ros_environment,
  rosbag2_storage,
  sensor_msgs,
  std_msgs,
  stereo_msgs,
  substituteSource,
  tf2,
  tinyxml-2,
  udev,
  wxGTK32,
  xorg,
  zlib,
}:
let
  sources = rec {
    mrpt_libros_bridge = substituteSource {
      src = fetchgit {
        name = "mrpt_libros_bridge-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "7b5241e569cfddd8de7cc4a69bd7b855697fb5dc";
        hash = "sha256-L3BWVCQaeLcJyfREEBVO3vpiEAxlRDHum/CRQEvy3MI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_libros_bridge";
  version = "2.13.8-1";
  src = sources.mrpt_libros_bridge;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ament_cmake pkg-config ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ assimp cv_bridge ffmpeg freeglut freenect geometry_msgs glfw3 libGL libGLU libjpeg libpcap libusb1 mrpt_libmaps nav_msgs opencv python3Packages.pip python3Packages.pybind11 rclcpp rosbag2_storage sensor_msgs std_msgs stereo_msgs tf2 tinyxml-2 udev wxGTK32 xorg.libXrandr zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "liboctomap-dev" "libopenni2-dev" "libxxf86vm" ];
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (ros2bridge C++ library). This package contains: mrpt-ros2bridge";
  };
}
