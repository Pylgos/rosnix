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
let
  sources = mkSourceSet (sources: {
    "mrpt_libhwdrivers" = substituteSource {
      src = fetchgit {
        name = "mrpt_libhwdrivers-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "2837c91201f17b1ba9eaffad7a11dbb701fe9d4b";
        hash = "sha256-OMo+hqOKSpBW4dsZs1bH5dD6/iFq3l5FRXIiZD+ivAA=";
      };
      substitutions = [
      ];
    };
  });
in
buildCmakePackage (finalAttrs: {
  pname = "mrpt_libhwdrivers";
  version = "2.14.5-1";
  src = finalAttrs.passthru.sources."mrpt_libhwdrivers";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv-bridge mrpt-libgui mrpt-libmaps mrpt-libslam rclcpp rosbag2-storage ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (hwdrivers C++ libraries). This package contains: mrpt-hwdrivers, mrpt-comms";
  };
})
