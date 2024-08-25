{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  soccer_vision_2d_msgs,
  soccer_vision_3d_msgs,
  soccer_vision_attribute_msgs,
  substituteSource,
}:
let
  sources = rec {
    soccer_interfaces = substituteSource {
      src = fetchgit {
        name = "soccer_interfaces-source";
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
  src = sources.soccer_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ soccer_vision_2d_msgs soccer_vision_3d_msgs soccer_vision_attribute_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Metapackage for soccer-related interfaces";
  };
}
