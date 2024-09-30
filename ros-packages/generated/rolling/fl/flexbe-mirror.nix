{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe-core,
  flexbe-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "flexbe_mirror" = substituteSource {
      src = fetchgit {
        name = "flexbe_mirror-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "0aa3c774f94481c78971d6c876c2da1ff9d5f28a";
        hash = "sha256-SSn47+ekb/7OgTTqqklfqRhzbO2J+7heIZotvzRPa9c=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "flexbe-mirror";
  version = "3.0.3-1";
  src = sources."flexbe_mirror";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ flexbe-core flexbe-msgs rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "flexbe_mirror implements functionality to remotely mirror an executed behavior.";
  };
}