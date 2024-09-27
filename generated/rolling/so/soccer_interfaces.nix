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
    soccer_interfaces-b358a9e2bdbc9f45a07ae1cf636a165f52a0e686 = substituteSource {
      src = fetchgit {
        name = "soccer_interfaces-b358a9e2bdbc9f45a07ae1cf636a165f52a0e686-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "b358a9e2bdbc9f45a07ae1cf636a165f52a0e686";
        hash = "sha256-Qyw6VmsZdw+IhJM06b4fGhTFvxrT63DWIjEjqtmU8oI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_interfaces";
  version = "1.0.0-1";
  src = sources.soccer_interfaces-b358a9e2bdbc9f45a07ae1cf636a165f52a0e686;
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
