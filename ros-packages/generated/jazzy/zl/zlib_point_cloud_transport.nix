{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  point_cloud_interfaces,
  point_cloud_transport,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "zlib_point_cloud_transport" = substituteSource {
      src = fetchgit {
        name = "zlib_point_cloud_transport-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport_plugins-release.git";
        rev = "7ee85cdad99b057df5abe7e7838a7ff93b777499";
        hash = "sha256-6p7TAA4qe+yQNDQ7FIDzFaaOnV7BI4qEEdwbK1R6Ss0=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "zlib_point_cloud_transport";
  version = "4.0.1-1";
  src = sources."zlib_point_cloud_transport";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pluginlib point_cloud_interfaces point_cloud_transport rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "zlib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "zlib_point_cloud_transport provides a plugin to point_cloud_transport for sending point clouds encoded with zlib";
  };
}