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
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    examples_rclpy_minimal_publisher-46e87448dadb5671d4688a05ecf121c0c03abab9 = substituteSource {
      src = fetchgit {
        name = "examples_rclpy_minimal_publisher-46e87448dadb5671d4688a05ecf121c0c03abab9-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "46e87448dadb5671d4688a05ecf121c0c03abab9";
        hash = "sha256-VysiiWLtXoquWvhGtov2Uj90jvJ+GFRDkAGu9KUIMjg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclpy_minimal_publisher";
  version = "0.19.4-1";
  src = sources.examples_rclpy_minimal_publisher-46e87448dadb5671d4688a05ecf121c0c03abab9;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclpy std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Examples of minimal publishers using rclpy.";
  };
}
