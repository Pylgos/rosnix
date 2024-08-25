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
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    marti_nav_msgs = substituteSource {
      src = fetchgit {
        name = "marti_nav_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "42859754b66b52e622ff2099297224634bf5b232";
        hash = "sha256-x6glCsDG7BGUcQEkG8MCZEko04QgkEKF+X9wgPo6kT8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_nav_msgs";
  version = "1.6.0-1";
  src = sources.marti_nav_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geographic_msgs geometry_msgs marti_common_msgs rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "marti_nav_msgs";
  };
}
