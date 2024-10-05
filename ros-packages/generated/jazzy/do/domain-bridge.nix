{
  ament-cmake,
  ament-cmake-gmock,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-testing,
  launch-testing-ament-cmake,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rcutils,
  rmw-connextdds,
  rmw-cyclonedds-cpp,
  rmw-fastrtps-cpp,
  rmw-implementation-cmake,
  rosSystemPackages,
  rosbag2-cpp,
  rosgraph-msgs,
  rosidl-default-generators,
  rosidl-default-runtime,
  rosidl-typesupport-cpp,
  substituteSource,
  test-msgs,
  zstd-vendor,
}:
let
  sources = mkSourceSet (sources: {
    "domain_bridge" = substituteSource {
      src = fetchgit {
        name = "domain_bridge-source";
        url = "https://github.com/ros2-gbp/domain_bridge-release.git";
        rev = "23216d613ab4e031c139bbcf42e6306f907b0d13";
        hash = "sha256-eajUFSE7L+45VSlUvbXcvd6RjjdERKimvpFjuXVbCO8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "domain_bridge";
  version = "0.5.0-5";
  src = finalAttrs.passthru.sources."domain_bridge";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rclcpp-components rcutils rosbag2-cpp rosidl-default-runtime rosidl-typesupport-cpp zstd-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common example-interfaces launch launch-testing launch-testing-ament-cmake rmw-connextdds rmw-cyclonedds-cpp rmw-fastrtps-cpp rmw-implementation-cmake rosgraph-msgs test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "ROS 2 Domain Bridge";
  };
})
