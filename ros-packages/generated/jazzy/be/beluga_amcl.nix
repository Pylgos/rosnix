{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  beluga,
  beluga_ros,
  bondcpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  message_filters,
  mkSourceSet,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  rosSystemPackages,
  std_srvs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "beluga_amcl" = substituteSource {
      src = fetchgit {
        name = "beluga_amcl-source";
        url = "https://github.com/ros2-gbp/beluga-release.git";
        rev = "0a28678898be6587e8ef29c6a5d96109761837b1";
        hash = "sha256-o5w8tS4fYcmaf9rRYPabtPGEs27Xf50+6nRPhhPN7B8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "beluga_amcl";
  version = "2.0.2-1";
  src = sources."beluga_amcl";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ beluga beluga_ros bondcpp message_filters rclcpp rclcpp_components rclcpp_lifecycle std_srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "An AMCL node implementation for ROS2 using Beluga.";
  };
}
