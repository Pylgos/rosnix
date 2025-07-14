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
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."pose_cov_ops";
  nativeBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-xmllint cv-bridge geometry-msgs mrpt-libposes mrpt-libros-bridge nav-msgs rclcpp ros-environment sensor-msgs std-msgs stereo-msgs tf2 ];
  buildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake-xmllint cv-bridge geometry-msgs mrpt-libposes mrpt-libros-bridge nav-msgs rclcpp ros-environment sensor-msgs std-msgs stereo-msgs tf2 ];
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "pose_cov_ops" = substituteSource {
      src = fetchgit {
        name = "pose_cov_ops-source";
        url = "https://github.com/ros2-gbp/pose_cov_ops-release.git";
        rev = "8856dd07252c0da5a6d2438e1694c4f9335d1622";
        hash = "sha256-nxROH4/QpxnTve4uCn/shh4gZig6zDzVozg4LWdwGLo=";
      };
    };
  });
  meta = {
    description = "C++ library for SE(2)/SE(3) pose composition operations with uncertainty";
  };
})
