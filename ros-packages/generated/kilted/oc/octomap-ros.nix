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
buildAmentCmakePackage (finalAttrs: {
  pname = "octomap_ros";
  version = "0.4.4-2";
  src = finalAttrs.passthru.sources."octomap_ros";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ octomap-msgs sensor-msgs tf2 ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "liboctomap-dev" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ octomap-msgs sensor-msgs tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liboctomap-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "octomap_ros" = substituteSource {
      src = fetchgit {
        name = "octomap_ros-source";
        url = "https://github.com/ros2-gbp/octomap_ros-release.git";
        rev = "ef1353c3f2a5aba83fc35758662dae515a6178ca";
        hash = "sha256-O2xNJ++3IWtObx9amtFyVhAFiV1CMHlVbRq43ZawhE0=";
      };
    };
  });
  meta = {
    description = "\n    octomap_ros provides conversion functions between ROS and OctoMap's native types.\n    This enables a convenvient use of the octomap package in ROS.\n  ";
  };
})
