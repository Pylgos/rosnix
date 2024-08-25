{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  std_msgs,
  substituteSource,
  unique_identifier_msgs,
}:
let
  sources = rec {
    radar_msgs = substituteSource {
      src = fetchgit {
        name = "radar_msgs-source";
        url = "https://github.com/ros2-gbp/radar_msgs-release.git";
        rev = "6c0b968beda9b9ca9623b7b2bea09a66ecf9f8de";
        hash = "sha256-HO0hAoc99su0O3J40Mywg7/qtbQJof/b5/wwBnx6xbI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "radar_msgs";
  version = "0.2.2-4";
  src = sources.radar_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs std_msgs unique_identifier_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Standard ROS messages for radars";
  };
}
