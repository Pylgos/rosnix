{
  ament-cmake,
  buildCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-libmaps,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rosbag2-storage,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mrpt_libnav";
  version = "2.14.5-1";
  src = finalAttrs.passthru.sources."mrpt_libnav";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ cv-bridge mrpt-libmaps rclcpp rosbag2-storage ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mrpt_libnav" = substituteSource {
      src = fetchgit {
        name = "mrpt_libnav-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "b96ffb5ba95e15766fea3928153ec66237c491e9";
        hash = "sha256-+bfJs6HmmvF0rt3AIDWMMD4uN4tC0EfPceJt6jmkgGI=";
      };
    };
  });
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (nav C++ libraries). This package contains: mrpt-nav, mrpt-kinematics";
  };
})
