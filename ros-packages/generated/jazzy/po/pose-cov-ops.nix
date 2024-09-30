{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "pose_cov_ops" = substituteSource {
      src = fetchgit {
        name = "pose_cov_ops-source";
        url = "https://github.com/ros2-gbp/pose_cov_ops-release.git";
        rev = "9b23632294a6cf9f276756ef73601f1428ffbcd8";
        hash = "sha256-ftJdad3w9XrnAQn/DRLfldWx8OMRbiX22JrSv1wmA3I=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "pose_cov_ops";
  version = "0.3.12-1";
  src = sources."pose_cov_ops";
  nativeBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-xmllint ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv-bridge geometry-msgs mrpt-libposes mrpt-libros-bridge nav-msgs rclcpp sensor-msgs std-msgs stereo-msgs tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  meta = {
    description = "C++ library for SE(2)/SE(3) pose composition operations with uncertainty";
  };
}
