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
  version = "0.2.1-2";
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
        rev = "9abd9997a295cd76d879902f35eaa37ede070151";
        hash = "sha256-8+FIcqzIHZrfEeATgko1oxSpJA3YY5lis1+sEd2Y/Rk=";
      };
    };
  });
  meta = {
    description = "Catch2 testing framework for ROS 2 unit and integration tests.";
  };
})
