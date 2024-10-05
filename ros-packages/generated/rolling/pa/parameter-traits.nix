{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rsl,
  substituteSource,
  tcb-span,
  tl-expected,
}:
let
  sources = mkSourceSet (sources: {
    "parameter_traits" = substituteSource {
      src = fetchgit {
        name = "parameter_traits-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "bf881491b34e30670849b57e5c49382c52c72b6d";
        hash = "sha256-tbkbI2Z5iOPtVMur4gJQVJQ+af59uhEZt7UNahBZ01I=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "parameter_traits";
  version = "0.3.8-3";
  src = finalAttrs.passthru.sources."parameter_traits";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rsl tcb-span tl-expected ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Functions and types for rclcpp::Parameter";
  };
})
