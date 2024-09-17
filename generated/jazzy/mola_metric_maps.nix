{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_xmllint,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mp2p_icp,
  mrpt_libmaps,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    mola_metric_maps = substituteSource {
      src = fetchgit {
        name = "mola_metric_maps-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "cb91103f08874e6538713e9341f32d279decd3f8";
        hash = "sha256-fzdSSmRbXxNjZgSCh3StlfZkLf4KlHp4XmT9dly/9Yw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_metric_maps";
  version = "1.2.0-1";
  src = sources.mola_metric_maps;
  nativeBuildInputs = [ ament_cmake ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament_cmake_xmllint ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mola_common mp2p_icp mrpt_libmaps ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Advanced metric map classes, using the generic `mrpt::maps::CMetricMap` interface, for use in other MOLA odometry and SLAM modules.";
  };
}
