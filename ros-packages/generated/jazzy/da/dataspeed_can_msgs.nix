{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "dataspeed_can_msgs" = substituteSource {
      src = fetchgit {
        name = "dataspeed_can_msgs-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "813295ba4c130401c982a60ca3ae833f09c19574";
        hash = "sha256-8QGJsXI1z8efys9ddy0nitdfNWQR1djGhG+XBQHMqBo=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "dataspeed_can_msgs";
  version = "2.0.4-1";
  src = sources."dataspeed_can_msgs";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Controller Area Network (CAN) messages";
  };
}