{
  ament_cmake_auto,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  ouxt_lint_common,
  rclcpp,
  std_msgs,
  substituteSource,
  visualization_msgs,
}:
let
  sources = rec {
    fluent_rviz = substituteSource {
      src = fetchgit {
        name = "fluent_rviz-source";
        url = "https://github.com/ros2-gbp/fluent_rviz-release.git";
        rev = "dfc47e81339f939273e719512fd2ddac32195178";
        hash = "sha256-/LmzIiGEHhv+jlon28dyJAjyB233kvyupBzUS01rdjA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fluent_rviz";
  version = "0.0.3-4";
  src = sources.fluent_rviz;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rclcpp std_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ouxt_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A library which makes Rviz fluent. Powered by C++17";
  };
}
