{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  point_cloud_interfaces,
  point_cloud_transport,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    zstd_point_cloud_transport = substituteSource {
      src = fetchFromGitHub {
        name = "zstd_point_cloud_transport-source";
        owner = "ros2-gbp";
        repo = "point_cloud_transport_plugins-release";
        rev = "0d35ca2082c89ce87ebeec290ae8223306abc7d0";
        hash = "sha256-RAgGj5fZQ4dleHmWEA4Zomp+z0qKm6tp+8iVV72xlHk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "zstd_point_cloud_transport";
  version = "4.0.1-1";
  src = sources.zstd_point_cloud_transport;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pluginlib point_cloud_interfaces point_cloud_transport rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libzstd-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "zstd_point_cloud_transport provides a plugin to point_cloud_transport for sending point clouds encoded with lib";
  };
}
