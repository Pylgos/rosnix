{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  ros2-medkit-cmake,
  ros2-medkit-gateway,
  ros2-medkit-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2_medkit_beacon_common";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."ros2_medkit_beacon_common";
  nativeBuildInputs = [ ament-cmake ros2-medkit-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ros2-medkit-gateway ros2-medkit-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "nlohmann-json-dev" ]; };
  buildInputs = [ ament-cmake ros2-medkit-cmake ];
  propagatedBuildInputs = [ rclcpp ros2-medkit-gateway ros2-medkit-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" ]; };
  checkInputs = [ ament-cmake-clang-format ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_medkit_beacon_common" = substituteSource {
      src = fetchgit {
        name = "ros2_medkit_beacon_common-source";
        url = "https://github.com/ros2-gbp/ros2_medkit-release.git";
        rev = "c9666d238f39db3332427a140e37f1cac0d5d2b5";
        hash = "sha256-VyaCeqpKCPSJtt/73Oz/i4z/2xi6+c7k8DF455swlZg=";
      };
    };
  });
  meta = {
    description = "Shared library for ros2_medkit beacon discovery plugins";
  };
})
