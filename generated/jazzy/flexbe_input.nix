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
    flexbe_input = substituteSource {
      src = fetchgit {
        name = "flexbe_input-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "15e469e007b5664e9321f2a291e2a952409147b5";
        hash = "sha256-zcBWjs46lO3Mn9pE3mtDK1mqO1tF+F2iToPqTvFECY4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_input";
  version = "3.0.3-1";
  src = sources.flexbe_input;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_core flexbe_msgs rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "flexbe_input enables to send data to onboard behavior when required.";
  };
}
