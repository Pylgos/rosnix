{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  buildRosPackage,
  composition-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  lifecycle-msgs,
  mkSourceSet,
  osrf-pycommon,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "launch_ros" = substituteSource {
      src = fetchgit {
        name = "launch_ros-source";
        url = "https://github.com/ros2-gbp/launch_ros-release.git";
        rev = "80640e6394ae66a05d6fbe44ec3d06b2427ca037";
        hash = "sha256-0WnYve+wHC5hnSgtfmrjeMkl0t9ty5QnblgkvXrU5Do=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "launch_ros";
  version = "0.27.2-1";
  src = sources."launch_ros";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-index-python composition-interfaces launch lifecycle-msgs osrf-pycommon rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "ROS specific extensions to the launch tool.";
  };
}
