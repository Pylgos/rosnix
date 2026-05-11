{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rcpputils,
  rcutils,
  rosSystemPackages,
  substituteSource,
  test-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_test_common";
  version = "0.34.0-1";
  src = finalAttrs.passthru.sources."rosbag2_test_common";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ rclcpp rclcpp-action rcpputils rcutils test-msgs ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ rclcpp rclcpp-action rcpputils rcutils test-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_test_common" = substituteSource {
      src = fetchgit {
        name = "rosbag2_test_common-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "9bc9449daf50b50ab869c94115c4f4e33f50bf20";
        hash = "sha256-U7PvOiF3KPqV8DcXCGX7pkTUIRiXYq2ufc8LdL6Txy4=";
      };
    };
  });
  meta = {
    description = "Commonly used test helper classes and fixtures for rosbag2";
  };
})
