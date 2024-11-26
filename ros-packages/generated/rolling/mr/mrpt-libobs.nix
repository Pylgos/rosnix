{
  ament-cmake,
  buildCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-libopengl,
  mrpt-libposes,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rosbag2-storage,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mrpt_libobs";
  version = "2.14.5-1";
  src = finalAttrs.passthru.sources."mrpt_libobs";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ cv-bridge mrpt-libopengl mrpt-libposes rclcpp rosbag2-storage ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "mrpt_libobs" = substituteSource {
        src = fetchgit {
          name = "mrpt_libobs-source";
          url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
          rev = "4f5f2b3f75ca07e9b3ab4c40fcccbc66c1d5fc18";
          hash = "sha256-bbHpt6uOJ/rP+aUfRVfF1KkjQBMVkUjZiYoQUdVzojc=";
        };
      };
    });
  };
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (obs C++ libraries). This package contains: mrpt-obs, mrpt-topography";
  };
})
