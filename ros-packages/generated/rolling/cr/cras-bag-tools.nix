{
  ament-cmake,
  ament-cmake-python,
  ament-cmake-ros,
  buildAmentCmakePackage,
  builtin-interfaces,
  cras-lint,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  rosbag2-py,
  rosidl-runtime-py,
  sensor-msgs,
  substituteSource,
  tf2-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cras_bag_tools";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."cras_bag_tools";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ament-cmake-ros ];
  propagatedNativeBuildInputs = [ builtin-interfaces cv-bridge rclpy rosbag2-py rosidl-runtime-py sensor-msgs tf2-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-marisa" "python3-matplotlib" "python3-tqdm" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ament-cmake-ros ];
  propagatedBuildInputs = [ builtin-interfaces cv-bridge rclpy rosbag2-py rosidl-runtime-py sensor-msgs tf2-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-marisa" "python3-matplotlib" "python3-tqdm" ]; };
  checkInputs = [ cras-lint ];
  passthru.sources = mkSourceSet (sources: {
    "cras_bag_tools" = substituteSource {
      src = fetchgit {
        name = "cras_bag_tools-source";
        url = "https://github.com/ros2-gbp/cras_ros_utils-release.git";
        rev = "2d0777985b8a59368be4523544622b493d3e916a";
        hash = "sha256-jWwygsJpuj/KN/mw5/QAlb89+q4i9DcGefH5Tfyo7ZA=";
      };
    };
  });
  meta = {
    description = "Various utilities to work with bag files";
  };
})
