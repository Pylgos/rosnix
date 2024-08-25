{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosapi,
  rosbridge_library,
  rosbridge_server,
  substituteSource,
}:
let
  sources = rec {
    rosbridge_suite = substituteSource {
      src = fetchgit {
        name = "rosbridge_suite-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "7259f925429829be861d8d96d1946e6923e61f80";
        hash = "sha256-MWpailueIvylSaPCRcXsKgmzpatxkZq+HsJMGXnMUPs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbridge_suite";
  version = "1.3.2-3";
  src = sources.rosbridge_suite;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosapi rosbridge_library rosbridge_server ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Rosbridge provides a JSON API to ROS functionality for non-ROS programs. There are a variety of front ends that interface with rosbridge, including a WebSocket server for web browsers to interact with. Rosbridge_suite is a meta-package containing rosbridge, various front end packages for rosbridge like a WebSocket package, and helper packages.";
  };
}
