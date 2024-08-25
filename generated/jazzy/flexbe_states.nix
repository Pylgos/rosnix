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
  flexbe_testing,
  geometry_msgs,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    flexbe_states = substituteSource {
      src = fetchgit {
        name = "flexbe_states-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "bf1958c7b02732f3092c6c868df978a05622c2c5";
        hash = "sha256-9nCf5YRLrdFBBRGVTkMGtiBfcHoiWNVdCLwqKnaSv3k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_states";
  version = "3.0.3-1";
  src = sources.flexbe_states;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_core flexbe_msgs flexbe_testing rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 geometry_msgs python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "flexbe_states provides a collection of common generic predefined states.";
  };
}
