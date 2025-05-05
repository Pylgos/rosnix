{
  ament-cmake,
  buildCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rosbag2-storage,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mrpt_libbase";
  version = "2.14.8-1";
  src = finalAttrs.passthru.sources."mrpt_libbase";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake rclcpp ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "pkg-config" "pybind11-dev" ]; };
  propagatedBuildInputs = [ cv-bridge rosbag2-storage ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "python3-pip" "suitesparse" "tbb" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mrpt_libbase" = substituteSource {
      src = fetchgit {
        name = "mrpt_libbase-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "b14be95e1a48ada872b2de7c4b21ea993c3210da";
        hash = "sha256-NEigXJ06zsWMQGTtdmdCH4BLnBeRNXspCuJnGH/qZZQ=";
      };
    };
  });
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (core C++ libraries). This package contains: mrpt-io, mrpt-serialization, mrpt-random, mrpt-system, mrpt-rtti, mrpt-containers, mrpt-typemeta, mrpt-core, mrpt-random, mrpt-config, mrpt-expr";
  };
})
