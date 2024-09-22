{
  ament_cmake,
  ament_cmake_python,
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe_core,
  flexbe_mirror,
  flexbe_msgs,
  flexbe_onboard,
  launch_ros,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    flexbe_widget = substituteSource {
      src = fetchgit {
        name = "flexbe_widget-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "a976af98c5dd325ea57efae2faf6097620c33fac";
        hash = "sha256-JDdAs26UU39Hp/4i314mPuzJ2ZT957pRGJ/i8u9zW6I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_widget";
  version = "3.0.3-1";
  src = sources.flexbe_widget;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ flexbe_core flexbe_mirror flexbe_msgs flexbe_onboard launch_ros rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "flexbe_widget implements some smaller scripts for the behavior engine.";
  };
}
