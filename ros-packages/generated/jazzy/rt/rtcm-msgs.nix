{
  ament-cmake,
  ament-lint-common,
  buildRosPackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rtcm_msgs" = substituteSource {
      src = fetchgit {
        name = "rtcm_msgs-source";
        url = "https://github.com/ros2-gbp/rtcm_msgs-release.git";
        rev = "3e17a8d363a51a20a0d8d6eb0af1879e2adf2fee";
        hash = "sha256-5yTtIdGostlOwChSlKKL4JivCyK284g0KYZxB6GBtBY=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rtcm_msgs";
  version = "1.1.6-4";
  src = sources."rtcm_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The rtcm_msgs package contains messages related to data in the RTCM format.";
  };
}
