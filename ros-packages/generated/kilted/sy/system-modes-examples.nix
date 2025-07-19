{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-system-modes,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  ros2launch,
  rosSystemPackages,
  substituteSource,
  system-modes,
  system-modes-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "system_modes_examples";
  version = "0.9.0-6";
  src = finalAttrs.passthru.sources."system_modes_examples";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ launch launch-system-modes rclcpp rclcpp-lifecycle ros2launch system-modes system-modes-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch launch-system-modes rclcpp rclcpp-lifecycle ros2launch system-modes system-modes-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-gmock ament-cmake-gtest ament-cmake-pep257 ament-cmake-uncrustify ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "system_modes_examples" = substituteSource {
      src = fetchgit {
        name = "system_modes_examples-source";
        url = "https://github.com/ros2-gbp/system_modes-release.git";
        rev = "c103c9f0bd77772f7f7067a682fcf6d7e9436c07";
        hash = "sha256-0kfAi8ExAnUicuzTFtWKNQwRZP8qipcdbz4XUrg7EQM=";
      };
    };
  });
  meta = {
    description = "\n    Example systems and according launch files for the system_modes\n    package.\n  ";
  };
})
