{
  ament-copyright,
  ament-flake8,
  ament-mypy,
  ament-pep257,
  buildAmentPythonPackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  ros2bag,
  rosSystemPackages,
  rosbag2-py,
  rosidl-runtime-py,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rosbag2_to_video" = substituteSource {
      src = fetchgit {
        name = "rosbag2_to_video-source";
        url = "https://github.com/ros2-gbp/rosbag2_to_video-release.git";
        rev = "c5fa0cb1200dd9348df1591f9ad9b8a8125eb3f5";
        hash = "sha256-cIIIILgxEls8aRJ8CNJa9vP6dRz4Xw0ARTQudqviVWI=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentPythonPackage (finalAttrs: {
  pname = "rosbag2_to_video";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."rosbag2_to_video";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv-bridge rclpy ros2bag rosbag2-py rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" "python3-opencv" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-mypy ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Command line tool to create a video from a rosbag recording";
  };
})
