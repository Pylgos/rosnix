{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "autoware_cmake" = substituteSource {
      src = fetchgit {
        name = "autoware_cmake-source";
        url = "https://github.com/ros2-gbp/autoware_cmake-release.git";
        rev = "a5b2d0fd0287fd4074a390357cb8408ca535fe4f";
        hash = "sha256-uNWJEFHdKrWaAM3S5MTv2SI5xia8uBU4BdoPu0+jjpc=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "autoware_cmake";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."autoware_cmake";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake-auto ament-lint-auto ros-environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-cmake-auto ament-lint-auto ros-environment ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto autoware-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "CMake scripts for Autoware";
  };
})
