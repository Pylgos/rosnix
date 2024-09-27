{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  geometry_msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  shape_msgs,
  std_msgs,
  substituteSource,
  unique_identifier_msgs,
}:
let
  sources = mkSourceSet (sources: {
    "autoware_adapi_v1_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_adapi_v1_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_adapi_msgs-release.git";
        rev = "5b4fd78663bd8c77f2a944341b129ebbc0de4beb";
        hash = "sha256-5jgqVvAOI02ArN1EDxTdvc/F1f4E/LDkN9nPbnHYSQI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "autoware_adapi_v1_msgs";
  version = "1.3.0-1";
  src = sources."autoware_adapi_v1_msgs";
  nativeBuildInputs = [ ament_cmake_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geographic_msgs geometry_msgs rosidl_default_runtime shape_msgs std_msgs unique_identifier_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The Autoware AD API interfaces";
  };
}
