{
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse-core,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse_variables";
  version = "1.1.5-1";
  src = finalAttrs.passthru.sources."fuse_variables";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ fuse-core pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libceres-dev" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ fuse-core pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libceres-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_variables" = substituteSource {
      src = fetchgit {
        name = "fuse_variables-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "a15d7bedf61caab63281b390b6bb56d954579228";
        hash = "sha256-ufsLzGKOp8Su+JUWlukan8o4M5kQZXAjvujQU9uexp8=";
      };
    };
  });
  meta = {
    description = "\n    The fuse_variables package provides a set of commonly used variable types, such as 2D and 3D positions, \\\n    orientations, velocities, and accelerations.\n  ";
  };
})
