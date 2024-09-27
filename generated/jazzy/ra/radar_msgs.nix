{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  std_msgs,
  substituteSource,
  unique_identifier_msgs,
}:
let
  sources = rec {
    radar_msgs-6c0b968beda9b9ca9623b7b2bea09a66ecf9f8de = substituteSource {
      src = fetchgit {
        name = "radar_msgs-6c0b968beda9b9ca9623b7b2bea09a66ecf9f8de-source";
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
  src = sources.radar_msgs-6c0b968beda9b9ca9623b7b2bea09a66ecf9f8de;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs std_msgs unique_identifier_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Standard ROS messages for radars";
  };
}
