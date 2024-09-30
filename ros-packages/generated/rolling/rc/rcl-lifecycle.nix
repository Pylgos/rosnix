{
  ament-cmake-gen-version-h,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  osrf-testing-tools-cpp,
  rcl,
  rcutils,
  rmw,
  rosSystemPackages,
  rosidl-runtime-c,
  substituteSource,
  tracetools,
}:
let
  sources = mkSourceSet (sources: {
    "rcl_lifecycle" = substituteSource {
      src = fetchgit {
        name = "rcl_lifecycle-source";
        url = "https://github.com/ros2-gbp/rcl-release.git";
        rev = "097c2e0ef9f887ca6def7a3b86cf4ec181de5017";
        hash = "sha256-gOUlGVmqmO0WUkYBNnpvVEmx16+rYfts9EZ/qGc2DQ4=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rcl_lifecycle";
  version = "9.4.1-1";
  src = sources."rcl_lifecycle";
  nativeBuildInputs = [ ament-cmake-gen-version-h ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ lifecycle-msgs rcl rcutils rmw rosidl-runtime-c tracetools ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common osrf-testing-tools-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package containing a C-based lifecycle implementation";
  };
}
