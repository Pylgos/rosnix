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
    mapviz_interfaces-3a23dd0f1d7f400364a73c54985ad221039a05d9 = substituteSource {
      src = fetchgit {
        name = "mapviz_interfaces-3a23dd0f1d7f400364a73c54985ad221039a05d9-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "3a23dd0f1d7f400364a73c54985ad221039a05d9";
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
  src = sources.mapviz_interfaces-3a23dd0f1d7f400364a73c54985ad221039a05d9;
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
