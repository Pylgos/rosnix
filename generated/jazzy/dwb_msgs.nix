{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_2d_msgs,
  nav_msgs,
  rosSystemPackages,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    dwb_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "dwb_msgs-source";
        owner = "SteveMacenski";
        repo = "navigation2-release";
        rev = "1dc28380a90258ff5deef89dcb84eda522a426f8";
        hash = "sha256-9HSAL6xB2YdYGmB4n8g0hReYRJn4I0vCb65YjT60tS4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dwb_msgs";
  version = "1.3.2-1";
  src = sources.dwb_msgs;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs nav_2d_msgs nav_msgs rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Message/Service definitions specifically for the dwb_core";
  };
}
