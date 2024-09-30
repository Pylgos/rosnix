{
  ament-cmake,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  performance-test-fixture,
  rcutils,
  rosSystemPackages,
  rosidl-typesupport-interface,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rosidl_runtime_c" = substituteSource {
      src = fetchgit {
        name = "rosidl_runtime_c-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "c9f71b76ce2957db0d32271093b471f602806085";
        hash = "sha256-LsBMOCV/d7waCHAY7ujB/d/xZgJPHutOM3r+tsECVO0=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rosidl_runtime_c";
  version = "4.8.1-1";
  src = sources."rosidl_runtime_c";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rcutils rosidl-typesupport-interface ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common performance-test-fixture ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides definitions, initialization and finalization functions, and macros for getting and working with rosidl typesupport types in C.";
  };
}
