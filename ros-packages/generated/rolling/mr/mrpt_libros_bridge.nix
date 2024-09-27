{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mkSourceSet,
  mrpt_libmaps,
  nav_msgs,
  rclcpp,
  rosSystemPackages,
  ros_environment,
  rosbag2_storage,
  sensor_msgs,
  std_msgs,
  stereo_msgs,
  substituteSource,
  tf2,
}:
let
  sources = mkSourceSet (sources: {
    "mrpt_libros_bridge" = substituteSource {
      src = fetchgit {
        name = "mrpt_libros_bridge-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "c21273ebec73b6f67d50a37f4740f98b0e047830";
        hash = "sha256-G1Cb2AKGw8ZTZRPwiS0bHyH19wbRyvT/ZGLhuVzQ55c=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "mrpt_libros_bridge";
  version = "2.14.1-1";
  src = sources."mrpt_libros_bridge";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament_cmake ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge geometry_msgs mrpt_libmaps nav_msgs rclcpp rosbag2_storage sensor_msgs std_msgs stereo_msgs tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (ros2bridge C++ library). This package contains: mrpt-ros2bridge";
  };
}
