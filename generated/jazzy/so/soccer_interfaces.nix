{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  soccer_vision_2d_msgs,
  soccer_vision_3d_msgs,
  soccer_vision_attribute_msgs,
  substituteSource,
}:
let
  sources = rec {
    soccer_interfaces-487f6200cb1c1e90d8270b7631a4a64a8236a437 = substituteSource {
      src = fetchgit {
        name = "soccer_interfaces-487f6200cb1c1e90d8270b7631a4a64a8236a437-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "487f6200cb1c1e90d8270b7631a4a64a8236a437";
        hash = "sha256-Qyw6VmsZdw+IhJM06b4fGhTFvxrT63DWIjEjqtmU8oI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_interfaces";
  version = "1.0.0-2";
  src = sources.soccer_interfaces-487f6200cb1c1e90d8270b7631a4a64a8236a437;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ soccer_vision_2d_msgs soccer_vision_3d_msgs soccer_vision_attribute_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Metapackage for soccer-related interfaces";
  };
}
