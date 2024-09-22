{
  ament_cmake_ros,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rcutils,
  rosSystemPackages,
  rosidl_runtime_c,
  substituteSource,
}:
let
  sources = rec {
    rosidl_dynamic_typesupport = substituteSource {
      src = fetchFromGitHub {
        name = "rosidl_dynamic_typesupport-source";
        owner = "ros2-gbp";
        repo = "rosidl_dynamic_typesupport-release";
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
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rcutils rosidl_runtime_c ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Unified serialization support interface for dynamic typesupport in C.";
  };
}
