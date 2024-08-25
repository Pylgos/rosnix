{
  ament_cmake,
  buildRosPackage,
  ds_dbw_can,
  ds_dbw_joystick_demo,
  ds_dbw_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ds_dbw = substituteSource {
      src = fetchgit {
        name = "ds_dbw-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "b0f9bc0949d6f32e555217540c01b64be7d07c93";
        hash = "sha256-/iPbk8zWWB13NvZWrh8DJAyLsvg5YVa7fb3NNzIx6cA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ds_dbw";
  version = "2.2.0-1";
  src = sources.ds_dbw;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ds_dbw_can ds_dbw_joystick_demo ds_dbw_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Interface to the Dataspeed Inc. Drive-By-Wire kits";
  };
}
