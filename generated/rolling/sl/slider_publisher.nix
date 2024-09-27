{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rqt_gui_py,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    slider_publisher-d628ed2b9a8034affc7aa6da4127bfea724f26ad = substituteSource {
      src = fetchgit {
        name = "slider_publisher-d628ed2b9a8034affc7aa6da4127bfea724f26ad-source";
        url = "https://github.com/ros2-gbp/slider_publisher-release.git";
        rev = "d628ed2b9a8034affc7aa6da4127bfea724f26ad";
        hash = "sha256-t3ye55W5XqkQUd/eAabhQKJUazIAi3ly0BsO7vpuHu4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "slider_publisher";
  version = "2.3.1-2";
  src = sources.slider_publisher-d628ed2b9a8034affc7aa6da4127bfea724f26ad;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rqt_gui_py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-scipy" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This packages proposes a slider-based publisher node similar to the joint_state_publisher, but that can publish any type of message or call services.";
  };
}
