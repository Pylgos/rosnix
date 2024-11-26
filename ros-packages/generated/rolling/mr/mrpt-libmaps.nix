{
  ament-cmake,
  buildCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-libobs,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rosbag2-storage,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mrpt_libmaps";
  version = "2.14.5-1";
  src = finalAttrs.passthru.sources."mrpt_libmaps";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ cv-bridge mrpt-libobs rclcpp rosbag2-storage ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mrpt_libmaps" = substituteSource {
      src = fetchgit {
        name = "mrpt_libmaps-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "cef2a4fce27c013500d10eeeffaadf7080e517ae";
        hash = "sha256-UwSX6tjOysCiMNFphjByZrwxZaDWUd129RRhuH9/do0=";
      };
    };
  });
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (maps C++ libraries). This package contains: mrpt-maps, mrpt-graphs";
  };
})
