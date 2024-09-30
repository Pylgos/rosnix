{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  bond,
  bondcpp,
  buildRosPackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lifecycle-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-msgs,
  rcl-interfaces,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  test-msgs,
  tf2,
  tf2-geometry-msgs,
  tf2-msgs,
  tf2-ros,
}:
let
  sources = mkSourceSet (sources: {
    "nav2_util" = substituteSource {
      src = fetchgit {
        name = "nav2_util-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "6492242b8d0928be620a9e5e5642dcda59da41db";
        hash = "sha256-6u+FXfsXDlMcYfZjJy27TrFFUak4cCRrSK3vq7LGC1A=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "nav2_util";
  version = "1.3.2-1";
  src = sources."nav2_util";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ bond bondcpp builtin-interfaces geometry-msgs lifecycle-msgs nav2-common nav2-msgs nav-msgs rcl-interfaces rclcpp rclcpp-action rclcpp-lifecycle std-msgs tf2 tf2-geometry-msgs tf2-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common std-srvs test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Nav2 utilities";
  };
}
