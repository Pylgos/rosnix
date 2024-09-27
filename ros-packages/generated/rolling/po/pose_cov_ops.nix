{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_cmake_xmllint,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mrpt_libposes,
  mrpt_libros_bridge,
  nav_msgs,
  rclcpp,
  rosSystemPackages,
  ros_environment,
  sensor_msgs,
  std_msgs,
  stereo_msgs,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    pose_cov_ops-db3c26f4cf8ae7377bf6bfea89a1f8f5d321c1c3 = substituteSource {
      src = fetchgit {
        name = "pose_cov_ops-db3c26f4cf8ae7377bf6bfea89a1f8f5d321c1c3-source";
        url = "https://github.com/ros2-gbp/pose_cov_ops-release.git";
        rev = "db3c26f4cf8ae7377bf6bfea89a1f8f5d321c1c3";
        hash = "sha256-ftJdad3w9XrnAQn/DRLfldWx8OMRbiX22JrSv1wmA3I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pose_cov_ops";
  version = "0.3.12-1";
  src = sources.pose_cov_ops-db3c26f4cf8ae7377bf6bfea89a1f8f5d321c1c3;
  nativeBuildInputs = [ ament_cmake ament_cmake_gmock ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament_cmake_xmllint ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge geometry_msgs mrpt_libposes mrpt_libros_bridge nav_msgs rclcpp sensor_msgs std_msgs stereo_msgs tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  meta = {
    description = "C++ library for SE(2)/SE(3) pose composition operations with uncertainty";
  };
}
