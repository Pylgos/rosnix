{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    example_interfaces = substituteSource {
      src = fetchgit {
        name = "example_interfaces-source";
        url = "https://github.com/ros2-gbp/example_interfaces-release.git";
        rev = "7b504cc01ddad6288771bb716451c6f4f7f6c51d";
        hash = "sha256-mRegvkQKSsJH6SsUNhDlJidkIxKojf6U4GltTKF0oAY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "example_interfaces";
  version = "0.12.0-3";
  src = sources.example_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Contains message and service definitions used by the examples.";
  };
}
