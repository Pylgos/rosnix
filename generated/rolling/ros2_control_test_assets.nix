{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ros2_control_test_assets = substituteSource {
      src = fetchgit {
        name = "ros2_control_test_assets-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "470b9e961c3e1585b892926f10f266651dc36d29";
        hash = "sha256-CqrVOxj1WVNvrks61IjApCmxrLxl0hzUEokFX6m1PFs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2_control_test_assets";
  version = "4.16.0-1";
  src = sources.ros2_control_test_assets;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The package provides shared test resources for ros2_control stack";
  };
}
