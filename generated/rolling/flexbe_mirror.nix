{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe_core,
  flexbe_msgs,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    flexbe_mirror = substituteSource {
      src = fetchgit {
        name = "flexbe_mirror-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "0aa3c774f94481c78971d6c876c2da1ff9d5f28a";
        hash = "sha256-SSn47+ekb/7OgTTqqklfqRhzbO2J+7heIZotvzRPa9c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_mirror";
  version = "3.0.3-1";
  src = sources.flexbe_mirror;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_core flexbe_msgs rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "flexbe_mirror implements functionality to remotely mirror an executed behavior.";
  };
}
