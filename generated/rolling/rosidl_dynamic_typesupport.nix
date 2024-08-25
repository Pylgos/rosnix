{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rcutils,
  rosidl_runtime_c,
  substituteSource,
}:
let
  sources = rec {
    rosidl_dynamic_typesupport = substituteSource {
      src = fetchgit {
        name = "rosidl_dynamic_typesupport-source";
        url = "https://github.com/ros2-gbp/rosidl_dynamic_typesupport-release.git";
        rev = "3b1c0a96815326ef61f93a5540755a2045121b12";
        hash = "sha256-cxUaFspLddpCcGHuK1GeiWTVVg8IMknpJ/V5ATpBQgE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_dynamic_typesupport";
  version = "0.2.0-1";
  src = sources.rosidl_dynamic_typesupport;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcutils rosidl_runtime_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Unified serialization support interface for dynamic typesupport in C.";
  };
}
