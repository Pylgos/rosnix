{
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  octomap-msgs,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
}:
let
  sources = mkSourceSet (sources: {
    "octomap_ros" = substituteSource {
      src = fetchgit {
        name = "octomap_ros-source";
        url = "https://github.com/ros2-gbp/octomap_ros-release.git";
        rev = "d6af3a1fb64520d96be193b149c9e36fd856f25b";
        hash = "sha256-O2xNJ++3IWtObx9amtFyVhAFiV1CMHlVbRq43ZawhE0=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "octomap_ros";
  version = "0.4.4-1";
  src = finalAttrs.passthru.sources."octomap_ros";
  nativeBuildInputs = [ ament-cmake-auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ octomap-msgs sensor-msgs tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liboctomap-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "octomap_ros provides conversion functions between ROS and OctoMap's native types. This enables a convenvient use of the octomap package in ROS.";
  };
})
