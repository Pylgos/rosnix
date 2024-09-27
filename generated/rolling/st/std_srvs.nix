{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    std_srvs-08515a4af1637209ef330a1f54bf88224f8606b4 = substituteSource {
      src = fetchgit {
        name = "std_srvs-08515a4af1637209ef330a1f54bf88224f8606b4-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "08515a4af1637209ef330a1f54bf88224f8606b4";
        hash = "sha256-LQSxnV1r2+ii3xUcLThhlzxUVKFvnXogcm0OV20AHSw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "std_srvs";
  version = "5.4.1-1";
  src = sources.std_srvs-08515a4af1637209ef330a1f54bf88224f8606b4;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package containing some standard service definitions.";
  };
}
