{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  rosSystemPackages,
  soccer_vision_3d_msgs,
  soccer_vision_attribute_msgs,
  substituteSource,
  visualization_msgs,
}:
let
  sources = rec {
    soccer_vision_3d_rviz_markers = substituteSource {
      src = fetchFromGitHub {
        name = "soccer_vision_3d_rviz_markers-source";
        owner = "ros2-gbp";
        repo = "soccer_vision_3d_rviz_markers-release";
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
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy soccer_vision_3d_msgs soccer_vision_attribute_msgs visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Package that converts soccer_vision_3d_msgs to RViz markers";
  };
}
