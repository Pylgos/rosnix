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
  version = "0.32.0-2";
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
        rev = "0c8ab84d212a364275dc044943c981874282b831";
        hash = "sha256-67EH77+90DevuPeRr8mxa/T8k4p/jDnlq+y+DE6a+EU=";
      };
    };
  });
  meta = {
    description = "Commonly used test helper classes and fixtures for rosbag2";
  };
})
