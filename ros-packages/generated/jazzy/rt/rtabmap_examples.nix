{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  imu_filter_madgwick,
  mkSourceSet,
  rosSystemPackages,
  rtabmap_odom,
  rtabmap_rviz_plugins,
  rtabmap_slam,
  rtabmap_util,
  rtabmap_viz,
  substituteSource,
  tf2_ros,
  velodyne,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "rtabmap_examples" = substituteSource {
      src = fetchgit {
        name = "rtabmap_examples-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "8e54240bb15fee8d600556ea62c159d42c28a742";
        hash = "sha256-Whv9ONhmVWQMEXXoDXnouATtpKTsimj2slZlxGe7Irk=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rtabmap_examples";
  version = "0.21.5-3";
  src = sources."rtabmap_examples";
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ imu_filter_madgwick rtabmap_odom rtabmap_rviz_plugins rtabmap_slam rtabmap_util rtabmap_viz tf2_ros velodyne ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RTAB-Map's example launch files.";
  };
}
