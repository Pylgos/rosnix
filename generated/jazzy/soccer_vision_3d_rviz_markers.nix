{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  soccer_vision_3d_msgs,
  soccer_vision_attribute_msgs,
  substituteSource,
  visualization_msgs,
}:
let
  sources = rec {
    soccer_vision_3d_rviz_markers = substituteSource {
      src = fetchgit {
        name = "soccer_vision_3d_rviz_markers-source";
        url = "https://github.com/ros2-gbp/soccer_vision_3d_rviz_markers-release.git";
        rev = "0f9e4a04b95b9a0bb158ed0d6529cd8ce72cea53";
        hash = "sha256-69FCCxAxZa6hSkchZAWrsNb7uNruIRhwkIConj14Ue4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_vision_3d_rviz_markers";
  version = "1.0.0-2";
  src = sources.soccer_vision_3d_rviz_markers;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy soccer_vision_3d_msgs soccer_vision_attribute_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Package that converts soccer_vision_3d_msgs to RViz markers";
  };
}
