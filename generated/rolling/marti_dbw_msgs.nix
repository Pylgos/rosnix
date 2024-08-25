{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    marti_dbw_msgs = substituteSource {
      src = fetchgit {
        name = "marti_dbw_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "00cd7713d109e30a69aae406738a0997aebf708c";
        hash = "sha256-IFGu2uK2abEs/qt9iAS6cnD4Gw0J992QGZsRWDkTxMM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_dbw_msgs";
  version = "1.6.0-1";
  src = sources.marti_dbw_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "marti_dbw_msgs";
  };
}
