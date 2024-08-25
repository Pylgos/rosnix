{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nao_command_msgs,
  nao_sensor_msgs,
  python3Packages,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    nao_lola = substituteSource {
      src = fetchgit {
        name = "nao_lola-source";
        url = "https://github.com/ros2-gbp/nao_lola-release.git";
        rev = "118cf9006f0df881ecfd36e5d42c76f15c8b2637";
        hash = "sha256-4PYS6ui19PLLdGv3RK/Yocfe4mLcF7codg2N1R+L2NM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nao_lola";
  version = "1.3.0-1";
  src = sources.nao_lola;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nao_command_msgs nao_sensor_msgs python3Packages.boost rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Packages that allow communicating with the NAO's Lola middle-ware.";
  };
}
