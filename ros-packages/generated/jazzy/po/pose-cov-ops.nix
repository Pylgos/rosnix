{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  mrpt-libposes,
  mrpt-libros-bridge,
  nav-msgs,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  stereo-msgs,
  substituteSource,
  tf2,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pose_cov_ops";
  version = "0.3.13-1";
  src = finalAttrs.passthru.sources."pose_cov_ops";
  nativeBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-xmllint ros-environment ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs mrpt-libposes mrpt-libros-bridge nav-msgs rclcpp sensor-msgs std-msgs stereo-msgs tf2 ];
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "pose_cov_ops" = substituteSource {
      src = fetchgit {
        name = "pose_cov_ops-source";
        url = "https://github.com/ros2-gbp/pose_cov_ops-release.git";
        rev = "ca6eb10256b4293df39020e7ac34a3d48f8e4e6a";
        hash = "sha256-WCVQfOvBWgHCzt+CebDkO3z2LXoE4E2kgaNHKGNp02M=";
      };
    };
  });
  meta = {
    description = "C++ library for SE(2)/SE(3) pose composition operations with uncertainty";
  };
})
