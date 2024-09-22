{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  launch_testing_ros,
  ros2cli,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ros2pkg = substituteSource {
      src = fetchFromGitHub {
        name = "ros2pkg-source";
        owner = "ros2-gbp";
        repo = "ros2cli-release";
        rev = "1cfd8c26024f1bb5696e6389ee7197e137b90ec8";
        hash = "sha256-g+sC73+O+uYoTYMGSauFm+Q4+0Y/Nwfaldpou5TGQO8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2pkg";
  version = "0.32.1-1";
  src = sources.ros2pkg;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_copyright ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" "python3-empy" "python3-importlib-resources" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python ros2cli ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pkg-resources" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_flake8 ament_pep257 ament_xmllint launch launch_testing launch_testing_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  meta = {
    description = "The pkg command for ROS 2 command line tools.";
  };
}
