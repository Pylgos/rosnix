{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe_core,
  flexbe_input,
  flexbe_mirror,
  flexbe_msgs,
  flexbe_onboard,
  flexbe_states,
  flexbe_testing,
  flexbe_widget,
  substituteSource,
}:
let
  sources = rec {
    flexbe_behavior_engine = substituteSource {
      src = fetchgit {
        name = "flexbe_behavior_engine-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "7bba4017945659d7c661bf76c3e165c9219678e4";
        hash = "sha256-l9yTnBvmIxQL5DNjo75+SegiknEw20p8+lO43JC6KaA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_behavior_engine";
  version = "3.0.3-1";
  src = sources.flexbe_behavior_engine;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_core flexbe_input flexbe_mirror flexbe_msgs flexbe_onboard flexbe_states flexbe_testing flexbe_widget ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "A meta-package to aggregate all the FlexBE packages";
  };
}
