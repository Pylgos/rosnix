{
  ament-cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rqt-gui-py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "slider_publisher" = substituteSource {
      src = fetchgit {
        name = "slider_publisher-source";
        url = "https://github.com/ros2-gbp/slider_publisher-release.git";
        rev = "8987416044584eb2e10d013016a80b431a5f0265";
        hash = "sha256-t3ye55W5XqkQUd/eAabhQKJUazIAi3ly0BsO7vpuHu4=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "slider_publisher";
  version = "2.3.1-3";
  src = sources."slider_publisher";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rqt-gui-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-scipy" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This packages proposes a slider-based publisher node similar to the joint_state_publisher, but that can publish any type of message or call services.";
  };
}
