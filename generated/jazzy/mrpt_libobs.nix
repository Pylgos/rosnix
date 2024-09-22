{
  ament_cmake,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt_libopengl,
  mrpt_libposes,
  rclcpp,
  rosSystemPackages,
  ros_environment,
  rosbag2_storage,
  substituteSource,
}:
let
  sources = rec {
    mrpt_libobs = substituteSource {
      src = fetchgit {
        name = "mrpt_libobs-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "43d74a8fdbca351cf2a228c949cbee8a03a86baf";
        hash = "sha256-aSmnS4UQcJfjK0QPni1KtBN9wrWN9fI2qcQUeHsG0Iw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_libobs";
  version = "2.14.0-1";
  src = sources.mrpt_libobs;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament_cmake ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge mrpt_libopengl mrpt_libposes rclcpp rosbag2_storage ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp-dev" "ffmpeg" "glut" "libfreenect-dev" "libglfw3-dev" "libjpeg" "liboctomap-dev" "libopencv-dev" "libopenni2-dev" "libpcap" "libudev-dev" "libusb-1.0-dev" "libxrandr" "libxxf86vm" "opengl" "pybind11-dev" "python3-pip" "tinyxml2" "wx-common" "wxwidgets" "zlib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (obs C++ libraries). This package contains: mrpt-obs, mrpt-topography";
  };
}
