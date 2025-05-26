{
  ament-cmake,
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
  gtest-vendor,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse_variables";
  version = "1.2.3-1";
  src = finalAttrs.passthru.sources."fuse_variables";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-ros fuse-core gtest-vendor pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libceres-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-ros fuse-core gtest-vendor pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libceres-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_variables" = substituteSource {
      src = fetchgit {
        name = "fuse_variables-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "bb8ed8630f30eebaf52b98064752c5427c3fe580";
        hash = "sha256-4LmiGFSQWScH6s8reoODjsEhtLOk1+g5q3+l6F6fW1s=";
      };
    };
  });
  meta = {
    description = "\n    The fuse_variables package provides a set of commonly used variable types, such as 2D and 3D positions, \\\n    orientations, velocities, and accelerations.\n  ";
  };
})
