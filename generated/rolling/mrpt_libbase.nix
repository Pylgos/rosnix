{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosSystemPackages,
  ros_environment,
  rosbag2_storage,
  substituteSource,
}:
let
  sources = rec {
    mrpt_libbase = substituteSource {
      src = fetchgit {
        name = "mrpt_libbase-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "6b9223bb743d4fdb300053e2c183cca5f7ff7942";
        hash = "sha256-sPfEEjJTRrRRP14xqDcjqwm2zjZecUBQvMK5NX+KgwY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_libbase";
  version = "2.14.1-1";
  src = sources.mrpt_libbase;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament_cmake ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge rclcpp rosbag2_storage ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "eigen" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pybind11-dev" "python3-pip" "suitesparse" "tbb" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (core C++ libraries). This package contains: mrpt-io, mrpt-serialization, mrpt-random, mrpt-system, mrpt-rtti, mrpt-containers, mrpt-typemeta, mrpt-core, mrpt-random, mrpt-config, mrpt-expr";
  };
}
