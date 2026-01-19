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
  version = "3.0.0-2";
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
        rev = "b522161fa3f03b11c6eda1c09bb880ca27a92c86";
        hash = "sha256-szoeW4Gcu3mOiBmp0aGdiDov5WACTm6K66IMgbqhv8U=";
      };
    };
  });
  meta = {
    description = "Various utilities to work with bag files";
  };
})
