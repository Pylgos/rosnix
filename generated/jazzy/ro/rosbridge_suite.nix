{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosapi,
  rosbridge_library,
  rosbridge_server,
  substituteSource,
}:
let
  sources = rec {
    rosbridge_suite-7259f925429829be861d8d96d1946e6923e61f80 = substituteSource {
      src = fetchgit {
        name = "rosbridge_suite-7259f925429829be861d8d96d1946e6923e61f80-source";
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
  src = sources.rosbridge_suite-7259f925429829be861d8d96d1946e6923e61f80;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosapi rosbridge_library rosbridge_server ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Rosbridge provides a JSON API to ROS functionality for non-ROS programs. There are a variety of front ends that interface with rosbridge, including a WebSocket server for web browsers to interact with. Rosbridge_suite is a meta-package containing rosbridge, various front end packages for rosbridge like a WebSocket package, and helper packages.";
  };
}
