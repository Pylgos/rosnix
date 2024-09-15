{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    apriltag_mit = substituteSource {
      src = fetchgit {
        name = "apriltag_mit-source";
        url = "https://github.com/ros2-gbp/apriltag_mit-release.git";
        rev = "89e951d0a021d4bd34e3e4a08c284d9900f8527e";
        hash = "sha256-empCymlI7H+qqAhv0s2eIvKNYkDlQvJ94tqm8LfbhPY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apriltag_mit";
  version = "1.0.2-1";
  src = sources.apriltag_mit;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "clang-tidy" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libboost-dev" "libopencv-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS2 package wrapper for the MIT apriltag detector";
  };
}
