{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  launch_testing_ros,
  mkSourceSet,
  ros2cli,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ros2pkg" = substituteSource {
      src = fetchgit {
        name = "ros2pkg-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "9e91f8b6683ac216c08a18be3e3142d1aa04f7d9";
        hash = "sha256-nherNPpJx1pcZEbS3RPwB3rqNKXsjqZw6xdth1sxBmo=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ros2pkg";
  version = "0.34.1-1";
  src = sources."ros2pkg";
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
