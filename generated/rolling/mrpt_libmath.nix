{
  ament_cmake,
  assimp,
  buildRosPackage,
  cmake,
  cv_bridge,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  ffmpeg,
  freeglut,
  freenect,
  glfw3,
  libGL,
  libGLU,
  libjpeg,
  libpcap,
  libusb1,
  mrpt_libbase,
  opencv,
  pkg-config,
  python3Packages,
  rclcpp,
  ros_environment,
  rosbag2_storage,
  substituteSource,
  suitesparse,
  tinyxml-2,
  udev,
  wxGTK32,
  xorg,
  zlib,
}:
let
  sources = rec {
    mrpt_libmath = substituteSource {
      src = fetchgit {
        name = "mrpt_libmath-source";
        url = "https://github.com/ros2-gbp/mrpt_ros-release.git";
        rev = "1c6fdcf25c44b3cda04bd5f9bebc3b1ad0b37725";
        hash = "sha256-sQBbXcczllUYkzYwGuHJ5jKZciCGvu3cl7CjE5flK/s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_libmath";
  version = "2.13.7-3";
  src = sources.mrpt_libmath;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [ ament_cmake pkg-config ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ assimp cv_bridge eigen ffmpeg freeglut freenect glfw3 libGL libGLU libjpeg libpcap libusb1 mrpt_libbase opencv python3Packages.pip python3Packages.pybind11 rclcpp rosbag2_storage suitesparse tinyxml-2 udev wxGTK32 xorg.libXrandr zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "liboctomap-dev" "libopenni2-dev" "libxxf86vm" ];
  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (math C++ libraries). This package contains: mrpt-math";
  };
}
