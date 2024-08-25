{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ds_dbw_msgs = substituteSource {
      src = fetchgit {
        name = "ds_dbw_msgs-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "8b653fd477412073e337d5a66ee294804db65537";
        hash = "sha256-7G4Xe5VY7MPMmN8Ub/f0c5Vb5lCbAUmuC5E5RvQUKNQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ds_dbw_msgs";
  version = "2.2.0-1";
  src = sources.ds_dbw_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Drive-by-wire messages";
  };
}
