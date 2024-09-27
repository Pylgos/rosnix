{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    gps_msgs-f572d023b466c3b5960fd5629951424b5344b677 = substituteSource {
      src = fetchgit {
        name = "gps_msgs-f572d023b466c3b5960fd5629951424b5344b677-source";
        url = "https://github.com/ros2-gbp/gps_umd-release.git";
        rev = "f572d023b466c3b5960fd5629951424b5344b677";
        hash = "sha256-1RkI1XM2+N+2B6AXCDVx6WfEhwXaU/PIHvKOB0B9q1Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gps_msgs";
  version = "2.0.3-2";
  src = sources.gps_msgs-f572d023b466c3b5960fd5629951424b5344b677;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "GPS messages for use in GPS drivers";
  };
}
