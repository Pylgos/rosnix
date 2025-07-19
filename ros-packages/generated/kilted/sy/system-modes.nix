{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-index-python,
  ament-lint-auto,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-ros,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  ros2run,
  rosSystemPackages,
  substituteSource,
  system-modes-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "system_modes";
  version = "0.9.0-6";
  src = finalAttrs.passthru.sources."system_modes";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces launch-ros rclcpp rclcpp-lifecycle system-modes-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces launch-ros rclcpp rclcpp-lifecycle system-modes-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-gmock ament-cmake-gtest ament-cmake-pep257 ament-cmake-uncrustify ament-index-python ament-lint-auto launch-testing-ament-cmake launch-testing-ros ros2run ];
  passthru.sources = mkSourceSet (sources: {
    "system_modes" = substituteSource {
      src = fetchgit {
        name = "system_modes-source";
        url = "https://github.com/ros2-gbp/system_modes-release.git";
        rev = "d53a9d05d1403ed077c0c9d408dffa06e4f2bc70";
        hash = "sha256-0KjnR6c32kc4yM0vwAGYI1LgRZn4tLfIZSO+UE2llbM=";
      };
    };
  });
  meta = {
    description = "\n    The system modes concept assumes that a robotics system is built\n    from components with a lifecycle. It adds a notion of (sub-)systems,\n    hiararchically grouping these nodes, as well as a notion of modes\n    that determine the configuration of these nodes and (sub-)systems in\n    terms of their parameter values.\n  ";
  };
})
