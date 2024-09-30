{
  ament-cmake,
  ament-cmake-python,
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe-core,
  flexbe-mirror,
  flexbe-msgs,
  flexbe-onboard,
  launch-ros,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "flexbe_widget" = substituteSource {
      src = fetchgit {
        name = "flexbe_widget-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "ce31f66657d5a4e49e0842f6915ae5a51baca4d5";
        hash = "sha256-JDdAs26UU39Hp/4i314mPuzJ2ZT957pRGJ/i8u9zW6I=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "flexbe_widget";
  version = "3.0.3-1";
  src = sources."flexbe_widget";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ flexbe-core flexbe-mirror flexbe-msgs flexbe-onboard launch-ros rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "flexbe_widget implements some smaller scripts for the behavior engine.";
  };
}
