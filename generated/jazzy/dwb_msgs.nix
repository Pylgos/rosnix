{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_2d_msgs,
  nav_msgs,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    dwb_msgs = substituteSource {
      src = fetchgit {
        name = "dwb_msgs-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "60b144db7804f985ad1d060b80f6e0ba7199e8b1";
        hash = "sha256-95/XZWlJACz0Y4hy1HVEhleHpQ0iFQPTU7KmByY3IBY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dwb_msgs";
  version = "1.3.1-1";
  src = sources.dwb_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs nav_2d_msgs nav_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Message/Service definitions specifically for the dwb_core";
  };
}
