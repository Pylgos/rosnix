{
  ament-cmake-core,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-cmake-test,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  mkSourceSet,
  osrf-pycommon,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_common";
  version = "1.4.2-1";
  src = finalAttrs.passthru.sources."nav2_common";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-python launch launch-ros osrf-pycommon rclpy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-types-pyyaml" "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-python launch launch-ros osrf-pycommon rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-types-pyyaml" "python3-yaml" ]; };
  checkInputs = [ ament-cmake-pytest ament-cmake-test ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nav2_common" = substituteSource {
      src = fetchgit {
        name = "nav2_common-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "b59a127bba33c6e21970bdf6d29c505bc9816397";
        hash = "sha256-z+JXTwvyrYsDghaOxzTmw1Rpl/Hfdkd6O2SD6l1mhQk=";
      };
    };
  });
  meta = {
    description = "Common support functionality used throughout the navigation 2 stack";
  };
})
