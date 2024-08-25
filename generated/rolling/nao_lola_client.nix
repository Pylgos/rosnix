{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nao_lola_command_msgs,
  nao_lola_sensor_msgs,
  python3Packages,
  rcl_interfaces,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    nao_lola_client = substituteSource {
      src = fetchgit {
        name = "nao_lola_client-source";
        url = "https://github.com/ros2-gbp/nao_lola-release.git";
        rev = "4be01ae3cd50032105f32732f29481e574c9c1ed";
        hash = "sha256-EC4It9qdpgQxnpVxErStgFzOy5Uq4NCqJ4mbwm4CWjk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nao_lola_client";
  version = "1.3.0-1";
  src = sources.nao_lola_client;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nao_lola_command_msgs nao_lola_sensor_msgs python3Packages.boost rcl_interfaces rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Packages that allow communicating with the NAO's Lola middle-ware.";
  };
}
