{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  ros2launch,
  rosSystemPackages,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "catch_ros2";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."catch_ros2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ros2launch std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp ros2launch std-srvs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "catch_ros2" = substituteSource {
      src = fetchgit {
        name = "catch_ros2-source";
        url = "https://github.com/ros2-gbp/catch_ros2-release.git";
        rev = "6ec2ef0a472b046ed78010373adf9b6458e0c275";
        hash = "sha256-gYwng5weuw1aZP9m/QrBDElMUZIiLWZrtDvHPebWVpk=";
      };
    };
  });
  meta = {
    description = "Catch2 testing framework for ROS 2 unit and integration tests.";
  };
})
