{
  ament-cmake,
  buildCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-libgui,
  mrpt-libmaps,
  mrpt-libslam,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rosbag2-storage,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mrpt_libhwdrivers";
  version = "2.14.10-1";
  src = finalAttrs.passthru.sources."mrpt_libhwdrivers";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake cv-bridge mrpt-libgui mrpt-libmaps mrpt-libslam rclcpp ros-environment rosbag2-storage ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pkg-config" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake cv-bridge mrpt-libgui mrpt-libmaps mrpt-libslam rclcpp ros-environment rosbag2-storage ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pkg-config" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mrpt_libhwdrivers" = substituteSource {
      src = fetchgit {
        name = "mrpt_libhwdrivers-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "da85fc5f4daed6317471b6cfe3a32aeeb5069526";
        hash = "sha256-wnVsSJ2qTRHola8WGrEeP3KiHaD8CpdxjrLiLbbZXxU=";
      };
    };
  });
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (hwdrivers C++ libraries).\n  This package contains: mrpt-hwdrivers, mrpt-comms\n  ";
  };
})
