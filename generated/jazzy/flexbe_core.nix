{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe_msgs,
  launch_ros,
  launch_testing,
  rclpy,
  rosSystemPackages,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_ros_py,
}:
let
  sources = rec {
    flexbe_core = substituteSource {
      src = fetchgit {
        name = "flexbe_core-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "237e2098a1e767209cf6aa0806947e9d68ae024c";
        hash = "sha256-H4Wrtmbl6nwhcBJBbA+XtOkHJnDhvtGLfec0Qz0K99g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_core";
  version = "3.0.3-1";
  src = sources.flexbe_core;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ flexbe_msgs rclpy std_msgs std_srvs tf2_ros_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 launch_ros launch_testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "flexbe_core provides the core components for the FlexBE behavior engine.";
  };
}
