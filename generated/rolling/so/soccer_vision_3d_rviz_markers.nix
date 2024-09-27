{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
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
    soccer_vision_3d_rviz_markers-16ff40e17d867a539d60d883f2a2f818152022e4 = substituteSource {
      src = fetchgit {
        name = "soccer_vision_3d_rviz_markers-16ff40e17d867a539d60d883f2a2f818152022e4-source";
        url = "https://github.com/ros2-gbp/soccer_vision_3d_rviz_markers-release.git";
        rev = "16ff40e17d867a539d60d883f2a2f818152022e4";
        hash = "sha256-69FCCxAxZa6hSkchZAWrsNb7uNruIRhwkIConj14Ue4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_vision_3d_rviz_markers";
  version = "1.0.0-1";
  src = sources.soccer_vision_3d_rviz_markers-16ff40e17d867a539d60d883f2a2f818152022e4;
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
