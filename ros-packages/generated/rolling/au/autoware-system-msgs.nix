{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  builtin-interfaces,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
  unique-identifier-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "autoware_system_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_system_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "0c21e87cb893949350ab5663f97ebfe7a4529850";
        hash = "sha256-hbYa4pl/hLWUDxk+gN234i8Vz2MlS3Jfi1xp8aHXvqY=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "autoware_system_msgs";
  version = "1.1.0-1";
  src = sources."autoware_system_msgs";
  nativeBuildInputs = [ ament-cmake-auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces diagnostic-msgs geometry-msgs nav-msgs rosidl-default-runtime std-msgs unique-identifier-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Autoware system messages package.";
  };
}
