{
  ament-cmake,
  buildRosPackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  std-msgs,
  substituteSource,
  unique-identifier-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "radar_msgs" = substituteSource {
      src = fetchgit {
        name = "radar_msgs-source";
        url = "https://github.com/ros2-gbp/radar_msgs-release.git";
        rev = "6c0b968beda9b9ca9623b7b2bea09a66ecf9f8de";
        hash = "sha256-HO0hAoc99su0O3J40Mywg7/qtbQJof/b5/wwBnx6xbI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "radar-msgs";
  version = "0.2.2-4";
  src = sources."radar_msgs";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs std-msgs unique-identifier-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Standard ROS messages for radars";
  };
}