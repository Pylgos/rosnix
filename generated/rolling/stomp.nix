{
  buildRosPackage,
  cmake,
  console-bridge,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  ros_industrial_cmake_boilerplate,
  substituteSource,
}:
let
  sources = rec {
    stomp = substituteSource {
      src = fetchgit {
        name = "stomp-source";
        url = "https://github.com/ros2-gbp/stomp-release.git";
        rev = "f34537da09d99cc27b25f1a307e6ecb5cac30631";
        hash = "sha256-SMIxIQFBhVkKNSvnxdsAWw5pg4rc6p5xSsSck1Ig4Y8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "stomp";
  version = "0.1.2-3";
  src = sources.stomp;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ console-bridge eigen ros_industrial_cmake_boilerplate ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ gtest ];
  missingDependencies = [  ];
  meta = {
    description = "This package provides the STOMP (Stochastic Trajectory Optimization for Motion Planning) algorithm that can be used for robot motion planning tasks or other similar optimization tasks";
  };
}
