{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  launch-testing,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-msgs,
  nav2-util,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2,
  yaml-cpp-vendor,
}:
let
  sources = mkSourceSet (sources: {
    "nav2_map_server" = substituteSource {
      src = fetchgit {
        name = "nav2_map_server-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "242cd7b500f8ee1e1643e23c5c23d555d0a771bc";
        hash = "sha256-9iuttQnHiojNNGOtNYUzkiYhXf3jgkgbu1UHA5ZIEcE=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_map_server";
  version = "1.3.3-1";
  src = finalAttrs.passthru.sources."nav2_map_server";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ launch-ros launch-testing nav2-common nav2-msgs nav2-util nav-msgs rclcpp rclcpp-lifecycle std-msgs tf2 yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "graphicsmagick" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common launch launch-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Refactored map server for ROS2 Navigation";
  };
})
