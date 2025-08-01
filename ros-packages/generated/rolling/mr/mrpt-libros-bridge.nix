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
  version = "2.14.11-1";
  src = finalAttrs.passthru.sources."mrpt_libros_bridge";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake cv-bridge geometry-msgs mrpt-libmaps nav-msgs rclcpp ros-environment rosbag2-storage sensor-msgs std-msgs stereo-msgs tf2 ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pkg-config" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake cv-bridge geometry-msgs mrpt-libmaps nav-msgs rclcpp ros-environment rosbag2-storage sensor-msgs std-msgs stereo-msgs tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pkg-config" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mrpt_libros_bridge" = substituteSource {
      src = fetchgit {
        name = "mrpt_libros_bridge-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "ceb6b8fa8b0899851c33d66b6dfa77a8562bc1cc";
        hash = "sha256-CGbNPulhxievfCsPGwbVrFkoOAVGiikFUYS3pVQmc4k=";
      };
    };
  });
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (ros2bridge C++ library).\n  This package contains: mrpt-ros2bridge\n  ";
  };
})
