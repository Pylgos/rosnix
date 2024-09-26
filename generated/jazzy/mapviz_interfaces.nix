{
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  marti_common_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    mapviz_interfaces = substituteSource {
      src = fetchgit {
        name = "mapviz_interfaces-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "1814b69b518a8d50136f1c58935b5d01b4489332";
        hash = "sha256-69Y5+FasOKVL+kZGv8GjgS4SHUvQb42Cr12PmzVZngY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mapviz_interfaces";
  version = "2.4.3-1";
  src = sources.mapviz_interfaces;
  nativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces marti_common_msgs rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS interfaces used by Mapviz";
  };
}