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
    marti_can_msgs-17885ffb343ff0f31797279aa61e9f0123773509 = substituteSource {
      src = fetchgit {
        name = "marti_can_msgs-17885ffb343ff0f31797279aa61e9f0123773509-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "17885ffb343ff0f31797279aa61e9f0123773509";
        hash = "sha256-UXkL8nLeSUw2UtfM+OmwG+nVy6UgHvo+FUNAnEyzdvA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_can_msgs";
  version = "1.6.1-1";
  src = sources.marti_can_msgs-17885ffb343ff0f31797279aa61e9f0123773509;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "marti_can_msgs";
  };
}
