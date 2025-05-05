{
  ament-cmake,
  buildCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  mrpt-libmaps,
  nav-msgs,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rosbag2-storage,
  sensor-msgs,
  std-msgs,
  stereo-msgs,
  substituteSource,
  tf2,
}:
buildCmakePackage (finalAttrs: {
  pname = "mrpt_libros_bridge";
  version = "2.14.8-1";
  src = finalAttrs.passthru.sources."mrpt_libros_bridge";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake rclcpp ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" "pybind11-dev" ]; };
  propagatedBuildInputs = [ cv-bridge geometry-msgs mrpt-libmaps nav-msgs rosbag2-storage sensor-msgs std-msgs stereo-msgs tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mrpt_libros_bridge" = substituteSource {
      src = fetchgit {
        name = "mrpt_libros_bridge-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "eb0c697eda50b9efcebf93bbeb7cc81238ddbdf2";
        hash = "sha256-t2dsHDDXGHRMORQyhz26gkKFkSrqjz9hIhRSXtzlxGE=";
      };
    };
  });
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (ros2bridge C++ library). This package contains: mrpt-ros2bridge";
  };
})
