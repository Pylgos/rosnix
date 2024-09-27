{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  geometry_msgs,
  marti_common_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    marti_nav_msgs-110d1184aeab85ae7572797b86bed47423ca1341 = substituteSource {
      src = fetchgit {
        name = "marti_nav_msgs-110d1184aeab85ae7572797b86bed47423ca1341-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "110d1184aeab85ae7572797b86bed47423ca1341";
        hash = "sha256-WC74STLyXxQWjttsVnjyGJBkUwtFtgJmR+gAEla3CT0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_nav_msgs";
  version = "1.6.1-1";
  src = sources.marti_nav_msgs-110d1184aeab85ae7572797b86bed47423ca1341;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geographic_msgs geometry_msgs marti_common_msgs rosidl_default_runtime sensor_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "marti_nav_msgs";
  };
}
