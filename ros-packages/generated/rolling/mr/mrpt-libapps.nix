{
  ament-cmake,
  buildRosPackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-libgui,
  mrpt-libhwdrivers,
  mrpt-libmaps,
  mrpt-libslam,
  mrpt-libtclap,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  rosbag2-storage,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "mrpt_libapps" = substituteSource {
      src = fetchgit {
        name = "mrpt_libapps-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "6cc972c461ad6d251a8786330ec3644283a5a39e";
        hash = "sha256-dUefkq0Y3iZCRVVRnlg6e05XgghQ/lu89E2ixFR63DQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "mrpt_libapps";
  version = "2.14.2-1";
  src = finalAttrs.passthru.sources."mrpt_libapps";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv-bridge mrpt-libgui mrpt-libhwdrivers mrpt-libmaps mrpt-libslam mrpt-libtclap rclcpp rosbag2-storage ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (apps C++ libraries). This package contains: mrpt-apps lib, mrpt-graphslam";
  };
})
