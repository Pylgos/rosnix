{
  ament-cmake,
  buildCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-libbase,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rosbag2-storage,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mrpt_libtclap";
  version = "2.14.10-1";
  src = finalAttrs.passthru.sources."mrpt_libtclap";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake cv-bridge mrpt-libbase rclcpp ros-environment rosbag2-storage ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "assimp-dev" "eigen" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pkg-config" "pybind11-dev" "python3-pip" "suitesparse" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake cv-bridge mrpt-libbase rclcpp ros-environment rosbag2-storage ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "eigen" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pkg-config" "pybind11-dev" "python3-pip" "suitesparse" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mrpt_libtclap" = substituteSource {
      src = fetchgit {
        name = "mrpt_libtclap-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "0e4ff0a62c71dc02591a2284b4101ed70ca30f4d";
        hash = "sha256-fSn4gX1oyfh3mDed5aUf7r6WWUfp4nrP2U/BY26CziE=";
      };
    };
  });
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (tclap C++ library).\n  This package contains: mrpt-tclap\n  ";
  };
})
