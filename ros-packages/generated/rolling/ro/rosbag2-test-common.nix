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
  python-cmake-module,
  rclcpp,
  rcutils,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_test_common";
  version = "0.29.0-1";
  src = finalAttrs.passthru.sources."rosbag2_test_common";
  nativeBuildInputs = [ ament-cmake ament-cmake-python python-cmake-module ];
  propagatedBuildInputs = [ rclcpp rcutils ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosbag2_test_common" = substituteSource {
        src = fetchgit {
          name = "rosbag2_test_common-source";
          url = "https://github.com/ros2-gbp/rosbag2-release.git";
          rev = "785e810d2134719ac3368cc00a97d8cdea35b286";
          hash = "sha256-IcJl9RPOKejz/YVyWoz/410Y3avGpq/PuywQZArxeso=";
        };
      };
    });
  };
  meta = {
    description = "Commonly used test helper classes and fixtures for rosbag2";
  };
})
