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
  fuse-graphs,
  gtest-vendor,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fuse_variables";
  version = "1.3.3-1";
  src = finalAttrs.passthru.sources."fuse_variables";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-ros fuse-core gtest-vendor pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libceres-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-ros fuse-core gtest-vendor pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libceres-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common fuse-graphs rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "fuse_variables" = substituteSource {
      src = fetchgit {
        name = "fuse_variables-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "66b9853f59ede3eda5caa76e39eadd7972fa0bdb";
        hash = "sha256-xfm902qQ7Ecehb/nZqLrr2Z352w//KKhl4YkdvGdpZA=";
      };
    };
  });
  meta = {
    description = "\n    The fuse_variables package provides a set of commonly used variable types, such as 2D and 3D positions, \\\n    orientations, velocities, and accelerations.\n  ";
  };
})
