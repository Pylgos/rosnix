{
  ament-cmake,
  ament-cmake-pytest,
  ament-cmake-python,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclpy,
  rosSystemPackages,
  rosbag2-cpp,
  rosbag2-py,
  rosbag2-storage,
  rosbag2-storage-mcap,
  rosbag2-storage-sqlite3,
  rosidl-runtime-py,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "classic_bags";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."classic_bags";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ rclcpp rclpy ];
  propagatedBuildInputs = [ builtin-interfaces rosbag2-cpp rosbag2-py rosbag2-storage rosidl-runtime-py ];
  checkInputs = [ ament-cmake-pytest rosbag2-storage-mcap rosbag2-storage-sqlite3 std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "classic_bags" = substituteSource {
      src = fetchgit {
        name = "classic_bags-source";
        url = "https://github.com/ros2-gbp/classic_bags-release.git";
        rev = "e2538f43275fa7e7c37016cad69ba2a72e9dff4e";
        hash = "sha256-ZJSMrs9eRmeojheIs6GQcdz6FbdvasObPF8AjZg6XQM=";
      };
    };
  });
  meta = {
    description = "A ROS 2 interface in the style of ROS 1 for reading and writing bag files";
  };
})
